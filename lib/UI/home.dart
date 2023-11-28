import 'package:flutter/material.dart';

import 'Cart.dart';
import 'Profile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  TextEditingController Search = TextEditingController();
  List<Widget> pages = [
    HomePage(),
    Cart(),
    Profile(),
  ];
  int selectedindex = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Column(),
      appBar: AppBar(centerTitle: true,
        title: Text(

          'Fresh home',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_outlined,
                size: 35,
              ))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        currentIndex: selectedindex,
        onTap: (index) {
          setState(() {
            selectedindex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined), label: ''),
        ],
      ),
      body: pages.elementAt(selectedindex),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });

  TextEditingController Search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          SizedBox(height: 10),
          Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                      image:AssetImage(
                          'assets/images/e5e02c364e5cf881eb5ba87273800659_1.jpg'),
                      opacity: .70,
                      fit: BoxFit.fitWidth),
                  borderRadius: BorderRadius.all(
                    Radius.circular(24),
                  ),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                height: 175,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Fresh \nproducts',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Special for you',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              TextButton(onPressed: () {}, child: Text('See More',style: TextStyle(color: Colors.grey),))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SectionsImage(
                  name: 'Hand med',
                  image:
                      'assets/images/white-hand-pen-icon-md-removebg-preview.png'),
              SectionsImage(
                  name: 'decoration',
                  image: 'assets/images/download-removebg-preview.png'),
              SectionsImage(
                  name: 'Food',
                  image: 'assets/images/94ee2fda4931c26b3c55ed23d28e885e.png'),
              SectionsImage(
                  name: 'candies',
                  image: 'assets/images/download__1_-removebg-preview.png'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'popular products',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              TextButton(onPressed: () {}, child: Text('See More',style: TextStyle(color: Colors.grey),))
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                prudact_widget(
                    imageUrl: 'assets/images/images.jpg',
                    title: 'Luxury soap',
                    Pries: 29.43),
                prudact_widget(
                    imageUrl: 'assets/images/images.jpg',
                    title: 'Luxury soap',
                    Pries: 29.43),
                prudact_widget(
                    imageUrl: 'assets/images/images.jpg',
                    title: 'Luxury soap',
                    Pries: 29.43),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Mega Sale',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              TextButton(onPressed: () {}, child: Text('See More',style: TextStyle(color: Colors.grey),))
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                prudact_widget(
                    imageUrl: 'assets/images/images.jpg',
                    title: 'Luxury soap',
                    Pries: 29.43),
                prudact_widget(
                    imageUrl: 'assets/images/images.jpg',
                    title: 'Luxury soap',
                    Pries: 29.43),
                prudact_widget(
                    imageUrl: 'assets/images/images.jpg',
                    title: 'Luxury soap',
                    Pries: 29.43),
              ],
            ),
          )
        ],
      )),
    );
  }
}

class prudact_widget extends StatelessWidget {
  const prudact_widget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.Pries,
  });

  final String imageUrl;
  final String title;
  final double Pries;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)),
      height: 240,
      width: 170,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imageUrl,
            width: 150,
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            '\$$Pries',
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ],
      ),
    );
  }
}

class SectionsImage extends StatelessWidget {
  SectionsImage({
    required this.name,
    required this.image,
    super.key,
  });

  String image;
  String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          padding: const EdgeInsets.all(15),
          child: Image.asset(image, fit: BoxFit.fitWidth),
        ),
        Text(name),
      ],
    );
  }
}
