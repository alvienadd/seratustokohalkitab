import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seratustokohalkitab/Screens/Dashboard/dashboard.dart';
import 'package:seratustokohalkitab/Screens/components/Tokoh.dart';
import 'package:seratustokohalkitab/constants.dart';
import 'package:seratustokohalkitab/controllers/question_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';

class ScoreScreen extends StatefulWidget {
  @override
  _ScoreScreenState createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Timer(Duration(seconds:4),()=>{
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder:(context)=>Dashboard())
  //     )
  //   });
  // }
  @override
  void clear() {
    // TODO: implement dispose
    super.dispose();

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Dashboard()));
  }

  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          Column(
            children: [
              Spacer(flex: 3),
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(color: kSecondaryColor),
              ),
              Spacer(),
              _qnController.correctAns == null
                  ? Text(
                      "0/${_qnController.questions.length * 10}",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(color: kSecondaryColor),
                    )
                  : Text(
                      "${_qnController.numofCorrectAns * 10}/${_qnController.questions.length * 10}",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(color: kSecondaryColor),
                    ),
              Spacer(flex: 1),
              Text(
                "Press Button Back in Your Gadget",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              Spacer(flex: 2),
            ],
          )
        ],
      ),
    );
  }
}
