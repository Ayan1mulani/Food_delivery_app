import 'package:flutter/material.dart';

class container1 extends StatelessWidget {
  container1(
      {required this.text,
      required this.image,
      required this.subtext,
      required this.price,
      required this.productinformation});
  final String image;
  final String text;
  final String subtext;
  final String productinformation;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Row(
          children: [
            Image.network(image),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text(
                    subtext,
                    style: TextStyle(color: Color(0xffADB0A7)),
                  )
                ],
              ),
            )
          ],
        ),
        height: 130,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xff1F2734),
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}

class IconWidget extends StatelessWidget {
  final IconData iconData;
  final VoidCallback? onPressed;
  final Color? iconColor;

  const IconWidget({
    required this.iconData,
    this.onPressed,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        iconData,
        color: iconColor ?? Colors.white,
      ),
      onPressed: onPressed,
    );
  }
}

const Bigstyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20);

const smalltext = TextStyle(
  color: Color(0xffA2A6A5),
);

class OtherScreen extends StatelessWidget {
  final double totalPrice;

  const OtherScreen({Key? key, required this.totalPrice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Total Price: ₹$totalPrice'),
    );
  }
}
