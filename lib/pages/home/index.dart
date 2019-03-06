import 'package:flutter/material.dart';
import 'package:flutter_doc/bloc/bloc.dart';
import './basics/index.dart';
import './about/index.dart';
import 'package:flutter_doc/models/models.dart';
import './models.dart';
import 'package:flutter/services.dart';
import 'package:flutter_doc/components/sliverWithBarList/sliverWithBarList.dart';
import 'package:rxdart/rxdart.dart';
class Home extends StatefulWidget{
  HomeState createState()=>new HomeState();
}
class HomeState extends State<Home> with SingleTickerProviderStateMixin{
  List<ItemLK> _bar=[new ItemLK("MAT","MAT"),new ItemLK("IOS","IOS"),new ItemLK("基础","basics"),ItemLK("关于","about")];
  TabController _tabController;
  HomeBlocData homeBlocData;
  ListDataModel<DefaultItemData> matData=new ListDataModel<DefaultItemData>(data: [],err: false);//mat数据模型
  ListDataModel<DefaultItemData> iosData=new ListDataModel<DefaultItemData>(data: [],err: false);//ios数据模型
  ScrollOffset scrollOffset=new ScrollOffset(Mat: 0,Ios: 0);//滚动条位置记录
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeBlocData=Bloc.ofData<HomeBlocData>(context);
    _tabController=new TabController(length:_bar.length, vsync:this);
    _streamListen();
    _tabController.addListener(_tabListen);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.removeListener(_tabListen);
    super.dispose();
  }
  void _tabListen(){
     if(_tabController.indexIsChanging){
        setState((){

        });
        switch(_tabController.index){
          case 0:
            homeBlocData.Mat.addList(10);
            break;
          case 1:
            homeBlocData.Ios.addList(10);
        }
     }
  }//tab改变监听
  void _streamListen(){
     homeBlocData.Mat.addList(10);
     _listenController("Mat", homeBlocData.Mat.behaviorSubject);
     _listenController("Ios", homeBlocData.Ios.behaviorSubject);
  }//监听stream
  void _listenController<T>(String key,Observable<T> stream){
      stream.listen((T data){
         if(key=="Mat"||key=="Ios"){
           List<DefaultItemData> datas=data as List<DefaultItemData>;
           if(key=="Mat"){
             matData.data.addAll(datas);
           }else{
             iosData.data.addAll(datas);
           }
         }
         setState((){

         });
      });
  }//监听控制器
  Components _doms(){
    int len=_bar.length;
    List<Widget> tabs=new List(len);
    List<Widget> views=new List(len);
    for(int i=0;i<len;i++){
      ItemLK item=_bar[i];
      String label=item.label;
      String key=item.key;
      tabs[i]=new Tab(text: label);
      views[i]=_viewsByType(key);
    }
    return new Components(
       bars: tabs,
       views: views
    );
  } //构造tabbar和tabView
  Widget _viewsByType(String type){
     switch(type){
       case "MAT":
         return new SliverWithBarList(
           type: SliverTypes.MAT,
           listData:matData.data,
           err: matData.err,
           scrollEndCall:(double offset){
             _scrollEnd("MAT", offset);
           },
           initScroll:scrollOffset.Mat,
         );
         break;
       case "IOS":
         return new SliverWithBarList(
           type: SliverTypes.ISO,
           listData:iosData.data,
           err: iosData.err,
           scrollEndCall:(double offset){
             _scrollEnd("Ios", offset);
           },
           initScroll:scrollOffset.Ios,
         );
         break;
       case "basics":
         return new BasicsWidget();
         break;
       default:
         return new AboutWidget();
     }
  }//判断类型返回tabView
  _scrollEnd(String key,double offset){
     switch(key){
       case "MAT":
         scrollOffset.Mat=offset;
         break;
       case "Ios":
         scrollOffset.Ios=offset;
         break;
     }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Components _components=_doms();
    EdgeInsets pd=MediaQuery.of(context).padding;
    SystemUiOverlayStyle systemUiOverlayStyle=SystemUiOverlayStyle.dark;
    return new AnnotatedRegion(
        value:systemUiOverlayStyle,
        child:new Scaffold(
            body:new TabBarView(
              children:_components.views,
              controller: _tabController,
            ),
            bottomNavigationBar: new Container(
                color: Theme.of(context).primaryColor,
                padding: EdgeInsets.only(bottom: pd.bottom),
                child: new TabBar(
                  tabs:_components.bars,
                  controller:_tabController,
                )
            )
        )
    );
  }
}

