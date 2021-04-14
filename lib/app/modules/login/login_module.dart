import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/modules/login/presenter/pages/login_selector/login_selector.dart';
import 'package:gnu_delivery/app/modules/login/presenter/pages/verification/verification.dart';

import 'domain/usecases/get_logged_user.dart';
import 'domain/usecases/login_with_email.dart';
import 'domain/usecases/login_with_phone.dart';
import 'domain/usecases/logout.dart';
import 'domain/usecases/verify_phone_code.dart';
import 'external/datasource/firebase_datasource.dart';
import 'external/drivers/flutter_connectivity_driver_impl.dart';
import 'infra/repositories/login_repository_impl.dart';
import 'infra/services/connectivity_service_impl.dart';
import 'presenter/pages/number_sign_up/number_sign_up.dart';
import 'presenter/pages/number_sign_up/number_signup_controller.dart';
import 'presenter/pages/verification/verification_controller.dart';

class LoginModule extends ChildModule {
  static List<Bind> export = [
    $GetLoggedUserImpl,
    $LogoutImpl,
    $LoginRepositoryImpl,
    $FirebaseDataSourceImpl,
  ];

  @override
  List<Bind> get binds => [
        $NumberSignUpController,
        $VerificationController,
        $LoginWithEmailImpl,
        $VerifyPhoneCodeImpl,
        $LoginWithPhoneImpl,
        $ConnectivityServiceImpl,
        $FlutterConnectivityDriver,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", child: (context, args) => LoginSelector()),
        ModularRouter("/number_sign_up",
            child: (context, args) => NumberSignUp()),
        ModularRouter("/verification/:verificationId",
            child: (context, args) => Verification()),
      ];
}
