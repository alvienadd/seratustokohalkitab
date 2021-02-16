import 'package:seratustokohalkitab/Screens/Splashscreen/splashscreen.dart';
import 'package:seratustokohalkitab/Screens/Dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:seratustokohalkitab/Screens/components/DetailPria.dart';
import 'package:seratustokohalkitab/Screens/components/Lagu.dart';
import 'package:seratustokohalkitab/Screens/components/Pria.dart';
import 'package:seratustokohalkitab/Screens/components/Wanita.dart';
import 'package:seratustokohalkitab/Screens/components/Baik.dart';
import 'package:seratustokohalkitab/Screens/components/Buruk.dart';
import 'package:seratustokohalkitab/Wallpaper.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Splashscreen());
      case '/dashboard':
        return MaterialPageRoute(builder: (_) => Dashboard());
      case '/pria':
        return MaterialPageRoute(builder: (_) => Pria());
      case '/wanita':
        return MaterialPageRoute(builder: (_) => Wanita());
      case '/baik':
        return MaterialPageRoute(builder: (_) => Baik());
      case '/buruk':
        return MaterialPageRoute(builder: (_) => Buruk());
      case '/wallpaper':
        return MaterialPageRoute(builder: (_) => Wallpaper());
      case '/lagu':
        return MaterialPageRoute(builder: (_) => Lagu());
        //Validation of Correct data type
        // if(args is String){
        //   return MaterialPageRoute(
        //     builder:(_)=>DetailPria(
        //        data:args,
        //     ),
        //   );
        // }

        //If args is not of the correct type, return an error page
        //You can also throw an exception while in development
        return _errorRoute();
      default:
        //If There is no such named route in the switch statement, e.g /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
          appBar: AppBar(
            title: Text('error'),
          ),
          body: Center(child: Text('error')));
    });
  }
}
