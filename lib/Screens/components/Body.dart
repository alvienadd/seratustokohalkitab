import 'package:flutter/material.dart';
import 'package:seratustokohalkitab/Screens/components/progress_bar.dart';
import 'package:seratustokohalkitab/Screens/components/question_card.dart';
import 'package:seratustokohalkitab/constants.dart';
import 'package:seratustokohalkitab/controllers/question_controller.dart';
// import 'package:seratustokohalkitab/models/Question.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // So that we have acccess our controller
    QuestionController _questionController = Get.put(QuestionController());
    return Stack(
      children: [
        WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.fill),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: ProgressBar(),
              ),
              SizedBox(height: kDefaultPadding),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Obx(()=>Text.rich(TextSpan(
                  text: "Question ${_questionController.questionNumber.value}",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: kSecondaryColor),
                  children: [
                    TextSpan(
                      text: "/${_questionController.questions.length}",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: kSecondaryColor),
                    ),
                  ],
                ))),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Text("Swipe Left/Right for Next/Reset",style: TextStyle(color: Colors.white),),
              ),
              Divider(thickness: 0.5, color: Colors.white),
              SizedBox(height: kDefaultPadding),
              Expanded(
                child: PageView.builder(
                  // Block swipe to next qn
                  // physics: NeverScrollableScrollPhysics(),
                  // controller: _questionController.pageController,
                  onPageChanged: _questionController.updateTheQnNum,
                  controller: _questionController.pageController,
                  itemCount: _questionController.questions.length,
                  itemBuilder: (context, index) => ListView(
                    physics: ClampingScrollPhysics(),
                    children: [QuestionCard(
                      question: _questionController.questions[index],
                    )],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
