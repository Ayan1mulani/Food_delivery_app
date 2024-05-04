import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_court/checkout.dart';
import 'package:food_court/details.dart';
import 'package:food_court/firebase_options.dart';
import 'package:food_court/widgets.dart/home.dart';
import 'package:food_court/widgets.dart/navbar.dart';
import 'package:food_court/widgets.dart/view_all.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: navbar(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('FOOD COURT'),
            Column(
              children: [
                Cart_Nav(),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Color(0XFF181E2A),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(
                        'https://media.gettyimages.com/id/1186934176/photo/cook-serving-food-on-a-plate-in-the-kitchen-of-a-restaurant.jpg?s=612x612&w=0&k=20&c=Lh9sH4SRu0hWDfRWG5MO2imKGORPTL3skKTx8iw-0qA=')),
                borderRadius: BorderRadius.circular(30),
                color: Color(0XFF181E2A),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Popular dishes", style: Bigstyle),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (Context) => view_all()));
                  },
                  child: Text(
                    'View all',
                    style: TextStyle(color: Colors.yellow),
                  ),
                )
              ],
            ),
            Iitems_list(
              items: Lists().items,
              length: 5,
            ),
          ],
        ),
      ),
    );
  }
}

class Cart_Nav extends StatelessWidget {
  const Cart_Nav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Checkout()),
        );
      },
      icon: Icon(
        Icons.shopping_cart,
        color: Colors.black,
      ),
    );
  }
}

class Iitems_list extends StatelessWidget {
  const Iitems_list({
    super.key,
    required this.length,
    required this.items,
  });

  final int length;

  final List<container1> items;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        child: ListView.builder(
          itemCount: length,
          itemBuilder: (BuildContext context, int index) {
            final item = items[index];

            return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FoodDetails(
                                productName: item.text,
                                productImage: item.image,
                                Price: double.parse(item.price),
                                Productinformation: item.productinformation,
                              )));
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: container1(
                    productinformation: item.productinformation,
                    text: item.text,
                    image: item.image,
                    subtext: item.subtext,
                    price: item.price,
                  ),
                ));
          },
        ),
      ),
    );
  }
}
