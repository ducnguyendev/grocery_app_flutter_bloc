class GenericResponse<T> {
  GenericResponse({
    required this.errorMessage,
    required this.errorCode,
    required this.data
  });

  final String errorMessage;
  final int errorCode;
  final T data;

}