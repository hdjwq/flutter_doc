import 'package:flutter_doc/bloc/bloc.dart';
import './index.dart';
import './bloc.dart';
import 'package:flutter/material.dart';

class HomeIndex extends StatelessWidget{
   @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Bloc<HomeBloc>(
      child: new Home(),
      mapData:{'user':new HomeBloc()},//home页面bloc
    );
  }
}