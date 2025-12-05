import "package:flutter/material.dart";
import 'package:go_router/go_router.dart';
import 'package:nako_car_service/components/app_bar.dart';

class MainScaffold extends StatefulWidget {
  final Widget child;
  final GoRouter router;

  const MainScaffold({super.key, required this.child, required this.router});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _currentIndex = 0;

  final List<String> _routes = [
    '/',
    '/reservations',
    '/reservation',
    "/account",
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    widget.router.go(_routes[index]);
  }

  Color _iconColor(int index) {
    return _currentIndex == index ? Colors.blueAccent[400]! : Colors.blueGrey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: widget.child,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () => _onTap(0),
              icon: Icon(Icons.home, color: _iconColor(0)),
            ),
            IconButton(
              onPressed: () => _onTap(1),
              icon: Icon(Icons.list_alt, color: _iconColor(1)),
            ),
            IconButton(
              onPressed: () => _onTap(2),
              icon: Icon(Icons.event, color: _iconColor(2)),
            ),
            IconButton(
              onPressed: () => _onTap(3),
              icon: Icon(Icons.person, color: _iconColor(3)),
            ),
          ],
        ),
      ),
    );
  }
}
