import 'package:flutter/material.dart';
import 'package:flutter_module/movie/data/movies.dart';
import 'package:flutter_module/movie/detail.dart';
import 'package:flutter_module/theme.dart';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

class MovieHome extends StatefulWidget {
  @override
  _MovieHomeState createState() => _MovieHomeState();
}

class _MovieHomeState extends State<MovieHome> {
  List<Subjects> showingmovies;
  List<Subjects> movies;

  @override
  void initState() {
    getMovies();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: moviesAccentColor,
      appBar: AppBar(
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            'Movies',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 42, fontWeight: FontWeight.bold, color: Colors.white),
          )),
      body: Container(
        color: moviesAccentColor,
        alignment: Alignment.centerLeft,
        width: double.infinity,
        child: ListView.builder(
          itemCount: movies == null ? 0 : movies.length + 4,
          itemBuilder: (BuildContext context, int position) {
             switch (position) {
              case 0:
                return buildSearchView();
                break;
              case 1:
                return buildTitle('Now Showing', 'see all');
                break;
              case 2:
                return buildShowingMovies();
                break;
              default:
                
                if (movies!= null && position < movies.length ) {
                  var item = movies[position];
                  return  buildMovePopular(context, item.title, item.rating.average.toString(), item.images.large);
                }
                break ;
            }
          },
        ),
      ),
    );
  }

  Widget buildShowingMovies() {
    return Container(
        height: 180,
        padding: EdgeInsets.only(left: 16.0, right: 16.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: showingmovies == null ? 0 : showingmovies.length,
          itemBuilder: (BuildContext context, int position) {
            return buildMovieShowing(context, showingmovies[position]);
          },
        ));
  }

  Widget buildTitle(String title, String sub) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          Text(sub, style: TextStyle(color: Colors.grey.withOpacity(0.3)))
        ],
      ),
    );
  }

  Widget buildSearchView() {
    return Container(
      margin: EdgeInsets.all(16),
      alignment: Alignment.center,
      height: 40.0,
      decoration: BoxDecoration(
          color: moviesLightDarkColor, borderRadius: BorderRadius.circular(24)),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.grey.withOpacity(0.3)),
            prefixIcon:
                Icon(Icons.search, color: Colors.grey.withOpacity(0.3))),
      ),
    );
  }

// 正在热映
  Widget buildMovieShowing(BuildContext context, Subjects subjects) {
    return Hero(
      tag: subjects.images.large,
      child: Material(
        color: moviesAccentColor,
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailView(subjects)));
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 138,
                margin: EdgeInsets.only(left: 8.0, right: 8.0),
                width: MediaQuery.of(context).size.width / 4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    image: DecorationImage(
                        image: NetworkImage(subjects.images.large), fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                subjects.title,
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }

  // 流行
  Widget buildMovePopular(
      BuildContext context, String name, String point, String img) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: <Widget>[
          // content
          Container(
            height: 130,
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.only(left: 140),
            decoration: BoxDecoration(
              color: moviesLightDarkColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(name, style: TextStyle(color: Colors.white)),
                    IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 20,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),

                // subTitle
                Text(name,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.5), fontSize: 16)),

                //分割线
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.star, color: const Color(0xFF039966)),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.star, color: const Color(0xFF039966)),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.star, color: const Color(0xFF039966)),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.star, color: const Color(0xFF039966)),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.star,
                          color: moviesAccentColor.withOpacity(0.5)),
                      SizedBox(
                        width: 20,
                      ),
                      Text(point,
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 18,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                )
              ],
            ),
          ),

          // img
          Container(
            width: 100,
            height: 140,
            margin: EdgeInsets.only(left: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: DecorationImage(
                    image: NetworkImage(img), fit: BoxFit.cover)),
          )
        ],
      ),
    );
  }

  getMovies() async {
    Dio dio = Dio();
    Response response = await dio.get('http://api.douban.com/v2/movie/top250');
    // var result = json.decode(response.data.toString());
    print(response.data["start"]);
    // Map userMap = json.decode(json);
// var user = User.fromJson(userMap);
    Movies res = Movies.fromJson(response.data);
    movies = res.subjects;

    Response response2 =
        await dio.get('https://api.douban.com/v2/movie/in_theaters');

    Movies res2 = Movies.fromJson(response2.data);
    showingmovies = res2.subjects;
    print(showingmovies.length);
  }
}
