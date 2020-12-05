import 'package:flutter/material.dart';

//midnight blue
const background = const Color(0xffffffff);
const darkBackground = const Color(0xfff6f7fb); //f9f9fd //

// const background = const Color(0xff1f2240);
// const darkBackground = const Color(0xff17192f);

const lightSlateGrey = const Color(0xff8388a7);

const lavender = const Color(0xffd5e7ff);

const darkSlateBlue = const Color(0xff343f88);

//5844d5 slate blue 5541df, 5541d5,6453dd
// 3f2eae darker slate blue
const primary = const Color(0xff6453dd);
const darkerPrimary = const Color(0xff3f2eae);

const textColor = Colors.black87; //Colors.white;//

var linearTextGradient = LinearGradient(
  colors: <Color>[Color(0xff5541d5), Color(0xff3f2eae)],
).createShader(Rect.fromLTRB(0, 0, 30, 15));

/*
//midnight blue
const background = const Color(0xff1f2240);
const darkBackground = const Color(0xff17192f);

//5844d5 slate blue 5541df, 5541d5,6453dd
// 3f2eae darker slate blue
const primary = const Color(0xff6453dd);
const darkerPrimary = const Color(0xff3f2eae);

const textColor = Colors.white;

 */
