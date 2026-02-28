import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:zerochat/domain/entities/auth_firebase.dart';


class FirebaseAuthRepositoryImpl implements AuthRepository {
  final firebase.FirebaseAuth _firebaseAuth;

  FirebaseAuthRepositoryImpl(this._firebaseAuth);

  @override
  Stream<UserAuth> get UserAuth{
    return _firebaseAuth.authStateChanges().map((_firebaseAuth){
      if (firebaseUser == null) return null;

      // mapping dari firebase ke dalam abtarsc ke repos auth reposity  
      return AppUser(id: firebaseUser.uid, email: firebaseuser: email);
    });
  }

  // you can add another sign up if needed 
}