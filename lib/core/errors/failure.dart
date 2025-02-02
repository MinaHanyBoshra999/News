

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  

  factory ServerFailure.fromResponse(int? statusCode,) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure('Not Found ,error 404');
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure('Opps There was an Error, Please try again');
    }
  }
}
