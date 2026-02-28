import 'package:flutter/material.dart';
import 'package:zerochat/core/di/injection.dart' as di;

void main() async {
  // memastikan engine flutter siap
  WidgetsFlutterBinding.ensureInitialized();

  // memanggil smeua inilaisia firebse geTit dan dll
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
