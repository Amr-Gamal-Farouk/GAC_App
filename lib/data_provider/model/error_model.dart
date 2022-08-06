
class ErrorModel {
  int? errorCode;
  String? errorMessage;

  ErrorModel({ this.errorCode,  this.errorMessage});

  @override
  String toString() {
    return 'ErrorModel{errorCode: $errorCode, errorMessage: $errorMessage}';
  }
}
