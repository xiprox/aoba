import 'dart:io';

/// A container for error information
class ErrorInfo {
  final String? message;
  final Exception? exception;
  final StackTrace? stackTrace;

  ErrorInfo({
    this.message,
    this.exception,
    this.stackTrace,
  });

  bool get isConnectionError => exception is SocketException;

  @override
  String toString() {
    return stackTrace?.toString() ??
        exception?.toString() ??
        message ??
        'Unknown error';
  }
}

class Resource<T> {
  final bool isLoading;
  final ErrorInfo? error;
  final T? data;

  const Resource({
    bool loading = false,
    this.error,
    this.data,
  }) : isLoading = loading;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Resource &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          error == other.error &&
          data == other.data;

  @override
  String toString() {
    return {
      'isLoading': isLoading,
      'error': error,
      'data': data,
    }.toString();
  }

  @override
  int get hashCode => isLoading.hashCode ^ error.hashCode ^ data.hashCode;

  Resource<T> copyWith({
    bool? loading,
    ErrorInfo? error,
    T? data,
  }) {
    return Resource(
      loading: loading ?? isLoading,
      error: error ?? this.error,
      data: data ?? this.data,
    );
  }

  /// Transforms the data of this Resource using given [transformer] if
  /// data isn't null, and keeps the [isloading] and [error] information.
  Resource<NewType> transform<NewType>(NewType Function(T data) transformer) {
    return Resource<NewType>(
      loading: isLoading,
      error: error,
      data: data == null ? null : transformer(data as T),
    );
  }
}
