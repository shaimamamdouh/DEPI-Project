import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure( this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailure( 'Receive Timeout');
      case DioExceptionType.sendTimeout:
        return ServerFailure( 'Send Timeout');
      case DioExceptionType.badResponse:
        return ServerFailure.fromresponse(e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure( 'Request Cancelled');
      default:
        return ServerFailure('Unknown Error');
    }
  
  }


  factory ServerFailure.fromresponse(int? statusCode, dynamic response) {
if ( statusCode == 400 || statusCode == 401|| statusCode == 403) {
      return ServerFailure(response['error'] ['message']);
    
    } else if (statusCode == 404) {
      return ServerFailure( 'Not Found');
    } else if (statusCode == 500) {
      return ServerFailure( 'Internal Server Error');
    } else {
      return ServerFailure( 'Unknown Error, please try again later');
    }
  }
   
}

class CacheFailure extends Failure {
  CacheFailure(super.message, );
}