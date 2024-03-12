import 'package:flutter/material.dart';
import 'package:food_delivery/pages/account/account_page.dart';
import 'package:food_delivery/pages/cart/cart_history.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:food_delivery/utils/colors.dart';
//import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;
  //late PersistentTabController _controller;



  List pages = const[
    MainFoodPage(),
    AccountPage(),
    CartHistory(),
    AccountPage(),
  ];

  void onTabNav(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _controller = PersistentTabController(initialIndex: 0);
  // }

  // List<Widget> _buildScreens() {
  //       return [
  //         MainFoodPage(),
  //         Container(child: Center(child: Text("Page 1"),),),
  //         Container(child: Center(child: Text("Page 2"),),),
  //         Container(child: Center(child: Text("Page 3"),),),
  //       ];
  //   }

    // List<PersistentBottomNavBarItem> _navBarsItems() {
    //     return [
    //         PersistentBottomNavBarItem(
    //             icon: Icon(CupertinoIcons.home),
    //             title: ("Home"),
    //             activeColorPrimary: CupertinoColors.activeBlue,
    //             inactiveColorPrimary: CupertinoColors.systemGrey,
    //         ),
    //         PersistentBottomNavBarItem(
    //             icon: Icon(CupertinoIcons.archivebox),
    //             title: ("Archieve"),
    //             activeColorPrimary: CupertinoColors.activeBlue,
    //             inactiveColorPrimary: CupertinoColors.systemGrey,
    //         ),
    //         PersistentBottomNavBarItem(
    //             icon: Icon(CupertinoIcons.shopping_cart),
    //             title: ("Shopping"),
    //             activeColorPrimary: CupertinoColors.activeBlue,
    //             inactiveColorPrimary: CupertinoColors.systemGrey,
    //         ),
    //         PersistentBottomNavBarItem(
    //             icon: Icon(CupertinoIcons.person),
    //             title: ("Me"),
    //             activeColorPrimary: CupertinoColors.activeBlue,
    //             inactiveColorPrimary: CupertinoColors.systemGrey,
    //         ),
    //     ];
    // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.amberAccent,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: onTabNav,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home"
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.archive_rounded),
            label: "history"
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_rounded),
            label: "Cart"
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: "me"
          ),
        ]
      ),
    );
  }


  //   @override
  // Widget build(BuildContext context) {
  //   return PersistentTabView(
  //       context,
  //       controller: _controller,
  //       screens: _buildScreens(),
  //       items: _navBarsItems(),
  //       confineInSafeArea: true,
  //       backgroundColor: Colors.white, // Default is Colors.white.
  //       handleAndroidBackButtonPress: true, // Default is true.
  //       resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
  //       stateManagement: true, // Default is true.
  //       hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
  //       decoration: NavBarDecoration(
  //         borderRadius: BorderRadius.circular(10.0),
  //         colorBehindNavBar: Colors.white,
  //       ),
  //       popAllScreensOnTapOfSelectedTab: true,
  //       popActionScreens: PopActionScreensType.all,
  //       itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
  //         duration: Duration(milliseconds: 200),
  //         curve: Curves.ease,
  //       ),
  //       screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
  //         animateTabTransition: true,
  //         curve: Curves.ease,
  //         duration: Duration(milliseconds: 200),
  //       ),
  //       navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property.
  //   );
  // }

  

}