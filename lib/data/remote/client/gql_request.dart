import 'package:aoba/data/model/resource.dart';
import 'package:aoba/init.dart';
import 'package:aoba/services/services.dart';
import 'package:flextensions/flextensions.dart';
import 'package:graphql/client.dart';

class GqlRequest {
  static Future<Resource<T>> query<T>(
    QueryOptions options, {
    required String? accessToken,
    required T Function(Map<String, dynamic> data) fromJson,
  }) async {
    final response = await Executor().execute(
      fun2: _query,
      arg1: options,
      arg2: accessToken,
    );
    if (response.data != null) {
      final deserialized = await Executor().execute(
        fun2: _deserialize<T>,
        arg1: fromJson,
        arg2: response.data!,
      );
      return Resource.success(deserialized);
    } else if (response.exception != null) {
      return Resource.exception(response.exception!);
    } else {
      return Resource.error(response.toString());
    }
  }

  static Future<QueryResult> _query<T>(
    QueryOptions options,
    String? accessToken,
    TypeSendPort port,
  ) async {
    if (!IsolateInit.initialized) await IsolateInit.init(isRootIsolate: false);
    get<Credentials>().as<CredentialsInIsolate>().accessToken = accessToken;
    return client.client.query(options);
  }

  static T _deserialize<T>(
    T Function(Map<String, dynamic>) fromJson,
    Map<String, dynamic> json,
    TypeSendPort port,
  ) {
    return fromJson(json);
  }
}
