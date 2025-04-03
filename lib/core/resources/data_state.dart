abstract class DataState<T> {
  final T? data;
  final String? exception;

  const DataState({this.data, this.exception});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(T data) : super(data: data);
}

class DataException<T> extends DataState<T> {
  const DataException(String error) : super(exception: error);
}
