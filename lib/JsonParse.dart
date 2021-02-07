import 'package:flutter/material.dart';
import 'package:seratustokohalkitab/others/DataTokoh.dart';
import 'package:seratustokohalkitab/others/Services.dart';

class JsonParse extends StatefulWidget {
  JsonParse() : super();

  @override
  _JsonParseState createState()=>_JsonParseState();
}

class _JsonParseState extends State<JsonParse> {

  List<DataTokoh> _tokoh;
  bool _loading;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loading=true;
    Services.getDataTokoh().then((value){
      setState(() {
        _tokoh=value;
        _loading=false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        body:
            Container(
              color:Colors.white,
              child:GridView.builder(
                itemCount:null==_tokoh?0:_tokoh.length,
                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
                itemBuilder: (context,index){
                  DataTokoh tokoh=_tokoh[index];
                  return Card(
                      margin: EdgeInsets.all(20.0),
                    child: GridTile(
                      // title:Text(tokoh.name),
                      // subtitle:Text(tokoh.category)
                      footer:Padding(
                        padding: const EdgeInsets.all(2.0),
                        child:Text(tokoh.category,textAlign: TextAlign.center,),
                      ),
                       child:Column(
                          children:<Widget>[
                            Image(image: AssetImage('assets/icons/profpic.png')),
                            Text(tokoh.name,textAlign: TextAlign.center,),
                          ]
                        
                      )
                    )
                  );
              })
        )
    );
  }
}
