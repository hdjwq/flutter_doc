import 'package:flutter/material.dart';
import './modal.dart';
class Bloc <T extends BlocDataBase> extends StatefulWidget{
  Bloc({
    Key key,
    this.child,
    this.mapDatas,
    this.mapData
  }):super(key:key);
  Widget child;
  Map<String,T> mapData;
  Map<String,List<T>> mapDatas;
  BlocState createState()=>new BlocState();
  static Map<String,T> ofData<T extends BlocDataBase>(BuildContext context){
        Type type=Bloc._typeOf<Bloc<T>>();
        Bloc<T> bloc=context.ancestorWidgetOfExactType(type);
        return bloc?.mapData;
  }
  static Map<String,List<T>> ofDatas<T extends BlocDataBase>(BuildContext context){
    Type type=Bloc._typeOf<Bloc<T>>();
    Bloc<T> bloc=context.ancestorWidgetOfExactType(type);
    return bloc?.mapDatas;
  }
  static Type _typeOf<T>()=>T;
}

class BlocState<T extends BlocDataBase> extends State<Bloc<T>>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return widget.child;
  }
}