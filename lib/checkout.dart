import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_court/payment_done.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Checkout extends StatefulWidget {
  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  double totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xff181E2A),
        appBar: AppBar(
          title: Row(
            children: [
              Text("Checkout"),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Delivery System",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              DeliveryBox(
                image:
                    'https://media.istockphoto.com/id/526210143/vector/remote-air-drone-with-a-box.jpg?s=612x612&w=0&k=20&c=Rgu9mTdaB4FSIPHwmzyyy5PbFcLhWTLyMDJ8HhQ_faY=',
              ),
              Text(
                "Your Food Items to Buy",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: CartList(onTotalPriceCalculated: (total) {
                    totalPrice = total;
                  }),
                  decoration: BoxDecoration(
                    color: Color(0xff253449),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffFE6D40),
                  minimumSize: Size(double.infinity, 60),
                ),
                onPressed: () {
                  _openRazorpay(totalPrice, context); // Pass context here
                },
                child: const Text("Pay with Razorpay"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openRazorpay(double totalPrice, BuildContext context) {
    Razorpay razorpay = Razorpay();
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': totalPrice * 100,
      'name': 'Ayans soloution.',
      'description': 'Fine T-Shirt',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, (error) {
      _handlePaymentErrorResponse(context, error);
    });
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, (success) {
      _handlePaymentSuccessResponse(context, success);
    });
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, (response) {
      _handleExternalWalletSelected(context, response);
    });
    razorpay.open(options);
  }

  void _handlePaymentErrorResponse(
      BuildContext context, PaymentFailureResponse response) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Plzzz add item to the cart'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _handlePaymentSuccessResponse(
      BuildContext context, PaymentSuccessResponse response) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text('Payment Successful'),
        content: Text('Payment ID: ${response.paymentId}'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => payment_done()),
              );
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _handleExternalWalletSelected(
      BuildContext context, ExternalWalletResponse response) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('External Wallet Selected'),
        content: Text('${response.walletName}'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}

class DeliveryBox extends StatelessWidget {
  DeliveryBox({required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class CartList extends StatelessWidget {
  final Function(double) onTotalPriceCalculated;

  CartList({required this.onTotalPriceCalculated});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('cart').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        List<Widget> cartItems = [];
        double totalPrice = 0;

        final cartProducts = snapshot.data?.docs;
        if (cartProducts == null || cartProducts.isEmpty) {
          return Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                child: Image(
                    image: NetworkImage(
                        'https://cdn-icons-png.flaticon.com/512/2038/2038854.png')),
              ),
              Text(
                'Cart is empty',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ));
        }

        for (var product in cartProducts) {
          final name = product['name'];
          final price = product['price'];
          final quantity = product['quantity'];
          final docId = product.id;

          final productTotalPrice = price * quantity;
          totalPrice += productTotalPrice;

          cartItems.add(
            ListTile(
              title: Text(
                name,
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                'Quantity: $quantity',
                style: TextStyle(color: Colors.white),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '₹$productTotalPrice',
                    style: TextStyle(color: Colors.white),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      FirebaseFirestore.instance
                          .collection('cart')
                          .doc(docId)
                          .delete();
                    },
                  ),
                ],
              ),
            ),
          );
        }
        onTotalPriceCalculated(totalPrice);

        cartItems.add(
          Container(
            height: 100,
            padding: EdgeInsets.all(10),
            color: Color(0xff1E2B3C),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  '₹$totalPrice',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
        );

        return ListView(
          children: cartItems,
        );
      },
    );
  }
}
