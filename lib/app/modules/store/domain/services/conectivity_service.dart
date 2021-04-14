import 'package:dartz/dartz.dart';
import 'package:gnu_delivery/app/modules/store/domain/errors/errors.dart';

abstract class ConnectivityService {
  Future<Either<Failure, Unit>> isOnline();
}
