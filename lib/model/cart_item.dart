import 'package:untitled4/model/food_api_model.dart';

class CartItem {
  List cartItems = [];

  void addItem(
    int id,
    String title,
    String price,
    String description,
    String category,
    String image,
  ) {
    cartItems.add(Items(
        id: id,
        title: title,
        price: price,
        description: description,
        category: category,
        image: image));
  }
}
