import 'package:flutter/material.dart';

import '../modal/button.dart';
import 'Checkout.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  static const IconData trash = IconData(0xf4c4);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: hei * 0.5,
              width: wid,
              child: ListView(
                children: [
                  CartPrudacte(),
                  CartPrudacte(),
                  CartPrudacte(),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20,top: 30,right: 20),
              height: hei * 0.31,
              width: wid,
              decoration: BoxDecoration(
                color: Colors.grey[300],
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
                            color: Colors.grey),
                      ),

                      Text(
                        '\$ 59.97',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: hei*0.015
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Shipping',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.grey),
                      ),

                      Text(
                        'Free Shipment',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: hei*0.025,
                  ),
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
                        '\$ 59.97',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: hei*0.05),
                  ElevatedButton(
                    style: buttonPrimary,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Checkout()));
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
  const CartPrudacte({super.key});

  @override
  State<CartPrudacte> createState() => _CartPrudacteState();
}

class _CartPrudacteState extends State<CartPrudacte> {
  int num = 0;

  void _increment() {
    setState(() {
      num++;
    });
  }

  void _decrement() {
    setState(() {
      num--;
    });
  }

  bool isFavourite = false;

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
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.grey[200],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/images.jpg',
                  width: wid * 0.31,
                  height: hei * 0.31,
                ),
              ),
              Positioned(
                left: 5,
                top: 5,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        isFavourite = !isFavourite;
                        print(isFavourite);
                      });
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: (isFavourite) ? Colors.red : Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Natural rose soap',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
              Text(
                '\$ 19.99',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
              Row(
                children: [
                  Container(
                    height: hei * 0.05,
                    width: wid * 0.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.black54)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              _decrement();
                            },
                            icon: Icon(Icons.remove),
                            iconSize: 15),
                        Text('$num', style: TextStyle(fontSize: 15)),
                        IconButton(
                            onPressed: () {
                              _increment();
                            },
                            icon: Icon(Icons.add),
                            iconSize: 15),
                      ],
                    ),
                  ),
                  SizedBox(width: wid * 0.03),
                  Container(
                      height: hei * 0.05,
                      width: wid * 0.12,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(color: Colors.black54)),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete_outline_outlined,
                          color: Colors.black54,
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
