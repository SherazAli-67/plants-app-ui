import 'dart:ui';

class PlantItemModel {
  final String id;
  final String title;
  final String image;
  final String description;
  final double price;
  final Color color;

  PlantItemModel({required this.id, required this.title, required this.description, required this.image, required this.price, required this.color});
}