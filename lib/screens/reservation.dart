import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ReservationScreen extends StatelessWidget {
  const ReservationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Reservation"),
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
