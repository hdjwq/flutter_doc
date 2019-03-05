import 'package:flutter/material.dart';

class LabelWidget extends StatelessWidget{
  LabelWidget({
    Key key,
    this.padding=const EdgeInsets.only(left: 15,right: 15,bottom: 12),
    @required this.title,
    this.textStyle=const TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color:Colors.black)
   }):assert(padding!=null),assert(textStyle!=null),super(key:key);
  final EdgeInsetsGeometry padding;
  final String title;
  final TextStyle textStyle;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding:this.padding,
      alignment:Alignment.centerLeft,
      child:new Text(this.title,
        style:this.textStyle
      ),
    );
  }
}