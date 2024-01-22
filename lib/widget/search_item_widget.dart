import 'package:flutter/material.dart';

class SearchItemWidgets extends StatefulWidget {
  const SearchItemWidgets({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.Pries,
    required this.onTap,
  });

  final String imageUrl;
  final String title;
  final String Pries;

  final VoidCallback onTap;

  @override
  State<SearchItemWidgets> createState() => _SearchItemWidgetsState();
}

class _SearchItemWidgetsState extends State<SearchItemWidgets> {
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
      height: hei * 0.15,
      child: Row(
        children: [
          SizedBox(
            width: wid * 0.35,
            child: Container(
              margin: EdgeInsets.all(10),
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
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment:  MainAxisAlignment.center,
            children: [
              SizedBox(
                width: wid * 0.55,
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
                    SizedBox(height: hei*0.01),
                    Text(
                      '\$${widget.Pries}',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
