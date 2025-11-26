import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/logo.png', height: 28),
          const SizedBox(width: 12),
          Text(
            'AUTO SERVIS "NAKO"',
            style: GoogleFonts.oswald(
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.blueAccent[400],
      foregroundColor: Colors.white,
    );
  }
}
