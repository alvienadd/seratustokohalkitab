import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seratustokohalkitab/Screens/components/option.dart';
import 'package:seratustokohalkitab/constants.dart';
import 'package:seratustokohalkitab/controllers/question_controller.dart';
import 'package:seratustokohalkitab/models/Questions.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key key,
    //it means we have to pass this
    @required this.question
  }) : super(key: key);

  final Question question;
  
  @override
  Widget build(BuildContext context) {
      QuestionController _controller=Get.put(QuestionController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: kBlackColor),
          ),
          ...List.generate(question.options.length, (index) => Option(
            index:index,
            text:question.options[index],
            press:()=>_controller.checkAns(question, index)
            ))
        ],
      ),
    );
  }
}