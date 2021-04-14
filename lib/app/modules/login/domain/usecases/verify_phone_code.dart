import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/modules/login/domain/entities/logged_user_info.dart';
import 'package:gnu_delivery/app/modules/login/domain/entities/login_credential.dart';
import 'package:gnu_delivery/app/modules/login/domain/errors/errors.dart';
import 'package:gnu_delivery/app/modules/login/domain/repositories/login_repository.dart';
import 'package:gnu_delivery/app/modules/login/domain/services/conectivity_service.dart';

part 'verify_phone_code.g.dart';

abstract class VerifyPhoneCode {
  Future<Either<Failure, LoggedUserInfo>> call(LoginCredential credential);
}

@Injectable(singleton: false)
class VerifyPhoneCodeImpl implements VerifyPhoneCode {
  final LoginRepository loginRepository;
  final ConnectivityService connectivityService;

  VerifyPhoneCodeImpl(this.loginRepository, this.connectivityService);

  @override
  Future<Either<Failure, LoggedUserInfo>> call(
      LoginCredential credential) async {
    if (!credential.isValidCode) {
      return Left(ErrorLoginPhone(message: 'Código Inválido'));
    } else if (!credential.isValidVerificationId) {
      return Left(ErrorLoginPhone(message: 'ERRO INTERNO: VERIFICATION_ID'));
    }

    var result = await connectivityService.isOnline();

    if (result.isLeft()) {
      return result.map((r) => null);
    }

    return await loginRepository.verifyPhoneCode(
      code: credential.code,
      verificationId: credential.verificationId,
    );
  }
}
