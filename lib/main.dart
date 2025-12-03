import "package:flutter/material.dart";
import 'package:firebase_core/firebase_core.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_router/go_router.dart';
import 'firebase_options.dart';
import "package:nako_car_service/router.dart";
import "package:nako_car_service/components/main_scaffold.dart";

/*
Future<void> addSlot({
  required String email,
  required String number,
  required String firstname,
  required String lastname,
  required int slot,
  required DateTime selectedDate,
}) async {
  try {
    final now = DateTime.now();
    final createdAt = Timestamp.fromDate(now);

    final date = Timestamp.fromDate(
      DateTime(selectedDate.year, selectedDate.month, selectedDate.day),
    );

    final docId =
        '${selectedDate.year.toString().padLeft(4, '0')}-'
        '${selectedDate.month.toString().padLeft(2, '0')}-'
        '${selectedDate.day.toString().padLeft(2, '0')}_$slot';

    await FirebaseFirestore.instance.collection('reservations').doc(docId).set({
      'email': email,
      'number': number,
      'firstname': firstname,
      'lastname': lastname,
      'slot': slot,
      'createdAt': createdAt,
      'date': date,
    });

    print('Slot za $firstname uspješno dodan!');
  } catch (e) {
    print('Greška pri dodavanju slota: $e');
  }
}


await addSlot(
    email: "ahmedcvrle3@gmail.com",
    number: "060/339-4022",
    firstname: "Ahmed3",
    lastname: "Cvrčak3",
    slot: 11,
    selectedDate: DateTime(2025, 12, 3),
  );
*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp(router: router));
}

class MyApp extends StatelessWidget {
  final GoRouter router;

  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      builder: (context, child) {
        return MainScaffold(router: router, child: child!);
      },
    );
  }
}

