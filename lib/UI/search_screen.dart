import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController Search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Search',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
            child: Column(
          children: [
            TextFormField(
              controller: Search,
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(
                  Icons.search,
                  size: 30,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 15),
            CategureWidget(imageUrl:  'assets/images/أنواع_الحرف_اليدوية.jpg',title: 'Hand med'),
            SizedBox(height: 15),
            CategureWidget(imageUrl:  'assets/images/pngtree-artistic-metal-tree-wall-art-wall-decor-picture-image_3640734.jpg',title: 'Arts and decoration'),
            SizedBox(height: 15),
            CategureWidget(imageUrl:  'assets/images/أكلات-آسيوية-الأشهر-والأكثر-تناولا-8790.jpg',title: 'Food'),
            SizedBox(height: 15),
            CategureWidget(imageUrl:  'assets/images/gateaux.jpg',title: 'candies'),
            SizedBox(height: 15),

          ],
        )),
      ),
    ));
  }
}

class CategureWidget extends StatelessWidget {
  const CategureWidget({
    Key? key,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  final String imageUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: 175,
      width: double.infinity,
      decoration: BoxDecoration(
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
                padding: const EdgeInsets.only(left: 10.0),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
