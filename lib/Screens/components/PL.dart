import 'package:flutter/material.dart';
import 'package:seratustokohalkitab/Screens/components/DetailPL.dart';
import 'package:seratustokohalkitab/others/DataTokoh.dart';
import 'package:seratustokohalkitab/others/Services.dart';

class PL extends StatefulWidget {
  PL() : super();

  @override
  _PLState createState() => _PLState();
}

class _PLState extends State<PL> {
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
        tempList = _tokoh.where((value) => value.category == 'PL').toList();
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
                                          'assets/icons/bible1.jpg')),
                                  Text(
                                    tokoh.name,
                                    textAlign: TextAlign.center,
                                  ),
                                ]))),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>DetailPL(args: tempList[index]),
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
