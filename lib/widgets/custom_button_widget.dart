import 'package:flutter/material.dart';
import 'package:seratustokohalkitab/core/const.dart';

class CustomButtonWidget extends StatelessWidget {
  final double size;
  final Widget child;
  final String image;
  final double borderWidth;
  final bool isActive;
  final VoidCallback onTap;

  CustomButtonWidget({
    this.child,
    @required this.size,
    @required this.onTap,
    this.image,
    this.borderWidth = 2,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    var boxDecoration = BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(200)),
        border: Border.all(
            width: 2,
            color: isActive ? AppColors.darkBlue : AppColors.mainColor),
        boxShadow: [
          BoxShadow(
              color: AppColors.lightBlueShadow,
              blurRadius: 10,
              offset: Offset(5, 5),
              spreadRadius: 3),
          BoxShadow(
              color: Colors.white60,
              blurRadius: 5,
              offset: Offset(-5, -5),
              spreadRadius: 3)
        ],
        gradient: RadialGradient(colors: [
          AppColors.mainColor,
          AppColors.mainColor,
          AppColors.mainColor,
          Colors.white
        ]));

    if (image != null) {
      boxDecoration = boxDecoration.copyWith(
          image: DecorationImage(
              image: ExactAssetImage(image), fit: BoxFit.cover));
    }

    if (isActive) {
      boxDecoration = boxDecoration.copyWith(
          gradient: RadialGradient(
              colors: [AppColors.lightBlue, AppColors.darkBlue]));
    } else {
      boxDecoration = boxDecoration.copyWith(
          gradient: RadialGradient(colors: [
        AppColors.mainColor,
        AppColors.mainColor,
        AppColors.mainColor,
        Colors.white
      ]));
    }

    return Container(
      width: size,
      height: size,
      decoration: boxDecoration,
      child: FlatButton(
        padding: EdgeInsets.all(0),
        onPressed:onTap,
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(200))
        ), 
        child: child ?? Container()),
    );
  }
}
