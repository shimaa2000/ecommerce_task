import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import '../constants/app_strings.dart';


abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.cancel:
        return const ServerFailure('requestToApiServerWasCancelled');

      case DioExceptionType.connectionTimeout:
        return const ServerFailure('connectionTimeoutWithApiServer');

      case DioExceptionType.receiveTimeout:
        return const ServerFailure(
            'receiveTimeoutInConnectionWithApiServer');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioException.response?.statusCode,
            dioException.response?.data, dioException.response?.data);

      case DioExceptionType.sendTimeout:
        return const ServerFailure(
            'sendTimeoutInConnectionWithApiServer');

      case DioExceptionType.unknown:
        return const ServerFailure('noInternet');

      default:
        return const ServerFailure('somethingWentWrong');
    }
  }

  factory ServerFailure.fromResponse(
    int? statusCode,
    dynamic error,
    Map<String, dynamic> messageError,
  ) {
    switch (statusCode) {
      case 400:
        return ServerFailure(
            messageError['message'] ?? 'badRequest');
      case 401:
        return ServerFailure(
            messageError['message'] ?? 'unauthorized');
      case 403:
        return ServerFailure(
            messageError['message'] ?? 'forbidden');
      case 404:
        return ServerFailure(messageError['message'] ??
            error['message'] ??
            AppStrings.notFound);
      case 422:
        return ServerFailure(
          messageError['message'] ??
              messageError.values
                  .join(' , ')
                  .replaceAll(RegExp(r'[^\w\s]+'), ''),
        );

      case 500:
        return ServerFailure(
            messageError['message'] ?? AppStrings.internalServerError);

      case 502:
        return ServerFailure(
            messageError['message'] ?? AppStrings.badGateway);

      default:
        return ServerFailure(
            messageError['message'] ?? AppStrings.somethingWentWrong);
    }
  }
}
