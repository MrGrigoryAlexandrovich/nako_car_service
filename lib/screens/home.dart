import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFeatureCard(
              title: "Kvalitet",
              description:
                  "Vjerujte našem timu koji pruža pouzdane i dugotrajne rezultate vodeći se strogim kontrolama kvalitete vašeg vozila!",
            ),
            _buildFeatureCard(
              title: "Pristupačnost",
              description:
                  "Vrhunska usluga bez skrivenih troškova samo jasne i pristupačne cijene za sve vaše automobilske potrebe!",
            ),
            _buildFeatureCard(
              title: "Profesionalnost",
              description:
                  "Od dijagnostike do isporuke, doživite profesionalnost  s timom koji svaki korak obavlja precizno i s poštovanjem  prema vašem vremenu i vozilu!",
            ),
            _buildFeatureCard(
              title: "Zajedno stvaramo uspjeh",
              description:
                  "Svaki automobil kojem smo pružili uslugu bio je zajednički pothvat u kojem je svaki naš mehaničar ostavio dio svog stručnog znanja. Zajedno ne samo što održavamo vozila gradimo i trajno povjerenje koje čini temelj našeg ugleda.",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required String title,
    required String description,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(description, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
