
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneznik_app/screens/artefacts_detail.dart';
import 'package:sneznik_app/screens/category_screen.dart';
import 'package:sneznik_app/screens/favorites_screen.dart';
import 'package:sneznik_app/screens/subcategory_screen.dart';

import '../utils/app_styles.dart';
import 'home_screen.dart';
import 'info_screen.dart';
import 'settings_screen.dart';


class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  static final List<Widget>_widgetOptions =  <Widget>[

    HomeScreen(),
    //const CategoryScreen(),
    const ArtefactDetail(),
    //const SubcategoryScreen(),
    // const Text("Tickets"),
    // const Text("Profile"),

  ];

  void _onItemTapped(int index){

    setState(() {
      _selectedIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Styles.bgColor, //Styles.bgColor
      body: Center(child: _widgetOptions[_selectedIndex]),
      bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
          child: BottomNavigationBar(
              backgroundColor: const Color(0xFF000000),
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              elevation: 10,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: Styles.whiteIconColor,
              unselectedItemColor: const Color(0xFF526480),
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home_outlined),
                    activeIcon: Icon(Icons.home),
                    label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.favorite),
                    activeIcon: Icon(Icons.favorite_outlined),
                    label: "Favorite"),
                BottomNavigationBarItem(icon: Icon(Icons.settings_outlined),
                    activeIcon: Icon(Icons.settings),
                    label: "Settings"),
                BottomNavigationBarItem(icon: Icon(Icons.info_outlined),
                    activeIcon: Icon(Icons.info), label: "Info"),
                // BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_ticket_regular),
                //     activeIcon: Icon(FluentSystemIcons.ic_fluent_ticket_filled),label: "Ticket"),

              ],
            ),
        ),

    );


    // return Scaffold(
    //   backgroundColor: Colors.transparent, //Styles.bgColor
    //   body: Center(child: _widgetOptions[_selectedIndex]),
    //   bottomNavigationBar: Container(
    //     height: 55,
    //     decoration: BoxDecoration(
    //         borderRadius: BorderRadius.only(
    //             topRight: Radius.circular(30), topLeft: Radius.circular(30)),
    //         color: Colors.red
    //
    //
    //     ),
    //     child: ClipRRect(
    //       borderRadius: BorderRadius.only(
    //         topLeft: Radius.circular(30.0),
    //         topRight: Radius.circular(30.0),
    //       ),
    //       child: BottomNavigationBar(
    //         backgroundColor: Colors.white,//const Color(0xFF000000)
    //         type: BottomNavigationBarType.fixed,
    //         currentIndex: _selectedIndex,
    //         onTap: _onItemTapped,
    //         elevation: 10,
    //         showSelectedLabels: false,
    //         showUnselectedLabels: false,
    //         selectedItemColor: Styles.whiteIconColor,
    //         unselectedItemColor: const Color(0xFF526480),
    //         items: const [
    //           BottomNavigationBarItem(icon: Icon(Icons.home_outlined),
    //               activeIcon: Icon(Icons.home),
    //               label: "Home"),
    //           BottomNavigationBarItem(icon: Icon(Icons.favorite),
    //               activeIcon: Icon(Icons.favorite_outlined),
    //               label: "Favorite"),
    //           BottomNavigationBarItem(icon: Icon(Icons.settings_outlined),
    //               activeIcon: Icon(Icons.settings),
    //               label: "Settings"),
    //           BottomNavigationBarItem(icon: Icon(Icons.info_outlined),
    //               activeIcon: Icon(Icons.info), label: "Info"),
    //           // BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_ticket_regular),
    //           //     activeIcon: Icon(FluentSystemIcons.ic_fluent_ticket_filled),label: "Ticket"),
    //
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
