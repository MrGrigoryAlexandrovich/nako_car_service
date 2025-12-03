import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Login"),
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
