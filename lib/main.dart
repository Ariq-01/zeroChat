import 'package:flutter/material.dart';
import 'package:zerochat/core/di/injection.dart' as di;
import 'package:zerochat/presentation/views/auth_gate.dart';

void main() async {
  // memastikan engine flutter siap
  WidgetsFlutterBinding.ensureInitialized();

  // memanggil semua inisialisasi firebase, getIt, dll
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZeroChat',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: const AuthGate(),
    );
  }
}
