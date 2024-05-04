import 'package:flutter/material.dart';
import 'package:food_court/main.dart';
import 'package:food_court/widgets.dart/home.dart';

class view_all extends StatefulWidget {
  const view_all({super.key});

  @override
  State<view_all> createState() => _view_allState();
}

class _view_allState extends State<view_all> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("All Food item's"),
              Cart_Nav(),
            ],
          ),
        ),
        backgroundColor: Color(0XFF181E2A),
        body: Column(children: [
          Iitems_list(
            items: Lists().items,
            length: 7,
          ),
        ]),
      ),
    );
  }
}

class Lists {
  List<container1> items = [
    container1(
        text: "Nigri sushi",
        image:
            'https://media.gettyimages.com/id/1302860925/photo/close-up-of-sushi-served-in-plate.jpg?s=612x612&w=0&k=20&c=eOeoc62nKkw6hhNF4hWxYr3E6R0e0CP-rs4_MeXsMo0=',
        subtext: "Rice, Sugar, Salt",
        price: "199",
        productinformation:
            "Nigiri sushi is a type of sushi made of a small ball of vinegared rice, pressed by hand into a shape and topped with fresh fish, seafood, or other ingredients. It's a bite-sized delight, highlighting the delicate balance of rice and topping, often served with soy sauce and wasabi."),
    container1(
        text: "Pizza",
        image:
            'https://media.gettyimages.com/id/184946701/photo/pizza.jpg?s=612x612&w=0&k=20&c=97rc0VIi-s3mn4xe4xDy9S-XJ_Ohbn92XaEMaiID_eY=',
        subtext: "cheese,tomato",
        price: "149",
        productinformation:
            "Pizza is a popular Italian dish that consists of a round, flat base of dough topped with tomato sauce, cheese, and various toppings such as meats, vegetables, and herbs. It is then baked in an oven, resulting in a delicious and savory meal that is enjoyed worldwide"),
    container1(
        text: "Samosa",
        image:
            'https://media.gettyimages.com/id/1327997344/photo/diverse-keto-dishes.jpg?s=612x612&w=gi&k=20&c=fqv_NEu_eOpaJo3CoF46jzCMSCl1wEOMqEshjfZ0IDA=',
        subtext: "redchuttney",
        price: "49",
        productinformation:
            "Samosas are known for their triangular shape and are enjoyed as a tasty appetizer or snack in many parts of the world, especially in South Asia and the Middle East"),
    container1(
        text: "Paratha",
        image:
            'https://media.gettyimages.com/id/1413108980/photo/amritsari-kulche-and-chole.jpg?s=612x612&w=0&k=20&c=FEdgjlTGZ2qnAt1tM5suLJHL8aC4xqZHC6v8esqMLE4=',
        subtext: "tomato ketchup",
        price: "59",
        productinformation:
            "Paratha is a type of unleavened flatbread that is popular in Indian cuisine. It is typically made with whole wheat flour, water, and salt, which are kneaded together to form a dough. The dough is then rolled out into thin circles and cooked on a hot griddle with oil or ghee (clarified butter)."),
    container1(
        text: "Paneer",
        image:
            'https://media.gettyimages.com/id/1354042949/photo/curd-paneer-masala.jpg?s=612x612&w=0&k=20&c=Q_93IPlKtX71VgeJQDcwWK8J0ut0gWg3H3akCTZqfPs=',
        subtext: "mutter,cheese",
        price: "120",
        productinformation:
            "Paneer is a type of fresh cheese that is common in Indian cuisine. It is a non-melting cheese made by curdling milk with an acidic substance like lemon juice or vinegar, and then pressing the curds into a solid block."),
    container1(
        text: "Butter Chicken",
        image:
            'https://media.gettyimages.com/id/1277362334/photo/tasty-butter-chicken-curry-dish-from-indian-cuisine.jpg?s=612x612&w=0&k=20&c=ZipqYOUrHgdhfLGEPkofL5ogdGa6zj4SyYmYRoDN73Q=',
        subtext: "Butter,spice",
        price: "299",
        productinformation:
            "The marinated chicken is cooked in a tandoor (traditional clay oven), but may be grilled, oven-roasted, or pan-fried. It is served in a mild curry sauce that includes butter"),
    container1(
        text: "dosa",
        image:
            'https://media.gettyimages.com/id/1468704702/photo/masala-dosa.jpg?s=612x612&w=0&k=20&c=muI_f3yKgpFC05L3T7ne9_VJZe0IZ_Y1wUK3bTZWBPg=',
        subtext: 'coconut chutney,sambar',
        price: '70',
        productinformation:
            "A dosa is a thin, savoury crepe in South Indian cuisine made from a fermented batter of ground white gram and rice")
  ];
}
