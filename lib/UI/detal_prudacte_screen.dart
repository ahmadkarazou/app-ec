import 'package:flutter/material.dart';

import '../widget/button.dart';

class DetalPrudacteScreen extends StatefulWidget {
  const DetalPrudacteScreen({super.key});

  @override
  State<DetalPrudacteScreen> createState() => _DetalPrudacteScreenState();
}

bool isFavourite = true;

class _DetalPrudacteScreenState extends State<DetalPrudacteScreen> {
  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Luxury Soap',
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
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                          image: AssetImage('assets/images/images.jpg'),
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
                            isFavourite = !isFavourite;
                          });
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: (isFavourite) ? Colors.red : Colors.grey,
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
                padding: EdgeInsets.only(left: 20,right: 20,top: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Natural rose soap',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$ 19.99',
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
                        height: hei*0.25,
                        child: SingleChildScrollView(
                          child: Text(
                            '''Quality: 375g (each 125g);
Product form: solid Keeps your skin moisturized 
Area of use: body and face
Usage: Lather and apply generously to the skin,then massage gently.
For best results, apply a rich lather and leave for 2 minutes before washing 
Target group: men and women. 
Skin type: All skin types''',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: hei * 0.05),
                      ElevatedButton(
                        onPressed: () {},
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
