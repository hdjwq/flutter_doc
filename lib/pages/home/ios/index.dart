import 'package:flutter/material.dart';

class IosWidget extends StatefulWidget{
  _IosState createState()=>new _IosState();
}

class _IosState extends State<IosWidget> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive=>true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Text("ios");
  }
}