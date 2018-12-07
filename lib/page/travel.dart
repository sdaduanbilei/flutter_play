import 'package:flutter/material.dart';

class TravelView extends StatefulWidget {
  @override
  _TravelViewState createState() => _TravelViewState();
}

class _TravelViewState extends State<TravelView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Material(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: ListView(
              children: <Widget>[
                // title
                buildTitle(),
                // navigation
                buildNavigation(),
                // item
                buildItem(),
                // itemDetai
                buildItemDetail(),
                buildItem(),
                buildItemDetail(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Travel Daily',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.grey,
              ),
              onPressed: () {},
            ),
            InkWell(
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://b-ssl.duitang.com/uploads/item/201203/02/20120302214755_Hiz58.thumb.700_0.jpeg'))),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget buildNavigation() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: 80,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey[400]),
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                  iconSize: 40,
                  color: Colors.blueAccent,
                  onPressed: () {},
                  icon: Icon(Icons.navigation),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'New Dec',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '2018-12-01',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 100,
            ),
            IconButton(
              icon: Icon(
                Icons.navigate_next,
                color: Colors.grey,
              ),
              iconSize: 50,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }

  Widget buildItem() {
    return Padding(
        padding: EdgeInsets.only(top: 16),
        child: Container(
            height: 225,
            child: Row(
              children: <Widget>[
                Container(
                  height: 225,
                  width: MediaQuery.of(context).size.width / 2 + 38,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://b-ssl.duitang.com/uploads/item/201203/02/20120302214755_Hiz58.thumb.700_0.jpeg'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 2,
                ),
                Column(
                  children: <Widget>[
                    Container(
                      height: 225 / 2,
                      width: MediaQuery.of(context).size.width / 2 - 72,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                          ),
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://b-ssl.duitang.com/uploads/item/201203/02/20120302214755_Hiz58.thumb.700_0.jpeg'),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Container(
                      height: 225 / 2 - 2,
                      width: MediaQuery.of(context).size.width / 2 - 72,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                          ),
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://b-ssl.duitang.com/uploads/item/201203/02/20120302214755_Hiz58.thumb.700_0.jpeg'),
                              fit: BoxFit.cover)),
                    ),
                  ],
                )
              ],
            )));
  }

  Widget buildItemDetail() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Maui Summer 2018',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10,),
              Text(
                '52 Photos',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              )
            ],
          ),

          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.navigation),
                color: Colors.grey[400],
                onPressed: (){},
              ),
              IconButton(
                icon: Icon(Icons.chat),
                color: Colors.grey[400],
                onPressed: (){},
              ),
              IconButton(
                icon: Icon(Icons.favorite),
                color: Colors.grey[400],
                onPressed: (){},
              )
            ],
          )
        ],
      ),
    );
  }
}
