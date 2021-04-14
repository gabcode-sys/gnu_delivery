import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/modules/login/domain/entities/logged_user_info.dart';
import 'package:gnu_delivery/app/modules/login/domain/entities/login_credential.dart';
import 'package:gnu_delivery/app/modules/login/domain/errors/errors.dart';
import 'package:gnu_delivery/app/modules/login/domain/repositories/login_repository.dart';
import 'package:gnu_delivery/app/modules/login/domain/services/conectivity_service.dart';

part 'login_with_email.g.dart';

abstract class LoginWithEmail {
  Future<Either<Failure, LoggedUserInfo>> call(LoginCredential credential);
}

@Injectable()
class LoginWithEmailImpl implements LoginWithEmail {
  final LoginRepository loginRepository;
  final ConnectivityService connectivityService;

  LoginWithEmailImpl(this.loginRepository, this.connectivityService);

  @override
  Future<Either<Failure, LoggedUserInfo>> call(
      LoginCredential credential) async {
    var result = await connectivityService.isOnline();

    if (result.isLeft()) {
      return result.map((r) => null);
    }

    if (!credential.isValidEmail) {
      return Left(ErrorLoginEmail(message: 'Email Inválido'));
    } else if (!credential.isValidPassword) {
      return Left(ErrorLoginEmail(message: 'Senha Inválida'));
    }

    return await loginRepository.loginEmail(
      email: credential.email,
      password: credential.password,
    );
  }
}
