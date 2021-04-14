import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/modules/login/domain/errors/errors.dart';
import 'package:gnu_delivery/app/modules/login/infra/models/user_model.dart';

import '../../infra/datasources/login_datasource.dart';

part 'firebase_datasource.g.dart';

@Injectable(singleton: false)
class FirebaseDataSourceImpl implements LoginDataSource {
  final FirebaseAuth firebaseAuth;

  FirebaseDataSourceImpl(this.firebaseAuth);

  @override
  Future<UserModel> loginEmail({String email, String password}) async {
    var result = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    var user = result.user;
    return UserModel(
      name: user.displayName,
      phoneNumber: user.phoneNumber,
      email: user.email,
    );
  }

  @override
  Future<UserModel> loginPhone({String phone}) async {
    var completer = Completer<AuthCredential>();

    await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 30),
        verificationCompleted: (auth) {
          completer.complete(auth);
        },
        verificationFailed: (e) {
          completer.completeError(e);
        },
        codeSent: (String c, [int i]) {
          completer.completeError(NotAutomaticRetrieved(c));
        },
        codeAutoRetrievalTimeout: (v) {});

    var credential = await completer.future;

    var user = (await firebaseAuth.signInWithCredential(credential)).user;

    return UserModel(
      name: user.displayName,
      phoneNumber: user.phoneNumber,
      email: user.email,
    );
  }

  @override
  Future<UserModel> validateCode({String verificationId, String code}) async {
    var _credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: code);
    var user = (await firebaseAuth.signInWithCredential(_credential)).user;

    //Create a new Document for User
    Map<String, dynamic> userData = new Map<String, dynamic>();
    userData["user_id"] = user.phoneNumber;
    userData["name"] = '';
    DocumentReference userDocument =
        FirebaseFirestore.instance.collection("users").doc(user.phoneNumber);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.set(userDocument, userData);
    });

    return UserModel(
      name: user.displayName,
      phoneNumber: user.phoneNumber,
      email: user.email,
    );
  }

  @override
  Future<UserModel> currentUser() async {
    var user = firebaseAuth.currentUser;

    if (user == null) throw ErrorGetLoggedUser();

    return UserModel(
      name: user.displayName,
      phoneNumber: user.phoneNumber,
      email: user.email,
    );
  }

  @override
  Future<void> logout() async {
    return await firebaseAuth.signOut();
  }
}
