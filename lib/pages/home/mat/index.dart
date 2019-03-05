import 'package:flutter/material.dart';
import 'package:flutter_doc/components/sliverWithBarList/sliverWithBarList.dart';
import 'package:rxdart/rxdart.dart';
import '../models.dart';
import 'package:flutter_doc/bloc/bloc.dart';
import '../bloc.dart';
import 'dart:async';
class MatWidget extends StatefulWidget{
  _MatState createState()=>new _MatState();
}

class _MatState extends State<MatWidget> with AutomaticKeepAliveClientMixin{
  PublishSubject<List<ListItem>> _publishSubject;
  List<ListItem> data=[];
  HomeBloc _homeBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _homeBloc=Bloc.ofData<HomeBloc>(context)["user"];
    _publishSubject=_homeBloc.streamController;
    _publishSubject.listen((List<ListItem> list){
      setState(() {
        data.addAll(list);
      });
    });
    Future.delayed(new Duration(seconds: 4),(){
       _homeBloc.add();
    });
  }
  @override
  bool get wantKeepAlive=>true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new SliverWithBarList<ListItem>(
           type: SliverTypes.MAT,
           listData:data,
           builder: <ListItem>(context,item){
             return null;
           },
    );
  }
}