import 'package:flutter_doc/bloc/bloc.dart';
import './index.dart';
import './bloc.dart';
import 'package:flutter/material.dart';
import './models.dart';

class HomeIndex extends StatelessWidget{
   @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Bloc<HomeBlocData>(
      child: new Home(),
      mapData:new HomeBlocData(Mat:new HomeListBloc(), Ios: new HomeListBloc()),//home页面bloc
    );
  }
}