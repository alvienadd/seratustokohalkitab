import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:seratustokohalkitab/Screens/components/score_screen.dart';
import 'package:seratustokohalkitab/models/Questions.dart';

//We use get package for our state management
class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  //Lets animated our progress bar

  AnimationController _animationController;
  Animation _animation;
  //So that we can access our animation outside
  Animation get animation => this._animation;

  PageController _pageController;
  PageController get pageController => this._pageController;

  List<Question> _questions = sample_data
      .map((question) => Question(
          id: question['id'],
          question: question['question'],
          options: question['options'],
          answer: question['answer_index']))
      .toList();

  List<Question> get questions => this._questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  int _correctAns;
  int get correctAns => this._correctAns;

  int _selectedAns;
  int get selectedAns => this._selectedAns;

  //for more about obs please check documentation
  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numofCorrectAns = 0;
  int get numofCorrectAns => this._numofCorrectAns;

  //called immediately after the widget is allocated memory
  @override
  void onInit() {
    //Our Animation duration is 60s
    //So our plan is to fill the proggress bar within 60s
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        //update like setState
        update();
      });

    //start our animation
    //once 60s is completed go the next qn
    _animationController.forward().whenComplete(nextQuestion);

    _pageController = PageController();

    super.onInit();
  }

  //called just before the Controller is deleted from memory
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAns(Question question, int selectedIndex) {
    //because once user press any option and then it will run
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) _numofCorrectAns++;
    //It will stop the counter
    _animationController.stop();
    update();

    //once user select an answer after 3s, it will go to the next qn
    Future.delayed(Duration(seconds: 3), () {
        nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);

      //Reset the Counter
      _animationController.reset();
      //then start it again
         //once 60s is completed go the next qn
      _animationController.forward().whenComplete(nextQuestion);
    }
    else{
      //Get package provide us simple way to navigate another
      Get.to(ScoreScreen());
      
    }

  }

  void updateTheQnNum(int index){
    _questionNumber.value=index+1;
  }

}
