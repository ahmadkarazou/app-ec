import 'dart:convert';

import 'package:http/http.dart' as http;

class Items {
  final int id;
  final String title;
  final String price;
  final String description;
  final String category;
  final String image;
  bool isFavo;

  Items(
      {required this.id,
        this.isFavo =false,
        required this.title,
        required this.price,
        required this.description,
        required this.category,
        required this.image});
}

// class Api {
//   Future fetchProducts() async {
//     final http.Response response =
//     await http.get(Uri.parse('www.themealdb.com/api/json/v1/1/search.php?f=a'));
//     if (response.statusCode == 200) {
//       List data = jsonDecode(response.body);
//
//       for (var element in data) {
//         item.add(
//           Items(
//             id: element['idMeal'],
//             isFavo: false,
//             title: element['strMeal'],
//             price: element['price'].toString(),
//             description: element['strInstructions'],
//             category: element['strCategory'],
//             image: element['strMealThumb'],
//           ),
//         );
//       }
//     }
//   }
//   void favoriteItem(int index) {
//     if (index >= 0 && index < item.length) {
//       item[index].isFavo= !item[index].isFavo!;
//     }
//   }
// }
// Api api=Api();
// List<Items> item = [];
