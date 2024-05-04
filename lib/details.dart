import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_court/main.dart';
import 'package:food_court/widgets.dart/home.dart';

class FoodDetails extends StatefulWidget {
  FoodDetails({
    required this.productImage,
    required this.productName,
    required this.Price,
    required this.Productinformation,
  });

  final String productName;
  final String productImage;
  final String Productinformation;
  final double Price;

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff181E2A),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Product Details'),
            Cart_Nav(),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: NetworkImage(widget.productImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(widget.productName, style: Bigstyle),
            Text(widget.Productinformation, style: smalltext),
            SizedBox(height: 40),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0XFF1E2B3C),
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (quantity > 1) {
                                      quantity--;
                                    }
                                  });
                                },
                                icon: Icon(Icons.minimize),
                                color: Colors.white,
                              ),
                              Text(
                                quantity.toString(),
                                style: Bigstyle,
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    quantity++;
                                  });
                                },
                                icon: Icon(Icons.add),
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                            child: Row(children: [
                          Text(
                            "₹${(widget.Price * quantity).toStringAsFixed(2)}",
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                              onPressed: () {
                                FirebaseFirestore.instance
                                    .collection('cart')
                                    .add({
                                  'name': widget.productName,
                                  'price': widget.Price.toInt(),
                                  'quantity': quantity,
                                });
                              },
                              child: Text(
                                "Add to cart",
                                style: TextStyle(color: Colors.white),
                              ))
                        ]))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
