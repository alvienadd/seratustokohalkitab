import 'package:flutter/material.dart';
import 'package:seratustokohalkitab/others/DataTokoh.dart';

class DetailWanita extends StatefulWidget {
  final DataTokoh args;

  const DetailWanita({
    Key key,
    this.args,
  }) : super(key: key);

  @override
  _DetailWanitaState createState() => _DetailWanitaState();
}

class _DetailWanitaState extends State<DetailWanita> {
  @override
  Widget build(BuildContext context) {

    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          child: Stack(
            children: <Widget>[
              Container(
                height: height * 0.55,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/icons/woman.jpg'),
                        fit: BoxFit.cover)),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.black.withOpacity(0.9),
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.9),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                ),
              ),
              Container(
                width: width,
                margin: EdgeInsets.only(top: height * 0.5),
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.args.name,
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 50,
                      width: width,
                      child: ListView.builder(
                        itemCount:5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, int key) {
                          return Icon(
                            Icons.star,
                            color: Colors.yellow[900],
                            size: 34,
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Description",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.args.description,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 0.5,
                          wordSpacing: 1.5),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  
                  ],
                ),
              ),
              Positioned(
                left: 30,
                top: height * 0.05,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.keyboard_backspace,
                    size: 42,
                    color: Colors.white,
                  ),
                ),
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}
