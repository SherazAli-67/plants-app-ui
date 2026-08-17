import 'package:flutter/widgets.dart';

class HomeProvider extends ChangeNotifier{
  late PageController pageController;

  HomeProvider(){
    pageController = PageController(
      viewportFraction: 1.0,
      initialPage: 0,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
