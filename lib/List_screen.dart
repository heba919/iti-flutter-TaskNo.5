import 'dart:convert';
import "package:flutter/material.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";
import 'package:http/http.dart' as http;
import 'package:movie_app/APICalls.dart';
import 'package:movie_app/movie_card.dart';

class ListScreen extends StatefulWidget {
  //const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Movie> list = [];
  @override
  void initState() {
    callAPI();
    super.initState();
  }

  callAPI() async {
    var api = APICalls();
    List<Movie> returnedlist = await api.getPopularMovies();

    setState(() {
      list = returnedlist;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty) {
      return Center(
        child: SpinKitDoubleBounce(
          color: Colors.red,
        ),
      );
    } else {
      return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => MovieCard(
          movie: list[index],
        ),
      );
    }
  }
}
