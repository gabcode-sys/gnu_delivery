import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/modules/login/domain/errors/errors.dart';
import 'package:gnu_delivery/app/modules/login/domain/repositories/login_repository.dart';

part 'logout.g.dart';

abstract class Logout {
  Future<Either<Failure, Unit>> call();
}

@Injectable(singleton: false)
class LogoutImpl implements Logout {
  final LoginRepository loginRepository;

  LogoutImpl(this.loginRepository);

  @override
  Future<Either<Failure, Unit>> call() async {
    return await loginRepository.logout();
  }
}
