import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("New password"),
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
