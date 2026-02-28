import 'dart:ffi';

import 'package:zerochat/domain/entities/auth_firebase.dart';

abstract class AuthRepository {
 
    Future<Void> SignOut();
    Future<void> SignInWithGoogle();
    Stream<UserAuth> get user,
  }
