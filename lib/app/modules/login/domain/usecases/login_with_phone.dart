import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/modules/login/domain/entities/logged_user_info.dart';
import 'package:gnu_delivery/app/modules/login/domain/entities/login_credential.dart';
import 'package:gnu_delivery/app/modules/login/domain/errors/errors.dart';
import 'package:gnu_delivery/app/modules/login/domain/repositories/login_repository.dart';
import 'package:gnu_delivery/app/modules/login/domain/services/conectivity_service.dart';

part 'login_with_phone.g.dart';

abstract class LoginWithPhone {
  Future<Either<Failure, LoggedUserInfo>> call(LoginCredential credential);
}

@Injectable(singleton: false)
class LoginWithPhoneImpl implements LoginWithPhone {
  final LoginRepository loginRepository;
  final ConnectivityService connectivityService;

  LoginWithPhoneImpl(this.loginRepository, this.connectivityService);

  @override
  Future<Either<Failure, LoggedUserInfo>> call(
      LoginCredential credential) async {
    if (!credential.isValidPhone) {
      return Left(ErrorLoginPhone(message: 'Número de Telefone Inválido'));
    }

    var result = await connectivityService.isOnline();

    if (result.isLeft()) {
      return result.map((r) => null);
    }

    return await loginRepository.loginPhone(phone: credential.phone);
  }
}
