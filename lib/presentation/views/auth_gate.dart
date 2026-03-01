import 'package:flutter/material.dart';
import 'package:zerochat/core/di/injection.dart';
import 'package:zerochat/domain/entities/auth_firebase.dart';
import 'package:zerochat/domain/repositories/auth_repository.dart';
import 'package:zerochat/presentation/views/home_page.dart';
import 'package:zerochat/presentation/views/login_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AppUser?>(
      stream: sl<AuthRepository>().user,
      builder: (ctx, snap) {
        // menunggu status auth dari Firebase
        if (snap.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        // sudah login → halaman utama, belum login → halaman login
        return snap.data != null ? const HomePage() : const LoginPage();
      },
    );
  }
}