import 'package:flutter/material.dart';

import '../button.dart';
import 'Checkout.dart';

class Cart extends StatefulWidget {
  Cart({super.key});

  static const IconData trash = IconData(0xf4c4);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int num = 0;

  void _increment(){
    setState(()
    {
      num++;
    });
  }

  void _decrement(){
    setState(()
    {
      num--;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 450,
              width: 358,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.grey[200],
                      ),
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              Positioned(
                                  top: 136,
                                  left: 28,
                                  height: 27,
                                  width: 27,
                                  child: Icon(Icons.favorite)),
                              Image.asset(
                                'assets/images/images.jpg',
                                width: 135,
                                height: 129,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Natural rose soap',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 20),
                              ),
                              Text(
                                '\$ 19.99',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 20),
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 29,
                                    width: 105,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        border:
                                            Border.all(color: Colors.black54)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(onPressed: (){
                                          _decrement();
                                        },
                                            icon:Icon(Icons.remove), iconSize:4.25),
                                        Text('$num',
                                            style: TextStyle(fontSize: 12)),
                                        IconButton(onPressed: (){
                                          _increment();
                                        },
                                            icon:Icon(Icons.add), iconSize:4.25),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Container(
                                      height: 28,
                                      width: 61,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          border: Border.all(
                                              color: Colors.black54)),
                                      child: Icon(
                                        Icons.delete_outline_outlined,
                                        color: Colors.black54,
                                      )),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height:15),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.grey[200],
                      ),
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              Positioned(
                                  top: 136,
                                  left: 28,
                                  height: 27,
                                  width: 27,
                                  child: Icon(Icons.favorite)),
                              Image.asset(
                                'assets/images/images.jpg',
                                width: 135,
                                height: 129,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Natural rose soap',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 20),
                              ),
                              Text(
                                '\$ 19.99',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 20),
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 29,
                                    width: 105,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        border:
                                        Border.all(color: Colors.black54)),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(onPressed: (){
                                          _decrement();
                                        }
                                            ,icon:Icon(Icons.remove), iconSize:4.25),
                                        Text('$num',
                                            style: TextStyle(fontSize: 12)),
                                        IconButton(onPressed: (){
                                          _increment();
                                        },
                                            icon:Icon(Icons.add), iconSize:4.25),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Container(
                                      height: 28,
                                      width: 61,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          border: Border.all(
                                              color: Colors.black54)),
                                      child: Icon(
                                        Icons.delete_outline_outlined,
                                        color: Colors.black54,
                                      )),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height:15),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.grey[200],
                      ),
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              Positioned(
                                  top: 136,
                                  left: 28,
                                  height: 27,
                                  width: 27,
                                  child: Icon(Icons.favorite)),
                              Image.asset(
                                'assets/images/images.jpg',
                                width: 135,
                                height: 129,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Natural rose soap',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 20),
                              ),
                              Text(
                                '\$ 19.99',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 20),
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 29,
                                    width: 105,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        border:
                                        Border.all(color: Colors.black54)),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(onPressed: (){
                                          _decrement();
                                        }
                                            ,icon:Icon(Icons.remove), iconSize:4.25),
                                        Text('$num',
                                            style: TextStyle(fontSize: 12)),
                                        IconButton(onPressed: (){
                                          _increment();
                                        }
                                            ,icon:Icon(Icons.add), iconSize:4.25),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Container(
                                      height: 28,
                                      width: 61,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          border: Border.all(
                                              color: Colors.black54)),
                                      child: Icon(
                                        Icons.delete_outline_outlined,
                                        color: Colors.black54,
                                      )),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                height:170,
                width:double.infinity,
                decoration: BoxDecoration(color: Colors.grey[300],
                  borderRadius: BorderRadius.all(
                      Radius.circular(20)),),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Product price',style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14,color:Color(0xff707070)),),
                          SizedBox(width: 60,),
                          Text('\$ 59.97',style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14,color:Color(0xff707070)),),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Shipping',style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14,color:Color(0xff707070)),),
                          SizedBox(width: 60,),
                          Text('Free Shipment',style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14,color:Color(0xff707070)),),
                        ],
                      ),
                      SizedBox(height: 35,),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Subtotal',style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14,),),
                          SizedBox(width: 60,),
                          Text('\$ 59.97',style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),),
                        ],
                      ),
                      SizedBox(height:40),
                      ElevatedButton(
                        style: buttonPrimary,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  Checkout()));
                        },
                        child: Text(
                          'Proceed to Checkout', style: TextStyle(color: Colors.white,fontSize:20,fontWeight: FontWeight.w700 ),
                        ),
                      ),
                    ],
                  ),
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
