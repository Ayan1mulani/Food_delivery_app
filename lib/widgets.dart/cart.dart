// import 'package:flutter/material.dart';
// import 'package:food_court/checkout.dart';

// class Cart extends StatefulWidget {
//   const Cart({Key? key});

//   @override
//   State<Cart> createState() => _CartState();
// }

// class _CartState extends State<Cart> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SafeArea(
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text("MY Food Cart"),
//           ),
//           backgroundColor: Color(0XFF181E2A),
//           body: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             cildren: [
//               C,
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color(0xffFE6D40),
//                     padding: EdgeInsets.symmetric(vertical: 15),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                   ),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => Checkout()),
//                     );
//                   },
//                   child: Text("Checkout"),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
