import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Register"),
            IconButton(
              onPressed: () => context.push("/"),
              icon: Icon(Icons.arrow_back),
            ),
          ],
        ),
      ),
    );
  }
}
