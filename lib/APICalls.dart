import 'package:http/http.dart';
import 'dart:convert';

class APICalls {

  Future<Movie> GetMovie(int id) async {
    Movie list = Movie(id: 0, title: "", overview: "", path: "");
    try {
      print("Calling ");
      //https://api.mohamed-sadek.com/Student/Get
      //https://api.themoviedb.org/3/movie/550?api_key=eb03df251074313f6e24c705f23a1cdc
      Uri path = Uri.https("api.themoviedb.org", "3/movie/${id}",
          {"api_key": "eb03df251074313f6e24c705f23a1cdc"});
      Response response = await get(path);
      print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        list = data;
        print(data);
      } else {
        print("error");
      }
    } catch (ex) {
      print(ex.toString());
    }
    return list;
  }

  Future<List<Movie>> getPopularMovies() async {
    //eb03df251074313f6e24c705f23a1cdc
    //https://api.themoviedb.org/3/movie/popular?api_key=<<api_key>>&language=en-US&page=1
    List<Movie> retutnedList = [];
    Uri url = Uri.https("api.themoviedb.org", "/3/movie/popular", {
      "api_key": "eb03df251074313f6e24c705f23a1cdc",
    });
    Response data = await get(url);
    if (data.statusCode == 200) {
      var converted = jsonDecode(data.body);
      var temp = converted["results"] as List;
      retutnedList = temp
          .map((elem) => Movie(
              id: elem['id'],
              title: elem['title'],
              overview: elem['overview'],
              popularity: elem['popularity'],
              release_date: elem['release_date'],
              path: elem['poster_path']))
          .toList();
    } else {
      print("Error");
    }
    return retutnedList;
  }


  Future<List<Movie>> SearchforMovies(String value) async {
    //https://api.themoviedb.org/3/search/movie?api_key={api_key}&query={MovieName}
    List<Movie> retutnedList = [];
    Uri url = Uri.https("api.themoviedb.org", "/3/search/movie",
        {"api_key": "eb03df251074313f6e24c705f23a1cdc", "query": value});
    Response data = await get(url);
    if (data.statusCode == 200) {
      var converted = jsonDecode(data.body);
      var temp = converted["results"] as List;
      retutnedList = temp
          .map((elem) => Movie(
              id: elem['id'],
              title: elem['title'],
              overview: elem['overview'],
              path: elem['poster_path']))
          .toList();
    } else {
      print("Error");
    }
    return retutnedList;
  }
}










class Movie {
  int id;
  String path;
  String release_date;
  double popularity;
  String title;
  String overview;
  String poster_path = "https://image.tmdb.org/t/p/w500/";
  Movie(
      { this.id,
         this.title,
         this.overview,
        this.path,
        this.popularity,
        this.release_date
         }) {
    this.poster_path = "${this.poster_path}${path}";
  }
}

