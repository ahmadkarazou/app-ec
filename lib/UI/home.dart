import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled4/UI/Categore_screen.dart';
import 'package:untitled4/UI/Profile.dart';
import 'package:untitled4/UI/detal_prudacte_screen.dart';
import 'package:untitled4/UI/notification_screen.dart';
import 'package:untitled4/UI/search_screen.dart';
import 'package:untitled4/model/food_api_model.dart';
import 'package:untitled4/widget/drawer_app.dart';

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
    const Profile(),
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
  Future fetchProducts() async {
    final http.Response response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      for (var element in data) {
        item.add(
          Items(
            id: element['id'],
            isFavo: false,
            title: element['title'],
            price: element['price'].toString(),
            description: element['description'],
            category: element['category'],
            image: element['image'],
          ),
        );
      }
    }
    setState(() {});
  }

  Future fetchMegaSale() async {
    final http.Response response = await http.get(
        Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?f=a'));
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      print("================== :${data['meals']}");
      for (var element in data['meals']) {
        items.add(
          Items(
            id: int.parse(element['idMeal']),
            isFavo: false,
            title: element['strMeal'],
            price: element['idMeal'].toString(),
            description: element['strInstructions'],
            category: element['strCategory'],
            image: element['strMealThumb'],
          ),
        );
      }
    }
    setState(() {});
  }

  List<Items> items = [];
  List<Items> item = [];

  @override
  void initState() {
    fetchProducts();
    fetchMegaSale();
    super.initState();
  }

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
    print(item);
    print(items);
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
                            onPressed: () => fetchProducts(),
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
                    name: 'Hand made',
                    SVGIcon: 'assets/icons/ceramic-pottery-svgrepo-com.svg'),
                SectionsImage(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CategoreScreen(),
                      ));
                    },
                    name: 'decoration',
                    SVGIcon: 'assets/icons/decoration-svgrepo-com.svg'),
                SectionsImage(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CategoreScreen(),
                      ));
                    },
                    name: 'Food',
                    SVGIcon: 'assets/icons/food-svgrepo-com.svg'),
                SectionsImage(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CategoreScreen(),
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
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                  return PrudacteWidget(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetalPrudacteScreen(
                          isFavourite: item[index].isFavo!,
                          pries: item[index].price,
                          imageUrl: item[index].image,
                          name: item[index].title,
                          components: item[index].description,
                          id: item[index].id,
                          category: item[index].category,
                        ),
                      ));
                    },
                    isFavourite: item[index].isFavo!,
                    imageUrl: item[index].image,
                    title: item[index].title,
                    Pries: item[index].price, isCart: false,AddCart: (){},
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Mega Sale',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: hei * 0.31,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return PrudacteWidget(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetalPrudacteScreen(
                          isFavourite: items[index].isFavo!,
                          pries: items[index].price,
                          imageUrl: items[index].image,
                          name: items[index].title,
                          components: items[index].description,
                          id: items[index].id,
                          category: items[index].category,

                        ),
                      ));
                    },
                    isFavourite: items[index].isFavo!,
                    imageUrl: items[index].image,
                    title: items[index].title,
                    Pries: items[index].price, isCart: false,AddCart: (){},
                  );
                },
              ),
            )
          ],
        ),
      ),
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
    required this.onTap, required this.isCart, required this.AddCart,
  });
final bool isCart;
  final String imageUrl;
  final String title;
  final String Pries;
  final bool isFavourite;
  final VoidCallback onTap;
  final VoidCallback AddCart;

  @override
  State<PrudacteWidget> createState() => _PrudacteWidgetState();
}

class _PrudacteWidgetState extends State<PrudacteWidget> {
  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black54, spreadRadius: .1, blurRadius: 5)
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        //border: Border.all(color: Colors.grey)
      ),
      height: hei * 0.29,
      width: wid * 0.42,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 10, left: 10, top: 10),
            child: GestureDetector(
              onTap: widget.onTap,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  widget.imageUrl,
                  height: hei * 0.16,
                ),
              ),
            ),
          ),
          SizedBox(height: hei * 0.01),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Text(
                  widget.title,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${widget.Pries}',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    Row(

                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: (widget.isCart)
                              ? Colors.blue.shade100
                              : Colors.grey.shade100,
                          child: IconButton(
                            onPressed: widget.AddCart,
                            icon: Icon(
                              Icons.add_shopping_cart,
                              size: 15,
                              color: (widget.isCart) ? Colors.blue : Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(width:  wid * 0.01),
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: (widget.isCart)
                              ? Colors.red.shade100
                              : Colors.grey.shade100,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite,
                              size: 15,
                              color: (widget.isFavourite) ? Colors.red : Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
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
        Text(name),
      ],
    );
  }
}
