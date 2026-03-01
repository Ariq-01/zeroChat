import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:google_sign_in/google_sign_in.dart';
import '../../domain/entities/auth_firebase.dart';
import '../../domain/repositories/auth_repository.dart';

class FirebaseAuthRepositoryImpl implements AuthRepository {
  final fb.FirebaseAuth _firebaseAuth;

  FirebaseAuthRepositoryImpl(this._firebaseAuth);

  @override
  Stream<AppUser?> get user => _firebaseAuth.authStateChanges().map((fbUser) {
    if (fbUser == null) return null;
    return AppUser(
      id: fbUser.uid,
      email: fbUser.email,
      displayName: fbUser.displayName,
      photoUrl: fbUser.photoURL,
    );
  });

  @override
  Future<void> SignInWithGoogle() async {
    try {
      // google_sign_in v7: gunakan GoogleSignIn.instance.authenticate()
      final GoogleSignInAccount googleUser =
          await GoogleSignIn.instance.authenticate();

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      // accessToken kini ada di authorizationClient (google_sign_in v7)
      final GoogleSignInClientAuthorization? authorization =
          await googleUser.authorizationClient.authorizationForScopes([]);

      final fb.AuthCredential credential = fb.GoogleAuthProvider.credential(
        accessToken: authorization?.accessToken,
        idToken: googleAuth.idToken,
      );

      await _firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      throw Exception('login failed: $e');
    }
  }

  @override
  // sign out dari Google juga agar account picker muncul kembali
  Future<void> SignOut() async {
    await GoogleSignIn.instance.signOut();
    await _firebaseAuth.signOut();
  }
}
