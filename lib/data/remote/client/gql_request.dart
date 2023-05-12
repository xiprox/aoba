import 'dart:isolate';

import 'package:aoba/data/model/resource.dart';
import 'package:aoba/init.dart';
import 'package:aoba/services/services.dart';
import 'package:collection/collection.dart';
import 'package:graphql/client.dart';

class GqlRequest {
  static Future<Resource<T>> query<T>(
    QueryOptions options, {
    required T Function(Map<String, dynamic> data) fromJson,
  }) async {
    final response = await Isolate.run(() => _query(options));
    return await _parseResponse<T>(response, fromJson: fromJson);
  }

  static Future<Resource<T>> mutation<T>(
    MutationOptions options, {
    required T Function(Map<String, dynamic> data) fromJson,
  }) async {
    final response = await Isolate.run(() => _mutation(options));
    return await _parseResponse<T>(response, fromJson: fromJson);
  }

  static Future<Resource<T>> _parseResponse<T>(
    QueryResult<Object?> response, {
    required T Function(Map<String, dynamic> data) fromJson,
  }) async {
    if (response.data != null) {
      final deserialized = await Isolate.run(
        () => _deserialize<T>(fromJson, response.data!),
      );
      return Resource(data: deserialized);
    } else if (response.exception != null) {
      return Resource(
        error: ErrorInfo(
          message: _parseErrorMessage(response.exception!),
          exception: response.exception,
        ),
      );
    } else {
      return Resource(
        error: ErrorInfo(message: response.toString()),
      );
    }
  }

  static String? _parseErrorMessage(OperationException exception) {
    if (exception.linkException != null) {
      final excp = exception.linkException;

      if (excp is ServerException) {
        final errors = excp.parsedResponse?.response['errors'] as List;
        final first = errors.firstOrNull;

        String? message;
        if (first['message'] == 'validation') {
          message = first['validation']?.values?.first?.first?.toString();
        }

        return message ??
            excp.parsedResponse?.errors?.map((e) => e.message).join('\n');
      } else {
        return excp?.originalException?.toString();
      }
    } else {
      return exception.graphqlErrors.map((e) => e.message).join('\n');
    }
  }

  static Future<QueryResult> _mutation<T>(MutationOptions options) async {
    if (!IsolateInit.initialized) await IsolateInit.init(isRootIsolate: false);
    return client.client.mutate(options);
  }

  static Future<QueryResult> _query<T>(QueryOptions options) async {
    if (!IsolateInit.initialized) await IsolateInit.init(isRootIsolate: false);
    return client.client.query(options);
  }

  static T _deserialize<T>(
      T Function(Map<String, dynamic>) fromJson, Map<String, dynamic> json) {
    return fromJson(json);
  }
}
