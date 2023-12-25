import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Global with ChangeNotifier{
  late Size size;

  setSize(Size size){
    this.size = size;
  }

  double getSizeWidth(){
    return size.width;
  }

  double getSizeHeight(){
    return size.height;
  }

  static Color getMainBackGroundColor(){
    return Colors.black;
  }

  static bool isUseServer(){
    return false;
  }
}