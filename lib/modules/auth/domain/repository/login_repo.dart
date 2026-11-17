import 'package:fpdart/fpdart.dart';
import 'package:fitness_app/core/failures/repo_failure.dart';
import 'package:fitness_app/modules/app/domain/entitties/base_entity.dart';
import 'package:fitness_app/modules/auth/domain/entities/login_entity.dart';
import 'package:fitness_app/modules/auth/domain/params/login_param.dart';

abstract class LoginRepo {
  Future<Either<RepoFailure, BaseEntity<LoginEntity>>> 
      login(
    LoginParam param,
  );
}

