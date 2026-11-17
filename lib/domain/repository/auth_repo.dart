import 'package:fpdart/fpdart.dart';
import 'package:fitness_app/core/failures/network_failure.dart';
import 'package:fitness_app/core/network/network_response.dart';

abstract class AuthRepo {
  Future<Either<NetworkFailure, NetworkResponse<dynamic>>> refreshToken();
}
