import 'package:flutter/foundation.dart';
import 'package:zerochat/domain/entities/auth_firebase.dart';
import 'package:zerochat/domain/repositories/auth_repository.dart';

class AutthViewModel extends ChangeNotifier {
  final AuthRepository _repo;
  AppUser? currentUser;

  AutthViewModel(this._repo) {
    _repo.user.listen((user) {
      currentUser = user;
      notifyListeners(); // ui rebuild otomatis
    });
  }
  Future<void> SignIn() => _repo.SignInWithGoogle();
  Future<void> SignOut() => _repo.SignOut();
}
