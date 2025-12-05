import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReservationsScreen extends StatelessWidget {
  const ReservationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('reservations')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Greška: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final docs = snapshot.data!.docs;

          if (docs.isEmpty) {
            return Center(child: Text('Nema rezervacija.'));
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 12),
                child: Text(
                  'Vaše rezervacije',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 8),
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final data = docs[index].data() as Map<String, dynamic>;
                    final firstName = data['firstname'];
                    final email = data['email'];
                    final number = data['number'];
                    final lastName = data['lastname'];
                    final fullName = '$firstName $lastName';
                    final slotNumber = data['slot'] ?? 1;

                    final baseDate = data['date'] != null
                        ? (data['date'] as Timestamp).toDate()
                        : DateTime.now();

                    DateTime slotDateTime(DateTime date, int slot) {
                      final startHour = 7;
                      final startMinute = 45;
                      final minutesToAdd = (slot - 1) * 45;

                      final localDate = DateTime(
                        date.year,
                        date.month,
                        date.day,
                        startHour,
                        startMinute,
                      ).add(Duration(minutes: minutesToAdd));

                      return localDate.toLocal();
                    }

                    final slotTime = slotDateTime(baseDate, slotNumber);

                    final formattedSlotTime =
                        '${slotTime.day.toString().padLeft(2, '0')}.'
                        '${slotTime.month.toString().padLeft(2, '0')}.'
                        '${slotTime.year} '
                        '${slotTime.hour.toString().padLeft(2, '0')}:'
                        '${slotTime.minute.toString().padLeft(2, '0')}';
                    final onlyDate = formattedSlotTime.substring(0, 5);

                    return ListTile(
                      leading: Icon(Icons.event_note),
                      title: Text(fullName),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            email,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(number),
                        ],
                      ),
                      trailing: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              onlyDate,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.blueAccent,
                              ),
                            ),
                            Text(
                              formattedSlotTime.split(' ').last,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
