/// A sealed class for handling success and error states
sealed class Result<T> {
  const Result();
}

/// Success state with data
final class Success<T> extends Result<T> {

  const Success(this.data);
  final T data;
}

/// Failure state with error message and optional exception
final class Failure<T> extends Result<T> {

  const Failure(this.message);
  final String message;
}

/// Extension methods for Result
extension ResultExtension<T> on Result<T> {
  /// Check if the result is a success
  bool get isSuccess => this is Success<T>;

  /// Check if the result is a failure
  bool get isFailure => this is Failure<T>;

  /// Get the data if success, otherwise return null
  T? get dataOrNull => switch (this) {
    Success(: final data) => data,
    Failure() => null,
  };

  /// Get the error message if failure, otherwise return null
  String? get errorOrNull => switch (this) {
    Success() => null,
    Failure(: final message) => message,
  };

  /// Map the success value to another type
  Result<R> map<R>(R Function(T data) transform) => switch (this) {
    Success(: final data) => Success(transform(data)),
    Failure(: final message) => Failure(
      message,
    ),
  };

  /// Execute different callbacks based on the result
  R when<R>({
    required R Function(T data) success,
    required R Function(String message) failure,
  }) => switch (this) {
    Success(: final data) => success(data),
    Failure(
      : final message,
    ) =>
      failure(message),
  };

  /// Get the data or throw an exception
  T getOrThrow() => switch (this) {
    Success(: final data) => data,
    Failure(: final message) => throw Exception(message),
  };

  /// Get the data or return a default value
  T getOrElse(T defaultValue) => switch (this) {
    Success(: final data) => data,
    Failure() => defaultValue,
  };
}
