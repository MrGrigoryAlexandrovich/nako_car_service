import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConfirmPasswordCodeScreen extends StatelessWidget {
  const ConfirmPasswordCodeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Conirm password code"),
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
