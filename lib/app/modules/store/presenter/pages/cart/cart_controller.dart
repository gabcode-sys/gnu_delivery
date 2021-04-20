import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/product_info.dart';
import 'package:mobx/mobx.dart';

part 'cart_controller.g.dart';

@Injectable()
class CartController = ControllerBase with _$CartController;

abstract class ControllerBase with Store {
  ControllerBase();
}
