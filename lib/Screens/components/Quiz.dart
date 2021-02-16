import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seratustokohalkitab/Screens/components/Body.dart';
import 'package:seratustokohalkitab/Screens/components/score_screen.dart';
import 'package:seratustokohalkitab/controllers/question_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    QuestionController _controller=Get.put(QuestionController());

    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
          home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/icons/bgheader.PNG'))),
          ),
          title: Text('Quiz'),
          automaticallyImplyLeading: true,
          actions: <Widget>[
            FlatButton(
                onPressed:  (){  Navigator.push(
                     context,
                   MaterialPageRoute(builder:(context)=>ScoreScreen())
                   );},
                child: Text(
                  "Result",
                  style: TextStyle(color: Colors.white),
                ))
          ],
          elevation: 0,
        ),
        body:Body()
      ),
    );
  }
}


