import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_app/List_screen.dart';
import 'package:movie_app/fliter_screen.dart';
import 'package:movie_app/home_screen.dart';

class BottomBarScreen extends StatefulWidget {
//  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int selected = 0;
  List<Widget> Screens = [HomeScreen(), ListScreen(), FilterScreen()];
  List<String> titles = ["See Movie", "Explore", "Search"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titles[selected])),
      body: Screens[selected],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            selected = value;
          });
        },
        unselectedItemColor: Colors.grey,
        selectedItemColor: Color.fromARGB(255, 196, 129, 124),
        currentIndex: selected,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "List",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Filter",
          ),
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Container(
            child: Text('Drawer'),
          ),
        ),
      ),
    );
  }
}
