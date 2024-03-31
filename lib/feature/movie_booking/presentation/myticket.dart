import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyTicketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Ticket'),
      ),
      body: MyTicketList(),
    );
  }
}

class MyTicketList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentUserID = FirebaseAuth.instance.currentUser!.uid;
    final size = MediaQuery.of(context).size;
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('Myticket')
          .where('userID', isEqualTo: currentUserID)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text('No tickets found'));
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            var ticketData =
                snapshot.data!.docs[index].data() as Map<String, dynamic>;

            return Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: size.height * .55,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.vertical(top: Radius.circular(15.0)),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(ticketData['movieImage'] ?? ''),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ticketData['movieTitle'] ?? '',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  thickness: 1.5,
                                  color: Color.fromARGB(255, 37, 37, 37),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              const Icon(Icons.calendar_today, color: Colors.white),
                              const SizedBox(width: 5),
                              Text(
                                '${DateFormat('dd MMMM yyyy').format(ticketData['selectedDate'].toDate())}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 20),
                              const Icon(Icons.access_time, color: Colors.white),
                              const SizedBox(width: 5),
                              Text(
                                ticketData['selectedTime'] ?? '',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              const Text(
                                'SEATS :',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                ticketData['selectedSeat'].join(', ') ?? '',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Text(
                                'PRICE : \$${ticketData['totalPrice']}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
