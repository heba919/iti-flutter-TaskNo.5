import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_app/APICalls.dart';
import 'package:movie_app/movie_card.dart';

class FilterScreen extends StatefulWidget {
 // const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String inputData = "";
  List<Movie> list = [];
  APICalls api = APICalls();
  callApi() async {
    var retlist = await api.SearchforMovies(inputData);
    setState(() {
      list = retlist;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
          child: TextField(
            decoration: InputDecoration(
                icon: Icon(Icons.search),
                border: OutlineInputBorder(
                    // borderSide: BorderSide(col ),
                    borderRadius: BorderRadius.circular(15))),
            onChanged: (value) {
              setState(() {
                inputData = value;
              });
              callApi();
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) => MovieCard(
              movie: list[index],
            ),
          ),
        )
      ],
    );
  }
}
