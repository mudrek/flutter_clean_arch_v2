import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Bem vindo'),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                Modular.to.navigate('/login/');
              },
              child: const Text(
                'Ir para login',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
