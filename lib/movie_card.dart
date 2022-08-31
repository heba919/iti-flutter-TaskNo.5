import "package:flutter/material.dart";
import 'package:movie_app/APICalls.dart';

import 'moviedetails.dart';

class MovieCard extends StatelessWidget {
  Movie movie;
  MovieCard({ this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(

        //         builder: ((context) => CategoryMealsScreen(category: item))));
        onTap: (){
      Navigator.push(context,
          MaterialPageRoute(
              builder: ((context) => Moviedetails(movie))));
    },
    child: Card(
      child: Column(children: [
        Image.network(movie.poster_path),
        ListTile(
          leading: Text(movie.title),
          trailing: Column(
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Text(movie.id.toString())
            ],
          ),
        )
      ]),
    ));
  }
}
