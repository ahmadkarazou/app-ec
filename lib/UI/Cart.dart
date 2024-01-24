import 'package:flutter/material.dart';
import 'package:untitled4/UI/checkout_anemashen.dart';
import 'package:untitled4/model/cart_item.dart';

import '../model/food_api_model.dart';
import '../widget/button.dart';
import '../widget/prodect_widget.dart';
import 'Checkout.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  static const IconData trash = IconData(0xf4c4);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  double pries=0.0;
  void initState() {
    super.initState();
    calculateTotalPrice();
  }

  void calculateTotalPrice() {
    pries = 0.0;
    for (var cartItem in item) {
      if (cartItem.isCart) {
        pries += double.parse(cartItem.price);
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [SizedBox(height: hei*0.005),
            SizedBox(
                height: hei * 0.54,
                width: wid,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: item.length,
                  itemBuilder: (context, index) {
                    if (item[index].isCart) {
                      // pries=pries+(item[index].price);
                      return CartPrudacte(

                        urlImage: item[index].image,
                        name: item[index].title,
                        pries:double.parse(item[index].price) ,
                        deleteItem: () {
                          setState(() {
                            cartItem(index);
                            calculateTotalPrice();
                          });
                        },
                      );

                    } else {
                      return SizedBox.shrink();
                    }
                  },
                )),
            Container(
              padding: EdgeInsets.only(left: 20, top: 30, right: 20),
              height: hei * 0.25,
              width: wid,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black54, spreadRadius: .1, blurRadius: 5)
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Product price',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black54),
                      ),
                      Text(
                        '\$ ${pries.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                  SizedBox(height: hei * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Shipping',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black54),
                      ),
                      Text(
                        'Free Shipment',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                  SizedBox(height: hei * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Subtotal',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '\$ ${pries.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: hei * 0.02),
                  ElevatedButton(
                    style: buttonPrimary,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CheckoutScreen()));
                    },
                    child: Text(
                      'Proceed to Checkout',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartPrudacte extends StatefulWidget {
  const CartPrudacte(
      {super.key,
      required this.urlImage,
      required this.name,
      required this.pries,
      required this.deleteItem});

  final String urlImage;
  final String name;
  final double pries;
  final VoidCallback deleteItem;

  @override
  State<CartPrudacte> createState() => _CartPrudacteState();
}

class _CartPrudacteState extends State<CartPrudacte> {
  int num = 1;

  void _increment() {
    setState(() {
      num++;
    });
  }

  void _decrement() {
    setState(() {
      if (num > 1) {
        num--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: wid,
      height: hei * 0.2,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black54, spreadRadius: .1, blurRadius: 5)
        ],
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              widget.urlImage,
              fit: BoxFit.fitWidth,
              width: wid * 0.25,
              height: hei * 0.25,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: wid * .60,
                child: Text(
                  widget.name,
                  maxLines: 1,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(238, 114, 100, 1),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                '\$ ${widget.pries}',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20,color: Color.fromRGBO(238, 114, 100, 0.75)),
              ),
              Row(
                children: [
                  Container(
                    height: hei * 0.05,
                    width: wid * 0.3,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color:Color.fromRGBO(238, 114, 100, 1),
                            spreadRadius: .1,
                            blurRadius: 5)
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              _decrement();
                            },
                            icon: Icon(Icons.remove,color: Color.fromRGBO(238, 114, 100, 1),),
                            iconSize: 15),
                        Text('$num', style: TextStyle(fontSize: 15)),
                        IconButton(
                            onPressed: () {
                              _increment();
                            },
                            icon: Icon(Icons.add,color: Color.fromRGBO(238, 114, 100, 1),),
                            iconSize: 15),
                      ],
                    ),
                  ),
                  SizedBox(width: wid * 0.03),
                  Container(
                      height: hei * 0.05,
                      width: wid * 0.12,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color:Color.fromRGBO(238, 114, 100, 1),
                                spreadRadius: .1,
                                blurRadius: 5)
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white),
                      child: IconButton(
                        onPressed:widget.deleteItem,
                        icon: Icon(
                          Icons.delete_outline_outlined,
                          color: Colors.red,
                        ),
                      )),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
