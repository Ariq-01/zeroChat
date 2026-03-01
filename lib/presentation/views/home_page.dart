import 'package:flutter/material.dart';
import 'package:zerochat/core/di/injection.dart';
import 'package:zerochat/presentation/view_models/autth_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _vm = AutthViewModel(sl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ZeroChat'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Keluar',
            onPressed: _vm.SignOut,
          ),
        ],
      ),
      body: const Center(
        child: Text('Selamat datang! 🎉'),
      ),
    );
  }
}
