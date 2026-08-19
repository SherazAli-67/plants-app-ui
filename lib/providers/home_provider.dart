import 'package:flutter/widgets.dart';

class HomeProvider extends ChangeNotifier{
  late PageController pageController;
  int selectedTabIndex = 0;

  HomeProvider(){
    pageController = PageController(
      viewportFraction: 1.0,
      initialPage: 1,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onTabTap(int index){
    selectedTabIndex = index;
    notifyListeners();
  }
}
