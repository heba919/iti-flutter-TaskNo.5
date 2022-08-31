import 'package:flutter/material.dart';

import 'APICalls.dart';

class Moviedetails extends StatelessWidget {
  Movie movv ;
  Moviedetails(this.movv);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(movv.title),
            leading:  IconButton( icon: Icon(Icons.arrow_back), onPressed: () {Navigator.pop(context); })
        ),

//Image.network(movie.poster_path)

        body:
        Padding(
            padding: EdgeInsets.all(16.0),
            child:Column(
                children:[
                  Image.network(movv.poster_path,width:500 ,height: 300),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child:
                    Text(movv.title),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Release Date:"),
                      SizedBox(
                        width: 20,
                      ),
                      Text(movv.release_date),
                    ],
                  )
                  ,
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Popularity:"),
                      SizedBox(
                        width: 20,
                      ),
                      Text("${movv.popularity}"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Text(movv.overview),



                ]
            )

        )




    );;
  }
}
