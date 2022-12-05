import 'dart:io';

import 'package:aoba/data/model/resource.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$ErrorInfo -', () {
    test('Contains the given values', () async {
      const message = 'mess';
      const exception = FileSystemException('geh');
      final stack = StackTrace.current;
      final error = ErrorInfo(
        message: message,
        exception: exception,
        stackTrace: stack,
      );
      expect(error.message, message);
      expect(error.exception, exception);
      expect(error.stackTrace, stack);
    });

    test(
      'When "exception" is $SocketException, "isConnectionError" returns true ',
      () async {
        var error = const ErrorInfo(exception: FormatException('wow'));
        expect(error.isConnectionError, false);
        error = const ErrorInfo(exception: SocketException('notwow'));
        expect(error.isConnectionError, true);
      },
    );
  });

  group('$Resource -', () {
    test('Contains the given values', () async {
      const loading = true;
      const data = 'data';
      const error = ErrorInfo(message: 'error');
      var resource = const Resource(loading: loading, data: data, error: error);
      expect(resource.isLoading, loading);
      expect(resource.data, data);
      expect(resource.error, error);
    });

    test('"isLoading" returns the value given in constructor', () async {
      var resource = const Resource(loading: false);
      expect(resource.isLoading, false);
      resource = const Resource(loading: true);
      expect(resource.isLoading, true);
    });

    test('"toString" contains the correct values', () async {
      const loading = true;
      const data = 'data';
      const error = ErrorInfo(message: 'error');
      const resource = Resource(loading: loading, data: data, error: error);
      expect(
        resource.toString(),
        '{isLoading: $loading, error: $error, data: $data}',
      );
    });

    test('"copyWith" uses existing values when no argument passed', () async {
      const loading = true;
      const data = 'data';
      const error = ErrorInfo(message: 'error');
      const resource = Resource(loading: loading, data: data, error: error);
      final copied = resource.copyWith();
      expect(copied.isLoading, loading);
      expect(copied.data, data);
      expect(copied.error, error);
    });

    test('"copyWith" prefers parameter values', () async {
      const loading = true;
      const data = 'data';
      const error = ErrorInfo(message: 'error');
      const resource = Resource(loading: false, data: 'old data', error: null);
      final copied = resource.copyWith(
        loading: loading,
        data: data,
        error: error,
      );
      expect(copied.isLoading, loading);
      expect(copied.data, data);
      expect(copied.error, error);
    });

    test('"transform" calls transformer when data is not null', () async {
      bool called = false;

      void transformer(String data) => called = true;

      const noDataResource = Resource<String>(data: null);
      noDataResource.transform(transformer);
      expect(called, false);

      const resource = Resource<String>(data: 'DATA');
      resource.transform(transformer);
      expect(called, true);
    });
  });
}
