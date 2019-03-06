import 'package:flutter/material.dart';
import './model.dart';
class Bloc <T extends BlocDataBase> extends StatefulWidget{
  Bloc({
    Key key,
    this.child,
    this.mapData
  }):super(key:key);
  Widget child;
  T mapData;//map类型stream
  BlocState createState()=>new BlocState();
  static T ofData<T extends BlocDataBase>(BuildContext context){
        Type type=Bloc._typeOf<Bloc<T>>();
        Bloc<T> bloc=context.ancestorWidgetOfExactType(type);//获取第一个类型为Bloc<T>的父节点
        return bloc?.mapData;
  } //获取map类型
  static Type _typeOf<T>()=>T;//返回类型
}

class BlocState<T extends BlocDataBase> extends State<Bloc<T>>{
  @override
   void dispose() {
    // TODO: implement dispose
    widget.mapData.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return widget.child;
  }
}