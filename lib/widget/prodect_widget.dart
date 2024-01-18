import 'package:flutter/material.dart';

class PrudacteWidgets extends StatefulWidget {
  const PrudacteWidgets({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.Pries,
    required this.isFavourite,
    required this.onTap,
    required this.isCart,
    required this.addCart,
    required this.addFaverite,
  });

  final bool isCart;
  final String imageUrl;
  final String title;
  final String Pries;
  final bool isFavourite;
  final VoidCallback onTap;
  final VoidCallback addCart;
  final VoidCallback addFaverite;

  @override
  State<PrudacteWidgets> createState() => _PrudacteWidgetsState();
}

class _PrudacteWidgetsState extends State<PrudacteWidgets> {
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
                            onPressed: widget.addCart,
                            icon: Icon(
                              Icons.add_shopping_cart,
                              size: 15,
                              color:
                              (widget.isCart) ? Colors.blue : Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(width: wid * 0.01),
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: (widget.isFavourite)
                              ? Colors.red.shade100
                              : Colors.grey.shade100,
                          child: IconButton(
                            onPressed: widget.addFaverite,
                            icon: Icon(
                              Icons.favorite,
                              size: 15,
                              color: (widget.isFavourite)
                                  ? Colors.red
                                  : Colors.grey,
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
