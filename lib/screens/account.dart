import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final _firstNameCtrl = TextEditingController();
  final _lastNameCtrl = TextEditingController();
  final _numberCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  bool _isEditing = false;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get();

    _firstNameCtrl.text = doc['firstName'];
    _lastNameCtrl.text = doc['lastName'];
    _numberCtrl.text = doc['number'];

    setState(() => _loading = false);
  }

  Future<void> _updateUserData() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      'firstName': _firstNameCtrl.text,
      'lastName': _lastNameCtrl.text,
      'number': _numberCtrl.text,
    });

    setState(() => _isEditing = false);
  }

  Future<void> _updatePassword() async {
    if (_passwordCtrl.text.trim().isEmpty) return;

    try {
      await FirebaseAuth.instance.currentUser!.updatePassword(
        _passwordCtrl.text.trim(),
      );

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Lozinka uspješno promijenjena")));

      _passwordCtrl.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Greška: morate se ponovo prijaviti za izmjenu lozinke",
          ),
        ),
      );
    }
  }

  void _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    context.go('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: EdgeInsets.only(top: 0, bottom: 16, left: 16, right: 16),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 12, bottom: 12),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Osnovni podaci",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),

                  _buildField("Ime", _firstNameCtrl),
                  _buildField("Prezime", _lastNameCtrl),
                  _buildField("Broj telefona", _numberCtrl),
                  SizedBox(height: 20),
                  _isEditing
                      ? ElevatedButton(
                          onPressed: _updateUserData,
                          child: Text("Sačuvaj promjene"),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            setState(() => _isEditing = true);
                          },
                          child: Text("Uredi podatke"),
                        ),

                  SizedBox(height: 40),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Promjena lozinke",
                      style: TextStyle(
                        fontSize: 22,

                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: _passwordCtrl,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Nova lozinka",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: _updatePassword,
                    child: Text("Promijeni lozinku"),
                  ),

                  SizedBox(height: 40),
                  SizedBox(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () => _logout(context),
                      child: Text("Logout"),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        enabled: _isEditing,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
