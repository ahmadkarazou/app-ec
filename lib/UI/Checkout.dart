import 'package:flutter/material.dart';
import 'package:untitled4/UI/Payment.dart';

import '../button.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  bool _isChecked= false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);},
                      icon:Icon(Icons.arrow_back)),
                  SizedBox(width: 100,),
                  Text('Check out',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                ],
              ),
              SizedBox(height: 30,),
              Text('STEP 1',style: TextStyle(color:Color(0xff1D1F22),fontSize: 11, ),),
              Text('Shipping',style: TextStyle(color:Color(0xff1D1F22),fontSize: 25,fontWeight: FontWeight.bold ),),
              SizedBox(height:10),
              SizedBox(height:550,width:double.infinity,
                child: ListView(scrollDirection: Axis.vertical,
                    children:[ Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller:TextEditingController(),
                          decoration: InputDecoration(
                            hintText: 'First Name *',
                          ),
                        ),
                        SizedBox(height: 40.0,),
                        TextField(
                          controller:TextEditingController(),
                          decoration: InputDecoration(
                            hintText: 'Last Name *',
                          ),
                        ),
                        SizedBox(height: 40.0,),
                        TextField(
                          controller:TextEditingController(),
                          decoration: InputDecoration(
                            hintText: 'Country *',
                          ),
                        ),
                        SizedBox(height: 40.0,),
                        TextField(
                          controller:TextEditingController(),
                          decoration: InputDecoration(
                            hintText: 'Street Name *',
                          ),
                        ),
                        SizedBox(height: 40.0,),
                        TextField(
                          controller:TextEditingController(),
                          decoration: InputDecoration(
                            hintText: 'City *',
                          ),
                        ),
                        SizedBox(height: 40.0,),
                        TextField(
                          controller:TextEditingController(),
                          decoration: InputDecoration(
                            hintText: 'State / Province',
                          ),
                        ),
                        SizedBox(height: 40.0,),
                        TextField(
                          controller:TextEditingController(),
                          decoration: InputDecoration(
                            hintText: 'Zip-code *',
                          ),
                        ),
                        SizedBox(height: 40.0,),
                        TextField(
                          controller:TextEditingController(),
                          decoration: InputDecoration(
                            hintText: 'Phone Number *',
                          ),
                        ),
                        SizedBox(height:20),
                        Text('Shipping method',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        SizedBox(height:15),
                        SizedBox(height:221,width: 350,
                          child: ListView(
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                      children: [
                                        Checkbox(value:_isChecked, onChanged: (value){
                                          setState((){
                                            _isChecked=value!;
                                          });
                                        },
                                        checkColor: Color(0xff508A7B),),
                                        Text('Free',style: TextStyle(fontWeight: FontWeight.bold),),
                                        Text('Delivery to home',style: TextStyle(color: Colors.black45),)
                                      ],
                                    ),
                                    Text('Delivery from 3 to 7 business days',style: TextStyle(color: Colors.black38),)
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                      children: [
                                        Checkbox(value:_isChecked, onChanged: (value){
                                          setState((){
                                            _isChecked=value!;
                                          });
                                        },
                                          checkColor: Color(0xff508A7B),),
                                        Text('\$9.90',style: TextStyle(fontWeight: FontWeight.bold),),
                                        Text('Delivery to home',style: TextStyle(color: Colors.black45),)
                                      ],
                                    ),
                                    Text('Delivery from 4 to 6 business days',style: TextStyle(color: Colors.black38),)
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                      children: [
                                        Checkbox(value:_isChecked, onChanged: (value){
                                          setState((){
                                            _isChecked=value!;
                                          });
                                        },
                                          checkColor: Color(0xff508A7B),),
                                        Text('\$ 10.20',style: TextStyle(fontWeight: FontWeight.bold),),
                                        Text('Delivery to home',style: TextStyle(color: Colors.black45),)
                                      ],
                                    ),
                                    Text('Delivery from 2 to 3 business days',style: TextStyle(color: Colors.black38),)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(height:20),
                        // Text('Enter Coupon Code',style: TextStyle(fontSize: 16),),
                        // Container(height: 55,
                        //   width: 311,
                        //   decoration: BoxDecoration(color: Colors.grey.shade200,
                        //       borderRadius: BorderRadius.all(
                        //           Radius.circular(20)),
                        //       ),
                        //   child:
                        //   Row(
                        //     children: [
                        //       TextField(
                        //         controller:TextEditingController(),
                        //         decoration: InputDecoration(
                        //           hintText: ' Have a code? type it here',
                        //         ),
                        //       ),
                        //       TextButton(onPressed: (){}, child: Text('validate',style: TextStyle(color: Color(0xff508A7B)),textAlign: TextAlign.end,))
                        //     ],
                        //   ),
                        // ),
                        SizedBox(height:10),
                        Text('Billing Address',style: TextStyle(fontSize:16,fontWeight: FontWeight.bold ),),
              Row(mainAxisAlignment:MainAxisAlignment.start,
                children: [
                  Checkbox(value:_isChecked, onChanged: (value){
                    setState((){
                      _isChecked=value!;
                    });
                  },
                    checkColor: Color(0xff508A7B),),
                  Text('Copy Address data from Shipping'),
                      ],
                    ),
              SizedBox(height:20),
              Center(
                child: ElevatedButton(
                  style: buttonPrimary,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  Payment()));
                  },
                  child: Text(
                    'Continue to Payment', style: TextStyle(color: Colors.white,fontSize:20,fontWeight: FontWeight.w700 ),
                  ),
                ),
              ),
                      ]
                  ),
             ],
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}
