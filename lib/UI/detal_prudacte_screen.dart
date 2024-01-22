import 'package:flutter/material.dart';
import 'package:untitled4/model/cart_item.dart';

import '../model/food_api_model.dart';
import '../widget/button.dart';

class DetalPrudacteScreen extends StatefulWidget {
  DetalPrudacteScreen({super.key, required this.index});

  final int index;

  @override
  State<DetalPrudacteScreen> createState() => _DetalPrudacteScreenState();
}

class _DetalPrudacteScreenState extends State<DetalPrudacteScreen> {
  CartItem cart = CartItem();

  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back),
            ),
            title: Text(
              item[widget.index].title,
              maxLines: 1,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Column(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                          image: NetworkImage(item[widget.index].image),
                          fit: BoxFit.fitWidth),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    height: hei * 0.25,
                  ),
                  Positioned(
                    right: 25,
                    top: 10,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            favoriteItem(widget.index);
                          });
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: (item[widget.index].isFavo)
                              ? Colors.red
                              : Colors.grey,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: hei * 0.05),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                width: wid,
                height: hei * 0.57,
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: wid * 0.6,
                            child: Text(
                              item[widget.index].title,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            '\$ ${item[widget.index].price}',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amberAccent,
                          ),
                          Text('4.5'),
                        ],
                      ),
                      SizedBox(height: hei * 0.005),
                      Text(
                        'Components',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: hei * 0.02),
                      Container(
                        height: hei * 0.25,
                        child: SingleChildScrollView(
                          child: Text(
                            item[widget.index].description,
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: hei * 0.05),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            cartItem(widget.index);
                          });
                        },
                        style: buttonPrimary,
                        child: const Text('Add To Cart',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                    ]),
              ),
            ],
          )),
    );
  }
}
