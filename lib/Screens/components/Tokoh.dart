import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:seratustokohalkitab/models/carousel_model.dart';

class Tokoh extends StatefulWidget {
  @override
  _TokohState createState() => _TokohState();
}

class _TokohState extends State<Tokoh> {
  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  ThemeData _lightTheme = ThemeData(
      accentColor: Colors.pink,
      brightness: Brightness.light,
      primaryColor: Colors.blue);

  ThemeData _darkTheme = ThemeData(
      accentColor: Colors.red,
      brightness: Brightness.dark,
      primaryColor: Colors.amber);

  bool _light = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: _light ? _lightTheme : _darkTheme,
          home: Scaffold(
          // backgroundColor: Color(int.parse('#F2F2F2'.replaceAll('#', '0xff'))),
          body: Container(
              child: ListView(
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              //Say Hello to User
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 1.0),
                child:Row(
                children:<Widget>[
                  Container(
                    height: 34,
                    child: Switch(
                                    value: _light,
                                    onChanged: (state) {
                                      setState(() {
                                        _light = state;
                                      });
                                    }),
                  ),
                  _light? Text(
                  'Plz Connect to Internet♡ ♥💕❤',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Color(int.parse('#BB163A'.replaceAll('#', '0xff'))),
                      fontWeight: FontWeight.bold),
                ):
                  Text(
                  'Plz Connect to Internet♡ ♥💕❤',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Color(int.parse('#FFFFFF'.replaceAll('#', '0xff'))),
                      fontWeight: FontWeight.bold),
                )],
              )),
                 
              // Padding(
              //   padding:
              //       const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
              //   child: Text(
              //     'Plz connect to Internet',
              //     style: TextStyle(
              //         fontStyle: FontStyle.italic,
              //         color: Color(int.parse('#BB163A'.replaceAll('#', '0xff'))),
              //         fontWeight: FontWeight.bold),
              //   ),
              // ),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top:12,left: 16, right: 16),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                            child: Swiper(
                              onIndexChanged: (index) {
                                setState(() {
                                  _current = index;
                                });
                              },
                              autoplay: true,
                              layout: SwiperLayout.DEFAULT,
                              itemCount: carousels.length,
                              itemBuilder: (BuildContext context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                        image: AssetImage(carousels[index].image),
                                        fit: BoxFit.cover),
                                  ),
                                );
                              },
                            )),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                  children:
                                      map<Widget>(carousels, (index, image) {
                                return Container(
                                  alignment: Alignment.centerLeft,
                                  height: 6,
                                  width: 6,
                                  margin: EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: _current == index
                                          ? Colors.blue
                                          : Colors.grey),
                                );
                              })),
                              //More
                              GestureDetector(
                                  child:_light?Text(
                                    'More',
                                    style: TextStyle(
                                        color: Color(int.parse('#BB163A'
                                                .replaceAll('#', '0xff')))
                                            .withOpacity(0.8)),
                                  ):Text(
                                    'More',
                                    style: TextStyle(
                                        color: Color(int.parse('#FFFFFF'
                                                .replaceAll('#', '0xff')))
                                            .withOpacity(0.8)),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).pushNamed('/wallpaper',
                                        arguments: 'Page Wallpaper');
                                  })
                           
                            ])
                      ])),
              //Klasifikasi Tokoh
              Padding(
                padding: const EdgeInsets.only(
                    top: 14.0, left: 20.0, right: 20.0, bottom: 10.0),
                child:_light?Text(
                  'Tokoh Alkitab Berdasarkan',
                  style: TextStyle(
                      color: Color(int.parse('#000000'.replaceAll('#', '0xff'))),
                      fontWeight: FontWeight.bold),
                ):Text(
                  'Tokoh Alkitab Berdasarkan',
                  style: TextStyle(
                      color: Color(int.parse('#FFFFFF'.replaceAll('#', '0xff'))),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  height: 200,
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: Column(children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Row(children: <Widget>[
                          Expanded(
                            child: GestureDetector(
                                child: Container(
                                    margin: EdgeInsets.only(right: 8),
                                    padding: EdgeInsets.only(left: 16),
                                    height: 64,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: Colors.black, width: 0.2)),
                                    child: Row(children: <Widget>[
                                      Image(
                                          image: AssetImage(
                                              'assets/icons/pria.png')),
                                      Padding(
                                          padding: EdgeInsets.only(left: 16),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text('Pria',style: TextStyle(color: Colors.black),),
                                              ]))
                                    ])),
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed('/pria', arguments: 'Page Pria');
                                }),
                          ),
                          Expanded(
                            child: GestureDetector(
                                child: Container(
                                    margin: EdgeInsets.only(right: 8),
                                    padding: EdgeInsets.only(left: 16),
                                    height: 64,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: Colors.black, width: 0.2)),
                                    child: Row(children: <Widget>[
                                      Image(
                                          image: AssetImage(
                                              'assets/icons/female.png')),
                                      Padding(
                                          padding: EdgeInsets.only(left: 16),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text('Wanita',style: TextStyle(color: Colors.black),),
                                              ]))
                                    ])),
                                onTap: () {
                                  Navigator.of(context).pushNamed('/wanita',
                                      arguments: 'Page Wanita');
                                }),
                          ),
                        ])),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Row(children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                              child: Container(
                                  margin: EdgeInsets.only(right: 8),
                                  padding: EdgeInsets.only(left: 16),
                                  height: 64,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: Colors.black, width: 0.2)),
                                  child: Row(children: <Widget>[
                                    Image(
                                        image:
                                            AssetImage('assets/icons/good.png')),
                                    Padding(
                                        padding: EdgeInsets.only(left: 16),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text('Baik',style: TextStyle(color: Colors.black),),
                                            ]))
                                  ])),
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed('/baik', arguments: 'Page Baik');
                              }),
                        ),
                        Expanded(
                          child: GestureDetector(
                              child: Container(
                                  margin: EdgeInsets.only(right: 8),
                                  padding: EdgeInsets.only(left: 16),
                                  height: 64,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: Colors.black, width: 0.2)),
                                  child: Row(children: <Widget>[
                                    Image(
                                        image:
                                            AssetImage('assets/icons/bad.png')),
                                    Padding(
                                        padding: EdgeInsets.only(left: 16),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text('Buruk',style: TextStyle(color: Colors.black),),
                                            ]))
                                  ])),
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed('/buruk', arguments: 'Page Buruk');
                              }),
                        ),
                      ]),
                    ),
                  ])),
            ],
          ))),
    );
  }
}
