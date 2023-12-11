import 'package:flutter/material.dart';
import 'package:untitled4/UI/Categore_screen.dart';
import 'package:untitled4/UI/Profile.dart';
import 'package:untitled4/UI/detal_prudacte_screen.dart';
import 'package:untitled4/UI/notification_screen.dart';
import 'package:untitled4/UI/search_screen.dart';
import 'package:untitled4/modal/drawer_app.dart';

import 'Cart.dart';

class Home extends StatefulWidget {
  Home({super.key, this.selectedindex= 0});

   int? selectedindex =0;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  List<Widget> pages = [
    const HomePage(),
    const Cart(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const DrawerApp(),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Fresh home',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchScreen(),
                    ));
              },
              icon: const Icon(
                Icons.search,
                size: 35,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NotificationScreen(),
                ));
              },
              icon: const Icon(
                Icons.notifications_outlined,
                size: 35,
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          currentIndex: widget.selectedindex!,
          onTap: (index) {
            setState(() {
              widget.selectedindex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined), label: ''),
          ],
        ),
        body: pages.elementAt(widget.selectedindex!),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SingleChildScrollView(
          child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/images/e5e02c364e5cf881eb5ba87273800659_1.jpg'),
                      opacity: .70,
                      fit: BoxFit.fitWidth),
                  borderRadius: BorderRadius.all(
                    Radius.circular(24),
                  ),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                height: hei * 0.21,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
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
          SizedBox(height: hei * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Special for you',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SectionsImage(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CategoreScreen(),
                    ));
                  },
                  name: 'Hand med',
                  image:
                      'assets/images/white-hand-pen-icon-md-removebg-preview.png'),
              SectionsImage(
                  onTap: () {},
                  name: 'decoration',
                  image: 'assets/images/download-removebg-preview.png'),
              SectionsImage(
                  onTap: () {},
                  name: 'Food',
                  image: 'assets/images/94ee2fda4931c26b3c55ed23d28e885e.png'),
              SectionsImage(
                  onTap: () {},
                  name: 'candies',
                  image: 'assets/images/download__1_-removebg-preview.png'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'popular products',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'See More',
                    style: TextStyle(color: Colors.grey),
                  ))
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                PrudacteWidget(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetalPrudacteScreen(),
                      ));
                    },
                    isFavourite: false,
                    imageUrl: 'assets/images/images.jpg',
                    title: 'Luxury soap',
                    Pries: 29.43),
                PrudacteWidget(
                    onTap: () {},
                    isFavourite: false,
                    imageUrl: 'assets/images/images.jpg',
                    title: 'Luxury soap',
                    Pries: 29.43),
                PrudacteWidget(
                    onTap: () {},
                    isFavourite: false,
                    imageUrl: 'assets/images/images.jpg',
                    title: 'Luxury soap',
                    Pries: 29.43),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Mega Sale',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'See More',
                    style: TextStyle(color: Colors.grey),
                  ))
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                PrudacteWidget(
                    onTap: () {},
                    isFavourite: true,
                    imageUrl: 'assets/images/images.jpg',
                    title: 'Luxury soap',
                    Pries: 29.43),
                PrudacteWidget(
                    onTap: () {},
                    isFavourite: true,
                    imageUrl: 'assets/images/images.jpg',
                    title: 'Luxury soap',
                    Pries: 29.43),
                PrudacteWidget(
                    onTap: () {},
                    isFavourite: true,
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

class PrudacteWidget extends StatefulWidget {
  const PrudacteWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.Pries,
    required this.isFavourite,
    required this.onTap,
  });

  final String imageUrl;
  final String title;
  final double Pries;
  final bool isFavourite;
  final VoidCallback onTap;

  @override
  State<PrudacteWidget> createState() => _PrudacteWidgetState();
}

class _PrudacteWidgetState extends State<PrudacteWidget> {
  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)),
      height: hei * 0.3,
      width: wid * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: widget.onTap,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    widget.imageUrl,
                  ),
                ),
                Positioned(
                  left: 5,
                  top: 5,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite,
                        color: (widget.isFavourite) ? Colors.red : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: hei * 0.01),
          Text(
            widget.title,
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: hei * 0.01),
          Text(
            '\$${widget.Pries}',
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
    required this.onTap,
  });

  final String image;
  final String name;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return Column(
      children: [
        TextButton(
          onPressed: onTap,
          child: Container(
            height: hei * 0.07,
            width: wid * 0.15,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            padding: const EdgeInsets.all(15),
            child: Image.asset(image, fit: BoxFit.fitWidth),
          ),
        ),
        Text(name),
      ],
    );
  }
}
