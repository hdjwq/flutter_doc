import 'package:flutter/material.dart';
import 'package:flutter_doc/components/sliverWithBarList/sliverWithBarList.dart';
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