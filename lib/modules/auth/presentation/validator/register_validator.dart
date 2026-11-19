import 'package:fpdart/fpdart.dart';
import 'package:fitness_app/core/failures/validation_failure.dart';
import 'package:fitness_app/core/validator/validator.dart';
import 'package:fitness_app/modules/auth/domain/params/register_param.dart';


class RegisterValidator {
  Either<ValidationFailure, RegisterParam> validate(RegisterParam data) {
    if (Validator.validateEmail(data.email) != null) {
      return left(
        ValidationFailure(error: Validator.validateEmail(data.email)!),
      );
    }  else {
      return right(data);
    }
  }
}
