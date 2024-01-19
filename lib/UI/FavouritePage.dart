import 'package:flutter/material.dart';


import '../model/food_api_model.dart';
import '../widget/prodect_widget.dart';
import 'detal_prudacte_screen.dart';
import 'prodect.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Product> favoriteProducts =
      demoProducts.where((product) => product.isFavourite).toList();

  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Favorite',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.77,
            ),
            itemCount: item.where((element) => element.isFavo).length,
            itemBuilder: (context, index) {
              final favoriteItems = item.where((element) => element.isFavo).toList()[index];

              return PrudacteWidgets(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetalPrudacteScreen(
                      index: item.indexOf(favoriteItems),
                    ),
                  ));
                },
                isFavourite: favoriteItems.isFavo,
                imageUrl: favoriteItems.image,
                title: favoriteItems.title,
                Pries: favoriteItems.price,
                isCart: item[index].isCart,
                addCart: () {
                  setState(() {
                    cartItem(item.indexOf(favoriteItems));
                  });
                },
                addFaverite: () {
                  setState(() {
                    favoriteItem(item.indexOf(favoriteItems));
                  });
                },
              );
            },
          )


        // GridView.builder(
          //   crossAxisCount: 2,
          //   childAspectRatio: hei * 0.0009,
          //   children: [
          //     Container(
          //       height: hei,
          //       child: PrudacteWidget(
          //           onTap: (){},
          //           isFavourite: true,
          //           imageUrl: 'assets/images/art-home2.jpeg',
          //           title: 'Luxury soap',
          //           Pries: 29.43),
          //     ),
          //     PrudacteWidget(
          //         onTap: (){},
          //         isFavourite: true,
          //         imageUrl: 'assets/images/art-home1.jpeg',
          //         title: 'Luxury soap',
          //         Pries: 29.43),
          //     PrudacteWidget(
          //         onTap: (){},
          //         isFavourite: true,
          //         imageUrl: 'assets/images/art-home.jpeg',
          //         title: 'Luxury soap',
          //         Pries: 29.43),
          //     PrudacteWidget(
          //         onTap: (){},
          //         isFavourite: true,
          //         imageUrl: 'assets/images/lnsider_monkey.jpeg',
          //         title: 'Luxury soap',
          //         Pries: 29.43),
          //     PrudacteWidget(
          //       onTap: (){},
          //         isFavourite: true,
          //         imageUrl: 'assets/images/images.jpg',
          //         title: 'Luxury soap',
          //         Pries: 29.43),
          //   ],
          // )
          // Center(
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: SizedBox(
          //         width: 350,
          //         height: 600,
          //         child: ListView.separated(
          //             itemBuilder: (context, index) => ProductCard(
          //                   product: favoriteProducts[index],
          //                   onPress: () {
          //                     // Handle card tap as needed
          //                   },
          //                   onFavoriteChanged: (isFavourite) {
          //                     setState(() {
          //                       favoriteProducts = [
          //                         ...favoriteProducts
          //                       ]; // Create a new list
          //                       final productIndex = favoriteProducts.indexWhere(
          //                           (product) =>
          //                               product.id == favoriteProducts[index].id);
          //
          //                       if (isFavourite) {
          //                         // Add the product to favorites
          //                         if (productIndex == -1) {
          //                           favoriteProducts.add(favoriteProducts[index]);
          //                         }
          //                       } else {
          //                         // Remove the product from favorites
          //                         if (productIndex != -1) {
          //                           favoriteProducts.removeAt(productIndex);
          //                         }
          //                       }
          //                     });
          //                   },
          //                 ),
          //             separatorBuilder: (context, index) {
          //               return SizedBox(
          //                 height: 30,
          //               );
          //             },
          //             itemCount: favoriteProducts.length)),
          //   ),
          // ),
          ),
    );
  }
}

// class PrudacteWidget extends StatefulWidget {
//   PrudacteWidget({
//     super.key,
//     required this.imageUrl,
//     required this.title,
//     required this.Pries,
//     required this.isFavourite,
//     required this.onTap,
//   });
//
//   final String imageUrl;
//   final String title;
//   final String Pries;
//   final bool isFavourite;
//   final VoidCallback onTap;
//
//   @override
//   State<PrudacteWidget> createState() => _PrudacteWidgetState();
// }
//
// class _PrudacteWidgetState extends State<PrudacteWidget> {
//   @override
//   Widget build(BuildContext context) {
//     double hei = MediaQuery.of(context).size.height;
//     double wid = MediaQuery.of(context).size.width;
//     return Container(
//       margin: const EdgeInsets.all(10),
//       padding: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(color: Colors.grey)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           TextButton(
//             onPressed: widget.onTap,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: Image.asset(
//                 widget.imageUrl,
//                 height: hei * 0.15,
//               ),
//             ),
//           ),
//           SizedBox(height: hei * 0.01),
//           Text(
//             widget.title,
//             style: TextStyle(
//                 fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: hei * 0.01),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 '\$${widget.Pries}',
//                 style: TextStyle(
//                     color: Colors.grey,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 15),
//               ),
//               CircleAvatar(
//                 backgroundColor: Colors.white,
//                 child: IconButton(
//                   onPressed: () {},
//                   icon: Icon(
//                     Icons.favorite,
//                     color: (widget.isFavourite) ? Colors.red : Colors.grey,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
