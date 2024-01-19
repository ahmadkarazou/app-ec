import 'package:flutter/material.dart';

import 'Categore_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController Search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: hei * 0.08,
        title: Container(
          width: wid,
          height: hei * 0.06,
          child: TextField(
            controller: Search,
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(fontSize: 20, height: 3.5),
              prefixIcon: Icon(
                Icons.search,
                size: 30,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
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
      )),
    ));
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
          builder: (context) => CategoreScreen(nameList: category),
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
                  padding: const EdgeInsets.only(left: 15.0,top: 10),
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
