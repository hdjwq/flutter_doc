import 'package:flutter/material.dart';

class AboutWidget extends StatefulWidget{
  _AboutState createState()=>new _AboutState();
}

class _AboutState extends State<AboutWidget> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive=>true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Text("about");
  }
}