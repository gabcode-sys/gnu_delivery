import 'package:flutter/material.dart';
import 'package:gnu_delivery/app/modules/login/domain/entities/logged_user.dart';
import 'package:gnu_delivery/app/modules/login/domain/entities/logged_user_info.dart';

class UserModel extends LoggedUser implements LoggedUserInfo {
  UserModel({@required String name, String email, String phoneNumber})
      : super(name: name, email: email, phoneNumber: phoneNumber);

  LoggedUser toLoggedUser() => this;
}
