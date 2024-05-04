import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_court/main.dart';

class payment_done extends StatefulWidget {
  const payment_done({super.key});

  @override
  State<payment_done> createState() => _payment_doneState();
}

class _payment_doneState extends State<payment_done> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0XFF181E2A),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 300,
                child: Image(
                    image: NetworkImage(
                        "https://www.pngmart.com/files/21/Food-Delivery-Scooter-PNG-Isolated-HD-Pictures.png")),
              ),
              Text(
                'Thank\'s for your order',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'order will delevered in 30 min ',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection('cart')
                        .get()
                        .then((snapshot) {
                      for (DocumentSnapshot doc in snapshot.docs) {
                        doc.reference.delete();
                      }
                    }).then((_) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp()),
                      );
                    });
                  },
                  child: Text("Back to home screen"))
            ],
          ),
        ),
      ),
    );
  }
}
