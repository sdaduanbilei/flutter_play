import 'package:flutter/material.dart';
import 'package:flutter_module/theme.dart';

class MovieHome extends StatefulWidget {
  @override
  _MovieHomeState createState() => _MovieHomeState();
}

class _MovieHomeState extends State<MovieHome> {
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
        child: ListView(
          children: <Widget>[
            // search
            Container(
              margin: EdgeInsets.all(16),
              alignment: Alignment.center,
              height: 40.0,
              decoration: BoxDecoration(
                  color: moviesLightDarkColor,
                  borderRadius: BorderRadius.circular(16)),
              child: TextFormField(
                decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.3)),
                    prefixIcon: Icon(Icons.search,
                        color: Colors.grey.withOpacity(0.3))),
              ),
            ),

            // titler
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Now Showing',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  Text('see all',
                      style: TextStyle(color: Colors.grey.withOpacity(0.3)))
                ],
              ),
            ),

            // listView
            Container(
              height: 245,
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  buildMovieShowing(context, '这个杀手不太冷',
                      'http://img1.doubanio.com/view/photo/s_ratio_poster/public/p511118051.webp'),
                  buildMovieShowing(context, '肖申克的救赎',
                      'http://img1.doubanio.com/view/photo/s_ratio_poster/public/p480747492.webp'),
                  buildMovieShowing(context, '霸王别姬',
                      'http://img1.doubanio.com/view/photo/s_ratio_poster/public/p1910813120.webp'),
                  buildMovieShowing(context, '阿甘正传',
                      'http://img3.doubanio.com/view/photo/s_ratio_poster/public/p510876377.webp')
                ],
              ),
            ),

            // Popular
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'Popular',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),

            buildMovePopular(context, '泰坦尼克号', '9.0',
                'http://img1.doubanio.com/view/photo/s_ratio_poster/public/p457760035.webp'),
            buildMovePopular(context, '千与千寻', '8.8',
                'http://img1.doubanio.com/view/photo/s_ratio_poster/public/p1606727862.webp'),
            buildMovePopular(context, '盗梦空间', '8.5',
                'http://img1.doubanio.com/view/photo/s_ratio_poster/public/p513344864.webp'),
            buildMovePopular(context, '机器人总动员', '8.0',
                'http://img1.doubanio.com/view/photo/s_ratio_poster/public/p1461851991.webp'),
          ],
        ),
      ),
    );
  }

// 正在热映
  Widget buildMovieShowing(BuildContext context, String name, String img) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 8.0, right: 8.0),
          height: 180,
          width: MediaQuery.of(context).size.width / 3,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              image:
                  DecorationImage(image: NetworkImage(img), fit: BoxFit.cover)),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          name,
          style: TextStyle(color: Colors.white),
        )
      ],
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
          Card(
            elevation: 5.0,
            color: Colors.transparent,
            child: Container(
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
}
