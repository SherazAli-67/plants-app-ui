import 'package:flutter/widgets.dart';

class HomeProvider extends ChangeNotifier{
  late PageController pageController;
  double currentIndex =0;
  HomeProvider(){
    pageController = PageController(
      viewportFraction: 0.78, // <-- key: shows side cards peeking in
      initialPage: 0,
    );
    pageController.addListener(() =>  currentIndex = pageController.page ?? 0);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
}