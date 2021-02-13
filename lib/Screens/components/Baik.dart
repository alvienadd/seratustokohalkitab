import 'package:flutter/material.dart';
import 'package:seratustokohalkitab/Screens/components/DetailBaik.dart';

import 'package:seratustokohalkitab/others/DataTokoh.dart';
import 'package:seratustokohalkitab/others/Services.dart';

class Baik extends StatefulWidget {
  Baik() : super();

  @override
  _BaikState createState() => _BaikState();
}

class _BaikState extends State<Baik> {
  List<DataTokoh> _tokoh = List();
  List<DataTokoh> tempList = List();
  List<DataTokoh> searchList = List();

  bool _loading;

  @override
  void initState() {
    // DO: implement initState
    super.initState();
    _loading = true;
    Services.getDataTokoh().then((value) {
      setState(() {
        _tokoh = value;
        tempList = _tokoh.where((value) => value.personality == 'baik').toList();
        searchList = tempList;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        backgroundColor: const Color(0xFF212121),
        appBar: AppBar(
          flexibleSpace: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/icons/bgheader.PNG'))),
          ),
          title: Text('Tokoh Baik'),
          automaticallyImplyLeading: true,
          actions: <Widget>[
            ImageIcon(
              AssetImage('assets/icons/Alert.png'),
            ),
            Container(padding: const EdgeInsets.all(6.0)),
            ImageIcon(
              AssetImage('assets/icons/Options.png'),
            ),
            Container(padding: const EdgeInsets.all(3.0)),
          ],
          elevation: 0,
          // title:
          // Transform(
          //   // you can forcefully translate values left side using Transform
          //   transform:  Matrix4.translationValues(0.0, 0.0, 0.0),
          //   child: Image.asset('assets/icons/logo2.png',height:100,width:100)
          // ),
        ),
        body: Container(
            child: Column(children: <Widget>[
          _searchBar(),
          Expanded(
              child: GridView.builder(
                  itemCount: null == tempList ? 0 : tempList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          (orientation == Orientation.portrait) ? 2 : 3),
                  itemBuilder: (context, index) {
                    DataTokoh tokoh = tempList[index];
                    return GestureDetector(
                        child: Card(
                            margin: EdgeInsets.all(20.0),
                            child: GridTile(
                                // title:Text(tokoh.name),
                                // subtitle:Text(tokoh.category)
                                footer: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(
                                    tokoh.category,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                child: Column(children: <Widget>[
                                  Image(
                                      height: 100,
                                      image: AssetImage(
                                          'assets/icons/good.png')),
                                  Text(
                                    tokoh.name,
                                    textAlign: TextAlign.center,
                                  ),
                                ]))),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>DetailBaik(args: tempList[index]),
                            ),
                          );
                        });
                  }))
        ])));
  }

  Widget _searchBar() {
    return Container(
      padding: EdgeInsets.only(bottom: 16.0),
      child: Container(
        color:Colors.white,
        child: TextField(
          decoration: InputDecoration(
            hintText: "Cari Tokoh Alkitab .......",
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (string) {
            // _filterTokohList(text);
            setState(() {
              tempList = searchList
                  .where(
                      (t) => t.name.toLowerCase().contains(string.toLowerCase()))
                  .toList();
            });
            //  print('counter value : $tempList');
          },
        ),
      ),
    );
  }
}
