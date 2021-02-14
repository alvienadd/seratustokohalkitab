import 'package:flutter/material.dart';
import 'package:seratustokohalkitab/Screens/components/DetailPria.dart';
import 'package:seratustokohalkitab/others/DataTokoh.dart';
import 'package:seratustokohalkitab/others/Services.dart';

class Pria extends StatefulWidget {
  Pria() : super();

  @override
  _PriaState createState() => _PriaState();
}

class _PriaState extends State<Pria> {
  List<DataTokoh> _tokoh = List();
  List<DataTokoh> tempList = List();
  List<DataTokoh> searchList = List();

  bool _loading;
  int count;

  @override
  void initState() {
    // DO: implement initState
    super.initState();
    _loading = true;
     count=0;
    Services.getDataTokoh().then((value) {
      setState(() {
        _tokoh = value;
        tempList = _tokoh.where((value) => value.type == 'Pria').toList();
        searchList = tempList;
        _loading = false;
        count=tempList.length;
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
          title: Text('Tokoh Pria'),
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
          Padding(
            padding: const EdgeInsets.only(left:20.0),
            child: Row(children:<Widget>[
              Text('Total: ',style: TextStyle(color:Colors.white)),
              Text("${count}",style: TextStyle(color:Colors.white))
            ]),
          ),
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
                                          'assets/icons/pria.png')),
                                  Text(
                                    tokoh.name,
                                    textAlign: TextAlign.center,
                                  ),
                                ]))),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>DetailPria(args: tempList[index]),
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
        color: Colors.white,
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
