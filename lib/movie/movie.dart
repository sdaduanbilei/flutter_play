import 'package:flutter/material.dart';
import 'package:flutter_module/movie/data/movies.dart';
import 'package:flutter_module/movie/detail.dart';
import 'package:flutter_module/movie/loadlayout.dart';
import 'package:flutter_module/theme.dart';
import 'package:dio/dio.dart';

class MovieHome extends StatefulWidget {
  @override
  _MovieHomeState createState() => _MovieHomeState();
}

class _MovieHomeState extends State<MovieHome> {
  List<Subjects> showingmovies;
  List<Subjects> movies = List();

  @override
  void initState() {
    getMovies();
    super.initState();
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
        child: getDisplay(),
      ),
    );
  }

  Widget getDisplay(){
    if(movies.length > 1){
      return ListView.builder(
        itemCount: movies.length + 4,
          itemBuilder: (BuildContext context, int position) {
            switch (position) {
              case 0:
                return buildSearchView();
                break;
              case 1:
                return buildTitle('正在热映', '查看全部');
                break;
              case 2:
                return buildShowingMovies();
                break;
              case 3:
                return buildTitle('流行排行', '');
                break;
              default:
                if (movies != null && position < movies.length) {
                  var item = movies[position];
                  return buildMovePopular(context, item);
                }
                break;
            }
          });
    } else{
      return LoadingLayout();
    }
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
                        image: NetworkImage(subjects.images.large),
                        fit: BoxFit.cover)),
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
  Widget buildMovePopular(BuildContext context, Subjects subjects) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Hero(
        tag: subjects.images.large,
        child: Material(
          shadowColor: moviesAccentColor,
          color: moviesAccentColor,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailView(subjects)));
            },
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
                          Text(subjects.title,
                              style: TextStyle(color: Colors.white)),
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
                      Text(subjects.title,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 16)),

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
                            Text(subjects.rating.average.toString(),
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
                          image: NetworkImage(subjects.images.large),
                          fit: BoxFit.cover)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  getMovies() async {
    Dio dio = Dio();
    Response response = await dio.get('http://api.douban.com/v2/movie/top250');
    // var result = json.decode(response.data.toString());
    // Map userMap = json.decode(json);
// var user = User.fromJson(userMap);
    Movies res = Movies.fromJson(response.data);
    movies = res.subjects;

    Response response2 =
        await dio.get('https://api.douban.com/v2/movie/in_theaters');

    Movies res2 = Movies.fromJson(response2.data);
    showingmovies = res2.subjects;
    print(showingmovies.length.toString() + "====" + movies.length.toString());

    setState(() {
      movies = res.subjects;
      showingmovies = res2.subjects;
    });
  }
}
