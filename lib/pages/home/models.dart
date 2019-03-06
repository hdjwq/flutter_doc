import 'package:flutter_doc/bloc/bloc.dart';
import './bloc.dart';
import 'package:flutter/material.dart';
class ListItem {
   ListItem({
     this.title,
     this.content
   });
   final String title;
   final String content;
}

class HomeBlocData implements BlocDataBase{
      HomeBlocData({
        @required this.Mat,
        @required this.Ios
      }):assert(Mat!=null&&Ios!=null);
      final HomeListBloc Mat;
      final HomeListBloc Ios;
      @override
      dispose(){
        this.Mat.dispose();
        this.Ios.dispose();
      }
}

class Components{
  Components({
    this.bars,
    this.views
  });
  final List<Widget> bars;
  final List<Widget> views;
} //tab modal

class ScrollOffset{
      ScrollOffset({
        this.Mat,
        this.Ios
      });
      double Mat;
      double Ios;
}//滚动位置