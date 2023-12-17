import 'package:flutter/material.dart';

class CategoreScreen extends StatefulWidget {
  const CategoreScreen({super.key});

  @override
  State<CategoreScreen> createState() => _CategoreScreenState();
}

class _CategoreScreenState extends State<CategoreScreen> {
  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          //backgroundColor: Colors.grey.shade100,
          appBar: AppBar(
            // backgroundColor: Colors.grey.shade100,
            centerTitle: true,
            title: Text(
              'Hand made',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: hei * 0.00092,
            children: [
              Container(
                height: hei,
                child: PrudacteWidget(
                    AddCart: () {},
                    onTap: () {},
                    isFavourite: true,
                    isCart: false,
                    imageUrl: 'assets/images/wonder_forest.jpeg',
                    title: 'Luxury soap',
                    Pries: 29.43),
              ),
              PrudacteWidget(
                  AddCart: () {},
                  onTap: () {},
                  isCart: true,
                  isFavourite: false,
                  imageUrl: 'assets/images/small -trends.jpeg',
                  title: 'Luxury soap',
                  Pries: 29.43),
              PrudacteWidget(
                  AddCart: () {},
                  onTap: () {},
                  isCart: true,
                  isFavourite: false,
                  imageUrl: 'assets/images/lnsider_monkey.jpeg',
                  title: 'Luxury soap',
                  Pries: 29.43),
              PrudacteWidget(
                  AddCart: () {},
                  onTap: () {},
                  isCart: true,
                  isFavourite: false,
                  imageUrl: 'assets/images/art-home2.jpeg',
                  title: 'Luxury soap',
                  Pries: 29.43),
              PrudacteWidget(
                  AddCart: () {},
                  onTap: () {},
                  isCart: true,
                  isFavourite: false,
                  imageUrl: 'assets/images/images.jpg',
                  title: 'Luxury soap',
                  Pries: 29.43),
            ],
          )),
    );
  }
}

class PrudacteWidget extends StatefulWidget {
  PrudacteWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.Pries,
    required this.isFavourite,
    required this.onTap,
    required this.AddCart,
    required this.isCart,
  });

  final String imageUrl;
  final String title;
  final double Pries;
  final bool isFavourite;
  final bool isCart;
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
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(color: Colors.grey),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              spreadRadius: .5,
              blurRadius: 6,
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: widget.onTap,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                widget.imageUrl,
                height: hei * 0.17,
              ),
            ),
          ),
          Text(
            widget.title,
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
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
                  SizedBox(width: wid * 0.03),
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: (widget.isFavourite)
                        ? Colors.red.shade100
                        : Colors.grey.shade100,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        size: 14,
                        Icons.favorite,
                        color: (widget.isFavourite) ? Colors.red : Colors.grey,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
