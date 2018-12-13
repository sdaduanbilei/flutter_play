import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_module/movie/data/movies.dart';
import 'package:flutter_module/theme.dart';

class DetailView extends StatefulWidget {
  final Subjects subjects;
  DetailView(this.subjects);

  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
        primary: false,
        appBar: EmptyAppBar(),
        backgroundColor: moviesAccentColor,
        body: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                buildInfoView(),
                // like btn
                buildBtnView(),

                // content
                buildContentView(),

                // cast view
                buildCastView(widget.subjects.casts)
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 24),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
              ),
            )
          ],
        ),
        bottomNavigationBar: buildBottomView());
  }

  // 封面信息
  Widget buildInfoView() {
    return Container(
        height: 400,
        child: Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Stack(
              children: <Widget>[
                // 返回箭头

                // 背景图
                Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 300,
                      child: Image.network(
                        widget.subjects.images.large,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),

                // 电影详情
                Positioned(
                  top: 200,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 110,
                        padding: EdgeInsets.only(top: 60),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                              Colors.transparent,
                              moviesAccentColor.withAlpha(5),
                              moviesAccentColor.withAlpha(10),
                              moviesAccentColor.withAlpha(20),
                              moviesAccentColor.withAlpha(40),
                              moviesAccentColor.withAlpha(50),
                              moviesAccentColor.withAlpha(60),
                              moviesAccentColor.withAlpha(80),
                              moviesAccentColor.withAlpha(100),
                              moviesAccentColor.withAlpha(120),
                              moviesAccentColor.withAlpha(120),
                              moviesAccentColor.withAlpha(140),
                              moviesAccentColor.withAlpha(160),
                              moviesAccentColor.withAlpha(180),
                              moviesAccentColor.withAlpha(220),
                              moviesAccentColor.withAlpha(230),
                              moviesAccentColor.withAlpha(240),
                              moviesAccentColor.withAlpha(250),
                              moviesAccentColor
                            ])),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 150.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(widget.subjects.title,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                  'Director:' +
                                      widget.subjects.directors[0].name,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Container(
                          height: 50,
                          margin: EdgeInsets.only(top: 100),
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 150.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 20),
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.star,
                                        color: const Color(0xFF039966)),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(Icons.star,
                                        color: const Color(0xFF039966)),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(Icons.star,
                                        color: const Color(0xFF039966)),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(Icons.star,
                                        color: const Color(0xFF039966)),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(Icons.star,
                                        color: moviesBtnColor
                                            .withOpacity(0.2)
                                            .withOpacity(0.5)),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(widget.subjects.rating.average.toString(),
                                        style: TextStyle(
                                            color: Colors.orange,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold))
                                  ],
                                )
                              ],
                            ),
                          )),
                      Hero(
                        tag: widget.subjects.images.large,
                        child: Container(
                          width: MediaQuery.of(context).size.width / 4,
                          height: 150,
                          margin: EdgeInsets.only(left: 24, top: 20),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      widget.subjects.images.large),
                                  fit: BoxFit.cover)),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )));
  }

  // like btn
  Widget buildBtnView() {
    return Container(
      padding: EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 2 - 30,
            child: Material(
              color: Colors.transparent,
              child: Ink(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: const Color(0xFF222524),
                    shape: BoxShape.rectangle),
                child: InkWell(
                  borderRadius: BorderRadius.circular(1000),
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Want to see',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2 - 30,
            child: Material(
              color: Colors.transparent,
              child: Ink(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: const Color(0xFF222524),
                    shape: BoxShape.rectangle),
                child: InkWell(
                  borderRadius: BorderRadius.circular(1000),
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.star_border,
                          color: Colors.grey,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Seed',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // content View
  Widget buildContentView() {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Story Line',
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'The father of laura(Aicia Vikander) devoted his life to the study of the tomb, When laura was stiall young, his father disappeared during an adventure .Over the yearsm,Laura has',
            style: TextStyle(color: Colors.grey.withOpacity(0.5)),
          ),
        ],
      ),
    );
  }

  //castView
  Widget buildCastView(List<Casts> casts) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'The Cast',
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: EdgeInsets.only(top: 16.0),
            height: 180,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: casts.length,
                itemBuilder: (BuildContext context, int position) {
                  return buildItem(casts[position]);
                }),
          )
        ],
      ),
    );
  }

  Widget buildItem(Casts casts) {
    return Container(
      margin: EdgeInsets.only(right: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 4,
            height: 140,
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(4),
                image: DecorationImage(
                    image: NetworkImage(
                        casts.avatars.large),
                    fit: BoxFit.cover)),
          ),
          SizedBox(height: 16.0),
          Text(
            casts.name,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          )
        ],
      ),
    );
  }

  // 底部导航
  Widget buildBottomView() {
    return BottomAppBar(
        color: const Color(0xFF222524),
        child: Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width - 50,
              margin: EdgeInsets.all(24),
              color: const Color(0xFF222524),
              child: Material(
                color: Colors.transparent,
                child: Ink(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: moviesBtnColor,
                      shape: BoxShape.rectangle),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(1000),
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Book',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  Size get preferredSize => Size(0.0, 0.0);
}
