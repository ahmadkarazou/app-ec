import 'package:flutter/material.dart';
import 'package:untitled4/model/food_api_model.dart';

import '../UI/Categore_screen.dart';
import '../UI/detal_prudacte_screen.dart';
import '../widget/prodect_widget.dart';
import '../widget/search_item_widget.dart';

class DataSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return query == ""
        ? SingleChildScrollView(
            child: Column(
            children: [
              SizedBox(height: 15),
              CategureWidget(
                  imageUrl: 'assets/images/أنواع_الحرف_اليدوية.jpg',
                  title: 'Hand med',
                  category: "men's clothing"),
              SizedBox(height: 15),
              CategureWidget(
                imageUrl:
                    'assets/images/pngtree-artistic-metal-tree-wall-art-wall-decor-picture-image_3640734.jpg',
                title: 'Arts and decoration',
                category: "women's clothing",
              ),
              SizedBox(height: 15),
              CategureWidget(
                imageUrl:
                    'assets/images/أكلات-آسيوية-الأشهر-والأكثر-تناولا-8790.jpg',
                title: 'Food',
                category: "food",
              ),
              SizedBox(height: 15),
              CategureWidget(
                imageUrl: 'assets/images/gateaux.jpg',
                title: 'candies',
                category: "food",
              ),
              SizedBox(height: 15),
            ],
          ))
        : ListView.builder(
            itemCount:
                item.where((element) => element.title.contains(query)).length,
            itemBuilder: (context, index) {
              final favoriteItems = item
                  .where((element) => element.title.contains(query))
                  .toList()[index];

              return SearchItemWidgets(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetalPrudacteScreen(
                      index: item.indexOf(favoriteItems),
                    ),
                  ));
                },
                imageUrl: favoriteItems.image,
                title: favoriteItems.title,
                Pries: favoriteItems.price,
              );
            },
          );
  }
}

class CategureWidget extends StatelessWidget {
  const CategureWidget({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.category,
  }) : super(key: key);

  final String imageUrl;
  final String title;
  final String category;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CategoreScreen(nameList: category,  title: title),
        ));
      },
      child: Container(
        height: 175,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black54, spreadRadius: .1, blurRadius: 5)
          ],
          color: Colors.black,
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
          image: DecorationImage(
            image: AssetImage(imageUrl),
            opacity: 0.7,
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 10),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
