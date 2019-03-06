import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_doc/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
typedef ScrollEndCall=Function(double offset);
enum SliverTypes{
     MAT,
     ISO,
     BAISIC
} //类型枚举
typedef Builder=Widget Function(BuildContext context, DefaultItemData item);
class SliverWithBarList<T extends DefaultItemData> extends StatefulWidget{
  SliverWithBarList({
     Key key,
     @required this.type,
     @required this.listData,
     this.builder,
     this.err=false,
     this.scrollEndCall,
     this.initScroll=0
   }):assert(type!=null),assert(listData!=null),assert(initScroll!=null),super(key:key);
  final SliverTypes type;//类型
  List<T> listData;//数据
  bool err;//错误
  Builder builder;//构建函数
  ScrollEndCall scrollEndCall; //滚动回调函数
  double initScroll; //初始高度
  _SliverWithBarListState createState()=>new _SliverWithBarListState<T>();
}

class _SliverWithBarListState<T extends DefaultItemData> extends State<SliverWithBarList<T>>{
  List<ItemLK> _data=[new ItemLK("Material Components","material-ui-logo.svg"),new ItemLK("Cupertinos","ios-logo.svg")];
  ScrollController _scrollController;
  @override
  initState(){
    super.initState();
    _scrollController=new ScrollController(initialScrollOffset: widget.initScroll);

  }
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
      doms.add(new Expanded(child:_slivers()));//有数据时候
    }
    return doms;
  }//判读有无data
  Widget _builder(BuildContext context,int i){
    if(widget.builder==null){
     return _defaultBuilder(widget.listData[i]);
    }
    return widget.builder(context,widget.listData[i]);
  } //构建builder分配默认builder
  Widget _defaultBuilder(DefaultItemData item){
      return new Card(
         child: new ListTile(
            title: new Text(item.title),
            subtitle: new Text(item.content), 
            trailing: new Text("下去"),
         ),
         elevation: 3,
      );
  }//默认builder
  Widget _slivers(){
    ItemLK item=_data[widget.type.index];
    return new NotificationListener(child:new CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        SliverAppBar(
          flexibleSpace: new Card(
            child: new FlexibleSpaceBar(
              background:SvgPicture.asset("img/${item.key}"),
              title:new Text(item.label),
              centerTitle: true,
            ),
            color: Theme.of(context).primaryColor,
            margin: EdgeInsets.all(0),
            elevation:3,
          ),
          expandedHeight: 200,
          pinned: true,
          backgroundColor: Colors.transparent,
        ),
        new SliverList(delegate:new SliverChildBuilderDelegate(_builder,
            childCount: widget.listData.length))
      ],
    ),onNotification:_onNotification);
  }//列表函数
  Widget _loadingOrErr(){
       if(widget.err){
         return new Text("错误了");
       }
       return new CupertinoActivityIndicator(radius: 18);
  }//错误函数
  Future<List<T>> _onRefresh() async{

  }
  bool _onNotification<ScrollNotification>(ScrollNotification scrollNotification){
    if(scrollNotification is ScrollEndNotification){
       if(widget.scrollEndCall!=null){
         widget.scrollEndCall(_scrollController.offset);
       }
    }
    return true;
  }//监听滚动位置
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new RefreshIndicator(child:new Column(
      children:_doms(),
    ), onRefresh:_onRefresh);
  }
}

class DefaultItemData{
      DefaultItemData({
        this.title="",
        this.content="",
        this.itemId
      }):assert(itemId!=null);
      final String title;
      final String content;
      final String itemId;
}//item数据模型