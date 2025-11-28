sealed class ResultApi<T> {}

class SuccessApi<T> extends ResultApi<T> {
  final T data;
  SuccessApi(this.data);
}

class ErrorApi<T> extends ResultApi<T> {
  final String message;
  ErrorApi(this.message);
}