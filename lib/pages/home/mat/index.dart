import 'package:flutter/material.dart';
import 'package:flutter_doc/components/title/title.dart';
class MatWidget extends StatefulWidget{
  _MatState createState()=>new _MatState();
}

class _MatState extends State<MatWidget> with AutomaticKeepAliveClientMixin{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  bool get wantKeepAlive=>true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView(
       children: <Widget>[
           new LabelWidget(
              title: "Material Components",
           )
       ],
    );
  }
}