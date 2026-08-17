import 'package:plants_app/core/app_colors.dart';
import 'package:plants_app/core/app_icons.dart';
import 'package:plants_app/core/models/plant_item_model.dart';

class AppData {
  static List<String> get categories => [
    'Plants', 'Flowers',  'Cacti', 'Herbs', 'Bonsai'
  ];

  static List<PlantItemModel> get plants => [
    PlantItemModel(id: '1', title: 'The Palm Bliss', description: 'Perfect for beginners or anyone looking for an easy-to-care-for plant', image: AppIcons.palmTree, price: 49.9, color: AppColors.plantItemColor1),
    PlantItemModel(id: '2', title: 'The Potted Head', description: 'A tall statement plant that thrives in bright indirect light', image: AppIcons.palmBlissPlant, price: 74.9, color: AppColors.plantItemColor2),
    PlantItemModel(id: '3', title: 'The Fern Friend', description: 'Lush and leafy, ideal for humid spaces like bathrooms', image: AppIcons.palmTree, price: 49.9, color: AppColors.plantItemColor13),
  ];
}