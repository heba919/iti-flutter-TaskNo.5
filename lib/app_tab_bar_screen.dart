import 'package:flutter/material.dart';
import 'package:movie_app/List_screen.dart';
import 'package:movie_app/fliter_screen.dart';
import 'package:movie_app/home_screen.dart';


class TabBarScreen extends StatefulWidget {
  //const TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("my Movie App"),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: "Home",
              ),
              Tab(
                icon: Icon(Icons.list),
                text: "List",
              ),
              Tab(
                icon: Icon(Icons.search),
                text: "Filter",
              ),
            ],
          ),
        ),
        body:
            TabBarView(children: [HomeScreen(), ListScreen(), FilterScreen()]),
      ),
    );
  }
}
