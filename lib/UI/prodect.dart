import 'package:flutter/material.dart';


class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });

  void toggleFavorite() {
    isFavourite = !isFavourite;

  }
}

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/8f55c0d7a5655b7851b32dcdfe5b1658.jpg",

    ],
    colors: [

      Colors.white,
    ],
    title: "Soap™",
    price: 64.99,
    description: description,
    rating: 4.8,
    isFavourite: false,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/download.jpg",

    ],
    colors: [

      Colors.white,
    ],
    title: "Luxury Soap",
    price: 50.5,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/download (1).jpg",

    ],
    colors: [

      Colors.white,
    ],
    title: "Soap",
    price: 36.55,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),

];

const String description =
    "Luxury soap";
