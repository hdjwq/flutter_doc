import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_doc/models/models.dart';
import 'package:flutter/cupertino.dart';
enum SliverTypes{
     MAT,
     ISO,
     BAISIC
} //类型枚举
typedef Builder=Widget Function<T>(BuildContext context,T item);
class SliverWithBarList<T> extends StatefulWidget{
  SliverWithBarList({
     Key key,
     @required this.type,
     @required this.listData,
     @required this.builder,
     this.err=false
   }):assert(type!=null),assert(listData!=null),super(key:key);
  final SliverTypes type;
  List<T> listData;
  bool err;
  Builder builder;
  _SliverWithBarListState createState()=>new _SliverWithBarListState<T>();
}

class _SliverWithBarListState<T> extends State<SliverWithBarList<T>>{
  List<ItemLK> _data=[new ItemLK("Material Components","material-ui-logo.svg"),new ItemLK("Cupertinos","ios-logo.svg")];
  List<Widget> _doms(){
    List<Widget> doms=[];
    double top=MediaQuery.of(context).padding.top;
    if(widget.listData.length==0){
       doms.add(new Container(
                height:200+top,
                child:_slivers()));
       doms.add(Expanded(child:_loadingOrErr()));
       //data为空时
    }else{
      doms.add(new Expanded(child:_slivers()));
    }
    return doms;
  }
  Widget _slivers(){
    ItemLK item=_data[widget.type.index];
    return new CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          flexibleSpace: new FlexibleSpaceBar(
            background:new Container(
              padding: EdgeInsets.only(top:MediaQuery.of(context).padding.top,bottom: 12),
              color: Theme.of(context).primaryColor,
              child: SvgPicture.asset("img/${item.key}"),
            ),
            title: new Text(item.label),
            centerTitle: true,
          ),
          expandedHeight: 200,
          pinned: true,
        ),
        new SliverList(delegate:new SliverChildBuilderDelegate(builder))
      ],
    );
  }
  Widget _loadingOrErr(){
       if(widget.err){
         return new Text("错误了");
       }
       return new CupertinoActivityIndicator(radius: 18);
  }
  Future<List<T>> _onRefresh() async{

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new RefreshIndicator(child:new Column(
      children:_doms(),
    ), onRefresh:_onRefresh);
  }
}