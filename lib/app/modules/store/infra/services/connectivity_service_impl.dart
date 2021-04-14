import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/modules/store/domain/errors/errors.dart';
import 'package:gnu_delivery/app/modules/store/domain/services/conectivity_service.dart';
import 'package:gnu_delivery/app/modules/store/infra/drivers/conectivity_drivers.dart';

part 'connectivity_service_impl.g.dart';

@Injectable(singleton: false)
class ConnectivityServiceImpl implements ConnectivityService {
  final ConnectivityDriver connectivityDriver;
  ConnectivityServiceImpl(this.connectivityDriver);

  @override
  Future<Either<Failure, Unit>> isOnline() async {
    try {
      var check = await connectivityDriver.isOnline;
      if (check) {
        return Right(unit);
      }
      throw ConnectionError(message: 'Você está offline');
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(
        ConnectionError(message: 'Erro ao Recuperar Informação de Conexão'),
      );
    }
  }
}
