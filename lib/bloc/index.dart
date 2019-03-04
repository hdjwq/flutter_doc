import 'package:flutter/material.dart';
import './model.dart';
class Bloc <T extends BlocDataBase> extends StatefulWidget{
  Bloc({
    Key key,
    this.child,
    this.mapDatas,
    this.mapData
  }):super(key:key);
  Widget child;
  Map<String,T> mapData;//map类型stream
  Map<String,List<T>> mapDatas;//map list类型 stream
  BlocState createState()=>new BlocState();
  static Map<String,T> ofData<T extends BlocDataBase>(BuildContext context){
        Type type=Bloc._typeOf<Bloc<T>>();
        Bloc<T> bloc=context.ancestorWidgetOfExactType(type);//获取第一个类型为Bloc<T>的父节点
        return bloc?.mapData;
  } //获取map类型
  static Map<String,List<T>> ofDatas<T extends BlocDataBase>(BuildContext context){
    Type type=Bloc._typeOf<Bloc<T>>();
    Bloc<T> bloc=context.ancestorWidgetOfExactType(type);
    return bloc?.mapDatas;
  }
  static Type _typeOf<T>()=>T;//返回类型
}

class BlocState<T extends BlocDataBase> extends State<Bloc<T>>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return widget.child;
  }
}