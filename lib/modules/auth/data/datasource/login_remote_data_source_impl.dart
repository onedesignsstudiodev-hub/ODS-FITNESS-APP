import 'package:fpdart/fpdart.dart';
import 'package:fitness_app/core/constant/app_url.dart';
import 'package:fitness_app/core/failures/repo_failure.dart';
import 'package:fitness_app/core/network/api_header.dart';
import 'package:fitness_app/core/network/network_service.dart';
import 'package:fitness_app/modules/app/data/models/base_json.dart';
import 'package:fitness_app/modules/auth/data/datasource/login_remote_data_source.dart';
import 'package:fitness_app/modules/auth/data/model/response/login_model/login_model.dart';
import 'package:fitness_app/modules/auth/domain/params/login_param.dart';

class LoginRemoteDataSourceImpl
    implements LoginRemoteDataSource {
  final NetworkService network;
  final AppUrl appUrl;

  LoginRemoteDataSourceImpl(
    this.network,
    this.appUrl,
  );

  @override
  Future<Either<RepoFailure, BaseJson<LoginModel>>> 
      login(LoginParam data) =>
      network
          .post(
            AppUrl.loginUrl,
             data.toModel().toJson(),
            ApiHeader.bearerHeaderOnly(data.token),
        // authType: AuthType.cookie,

          )
          .then(
            (value) => value.fold(
              (l) => left(RepoFailure(error: l.error)),
              (response) {
                try {
                  return right(
                    BaseJson<LoginModel>.fromJson(
                      response.data,
                          LoginModel.fromJson,
                    ),
                  );
                } catch (e) {
                  return left(RepoFailure(error: e.toString()));
                }
              },
            ),
          );
}

