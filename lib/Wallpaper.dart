
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:seratustokohalkitab/others/DataTokoh.dart';
import 'package:seratustokohalkitab/others/Services.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';
 
class Wallpaper extends StatefulWidget {
  Wallpaper() : super();

  @override
  _WallpaperState createState() => _WallpaperState();
}

class _WallpaperState extends State<Wallpaper> {
  String _wallpaperAsset = 'Unknown';
  List<String> image = [
    'assets/icons/bible2.png',
    'assets/icons/holy.jpg',
    'assets/icons/bible1.png',
    'assets/icons/bible3.png',
    'assets/icons/bible4.jpg',
    'assets/icons/bible5.jpg',
    'assets/icons/bible6.jpg',
    'assets/icons/bible7.jpg',
  ];

  @override
  void initState(){
    super.initState();
    _requestPermission();
  }

  _requestPermission() async{
    Map<Permission,PermissionStatus> statuses=await[Permission.storage,].request();
  }

  show(space,String path) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            actions: [
              SizedBox(width: space / 2),
              FlatButton(
                  onPressed:()=>{Navigator.pop(context),
                  setWallpaperFromAsset(path)}, child: Center(child: Text("Set Wallpaper",style: TextStyle(color: Colors.blue),))),
            ],
          );
        });
  }

 // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> setWallpaperFromAsset(path) async {
    setState(() {
      _wallpaperAsset = "Loading";
    });
    String result;
    String assetPath = path;

    try {
      result = await WallpaperManager.setWallpaperFromAsset(
          assetPath, WallpaperManager.HOME_SCREEN);
    } on PlatformException {
      result = 'Failed to get wallpaper.';
    }

   

    setState(() {
      _wallpaperAsset = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    final space = MediaQuery.of(context).size.width;

    return Scaffold(
           backgroundColor: const Color(0xFF212121),
        body: Padding(
      padding: const EdgeInsets.all(2.0),
      child: GridView.builder(
          itemCount: image.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1.3),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  elevation: 10,
                  child: InkWell(
                      onTap: () {
                        show(space,image[index]);
                      },
                      child: Image.asset(image[index]))),
            );
          }),
    ));
  }
}
