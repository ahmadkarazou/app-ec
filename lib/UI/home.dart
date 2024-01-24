import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled4/UI/Categore_screen.dart';
import 'package:untitled4/UI/Profile.dart';
import 'package:untitled4/UI/detal_prudacte_screen.dart';
import 'package:untitled4/UI/notification_screen.dart';
import 'package:untitled4/UI/search_screen.dart';
import 'package:untitled4/model/DataSarche.dart';
import 'package:untitled4/model/food_api_model.dart';
import 'package:untitled4/widget/drawer_app.dart';
import 'package:untitled4/widget/prodect_widget.dart';

import 'Cart.dart';

class Home extends StatefulWidget {
  Home({super.key, this.selectedindex = 0});

  int? selectedindex = 0;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  List<Widget> pages = [
    const HomePage(),
    const Cart(),
    Profile(),
  ];
  final _auth = FirebaseAuth.instance;
  late User singedInUser;

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        singedInUser = user;
        print(singedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: DrawerApp(),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Fresh Home".tr,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(238, 114, 100, 1),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
              icon: const Icon(
                Icons.search,
                size: 25,
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
                size: 25,
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          // unselectedItemColor: Colors.blueGrey,
          iconSize: 25,
          selectedItemColor: Color.fromRGBO(238, 114, 100, 1),
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

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 0;
  List<Map<String, String>> itemsImg = [
    {
      'imageUrl': 'assets/images/أنواع_الحرف_اليدوية.jpg',
      'title': 'Hand med',
    },
    {
      'imageUrl':
          'assets/images/pngtree-artistic-metal-tree-wall-art-wall-decor-picture-image_3640734.jpg',
      'title': 'Decoration',
    },
    {
      'imageUrl': 'assets/images/أكلات-آسيوية-الأشهر-والأكثر-تناولا-8790.jpg',
      'title': 'Food',
    },
    {
      'imageUrl': 'assets/images/gateaux.jpg',
      'title': 'candies',
    },
  ];

  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider.builder(
              itemCount: itemsImg.length,
              itemBuilder: (context, index, realIndex) {
                return Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black54,
                              spreadRadius: .1,
                              blurRadius: 5)
                        ],
                        color: Colors.black12,
                        image: DecorationImage(
                            image: AssetImage(itemsImg[index]['imageUrl']!),
                            opacity: .70,
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.all(
                          Radius.circular(24),
                        ),
                      ),
                      margin: const EdgeInsets.all(8),
                      height: hei * 0.21,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              itemsImg[index]['title']!,
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
                );
              },
              options: CarouselOptions(
                height: hei * 0.25,
                onPageChanged: (index, reason) =>
                    setState(() => activeIndex = index),
              ),
            ),
            AnimatedSmoothIndicator(
              effect: ExpandingDotsEffect(
                expansionFactor: 2,
                spacing: 6,
                dotColor: Colors.grey,
                dotWidth: 10,
                dotHeight: 10,
                activeDotColor: Color.fromRGBO(238, 114, 100, 1),
              ),
              activeIndex: activeIndex,
              count: itemsImg.length,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Special for you',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(238, 114, 100, 1),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SectionsImage(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CategoreScreen(
                            nameList: "men's clothing", title: 'Hand made'),
                      ));
                    },
                    name: 'Hand made',
                    SVGIcon: 'assets/icons/ceramic-pottery-svgrepo-com.svg'),
                SectionsImage(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CategoreScreen(
                            nameList: "women's clothing", title: 'decoration'),
                      ));
                    },
                    name: 'decoration',
                    SVGIcon: 'assets/icons/decoration-svgrepo-com.svg'),
                SectionsImage(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            CategoreScreen(nameList: "food", title: 'Food'),
                      ));
                    },
                    name: 'Food',
                    SVGIcon: 'assets/icons/food-svgrepo-com.svg'),
                SectionsImage(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            CategoreScreen(nameList: "food", title: 'candies'),
                      ));
                    },
                    name: 'candies',
                    SVGIcon: 'assets/icons/candies-candy-svgrepo-com.svg'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'popular products',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(238, 114, 100, 1),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: hei * 0.31,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: item.length,
                itemBuilder: (context, index) {
                  return (item[index].category != 'food')
                      ? PrudacteWidgets(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetalPrudacteScreen(
                                index: index,
                              ),
                            ));
                          },
                          isFavourite: item[index].isFavo!,
                          imageUrl: item[index].image,
                          title: item[index].title,
                          Pries: item[index].price,
                          isCart: item[index].isCart,
                          addCart: () {
                            setState(() {
                              cartItem(index);
                            });
                          },
                          addFaverite: () {
                            setState(() {
                              favoriteItem(index);
                            });
                          },
                        )
                      : Container();
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Mega Sale',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(238, 114, 100, 1),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: hei * 0.31,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: item.length,
                itemBuilder: (context, index) {
                  return (item[index].category == 'food')
                      ? PrudacteWidgets(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetalPrudacteScreen(
                                index: index,
                              ),
                            ));
                          },
                          isFavourite: item[index].isFavo!,
                          imageUrl: item[index].image,
                          title: item[index].title,
                          Pries: item[index].price,
                          isCart: item[index].isCart,
                          addCart: () {
                            setState(() {
                              cartItem(index);
                            });
                          },
                          addFaverite: () {
                            setState(() {
                              favoriteItem(index);
                            });
                          })
                      : Container();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SectionsImage extends StatelessWidget {
  SectionsImage({
    required this.name,
    required this.SVGIcon,
    super.key,
    required this.onTap,
  });

  final String SVGIcon;
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
              boxShadow: [
                BoxShadow(
                    color: Colors.black54, spreadRadius: .1, blurRadius: 5)
              ],
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            padding: const EdgeInsets.all(15),
            child: SvgPicture.asset(SVGIcon, fit: BoxFit.fitWidth),
          ),
        ),
        Text(name,style: TextStyle(color: Color.fromRGBO(238, 114, 100, 1)),),
      ],
    );
  }
}
