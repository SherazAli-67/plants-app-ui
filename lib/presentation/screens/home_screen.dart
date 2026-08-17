import 'package:flutter/material.dart';
import 'package:plants_app/core/app_gradients.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: AppGradients.primaryBgGradient
        ),
      )
    );
  }
}