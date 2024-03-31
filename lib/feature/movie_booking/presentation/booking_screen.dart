import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_ui/core/route/app_route_name.dart'; // Import Firestore

class BookingScreen extends StatefulWidget {
  final List<String> selectedSeat;
  final DateTime selectedDate;
  final TimeOfDay? selectedTime;
  final String? movieImage;
  final String? movieTitle;

  const BookingScreen({
    Key? key,
    required this.selectedSeat,
    required this.selectedDate,
    required this.selectedTime,
    this.movieTitle,
    this.movieImage,
  }) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final user = FirebaseAuth.instance.currentUser;
  bool show = true;
  @override
  Widget build(BuildContext context) {
    int totalPrice = widget.selectedSeat.length * 10;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Ticket'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  children: [
                    Container(
                      height: size.height * .55,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(15.0)),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            widget.movieImage!,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.movieTitle!,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
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
                              const Icon(Icons.calendar_today,
                                  color: Colors.white),
                              const SizedBox(
                                  width:
                                      5), // เพิ่มระยะห่างระหว่าง Icon กับ Text
                              Text(
                                '${DateFormat('dd MMMM yyyy').format(widget.selectedDate)}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                  width: 20), // เพิ่มระยะห่างระหว่างข้อมูล
                              const Icon(Icons.access_time,
                                  color: Colors.white),
                              const SizedBox(
                                  width:
                                      5), // เพิ่มระยะห่างระหว่าง Icon กับ Text
                              Text(
                                '${widget.selectedTime != null ? widget.selectedTime!.format(context) : 'Not selected'}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15), // ระยะห่างระหว่างแถว
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
                              const SizedBox(
                                  width: 5), // เพิ่มระยะห่างระหว่างข้อมูล
                              Text(
                                widget.selectedSeat.join(', '),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15), // ระยะห่างระหว่างแถว
                          Row(
                            children: [
                              Text(
                                'PRICE : \$${totalPrice.toString()}',
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
            ),
            Positioned(
              top: size.height * .650,
              left: 15,
              child: const Icon(Icons.circle,
                  color: Color.fromARGB(255, 37, 37, 37)),
            ),
            Positioned(
              top: size.height * .650,
              right: 15,
              child: const Icon(Icons.circle,
                  color: Color.fromARGB(255, 37, 37, 37)),
            ),
          ],
        ),
      ),
      floatingActionButton: Builder(
        builder: (BuildContext context) {
          return FloatingActionButton(
            onPressed: () {
              saveTicketToFirestore(context, totalPrice);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Ticket saved successfully'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            backgroundColor: Colors.white,
            child: const Icon(Icons.save,color: Color(0xFFba903a),),
          );
        },
      ),
    );
  }

  void saveTicketToFirestore(BuildContext context, int totalPrice) async {
    // Wait for Firestore connection
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Get current user data (Assuming user data is stored in Firebase Authentication)
    String currentUserID = user!.uid; // Get current user ID

    // Define ticket data as a Map
    Map<String, dynamic> ticketData = {
      'userID': currentUserID, // Add current user's UserID or Username
      'movieTitle': widget.movieTitle,
      'movieImage': widget.movieImage,
      'selectedDate': widget.selectedDate,
      'selectedTime': widget.selectedTime != null
          ? widget.selectedTime!.format(context)
          : 'Not selected',
      'selectedSeat': widget.selectedSeat,
      'totalPrice': totalPrice,
    };

    await firestore.collection('Myticket').add(ticketData);
    // Navigate to the myTicket screen
    Navigator.pushNamed(
      context,
      AppRouteName.myTicket,
      arguments: ticketData,
    );
  }
}
