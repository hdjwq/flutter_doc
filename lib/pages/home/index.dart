import 'package:flutter/material.dart';
import 'package:flutter_doc/bloc/bloc.dart';
import './mat/index.dart';
import './ios/index.dart';
import './basics/index.dart';
import './about/index.dart';
import 'package:flutter_doc/models/models.dart';
import './bloc.dart';
import 'package:flutter/services.dart';
class Home extends StatefulWidget{
  HomeState createState()=>new HomeState();
}
class HomeState extends State<Home>{
  List<ItemLK> _bar=[new ItemLK("MAT","MAT"),new ItemLK("IOS","IOS"),new ItemLK("基础","basics"),ItemLK("关于","about")];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HomeBloc user=Bloc.ofData<HomeBloc>(context)["user"];
    print(user.streamController);
  }
  _Components _doms(){
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
    return new _Components(
       bars: tabs,
       views: views
    );
  } //构造tabbar和tabView
  Widget _viewsByType(String type){
     switch(type){
       case "MAT":
         return new MatWidget();
         break;
       case "IOS":
         return new IosWidget();
         break;
       case "basics":
         return new BasicsWidget();
         break;
       default:
         return new AboutWidget();
     }
  }//判断类型返回tabView
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    _Components _components=_doms();
    EdgeInsets pd=MediaQuery.of(context).padding;
    SystemUiOverlayStyle systemUiOverlayStyle=SystemUiOverlayStyle.dark;
    return new AnnotatedRegion(
      value:systemUiOverlayStyle,
      child: new DefaultTabController(length:_bar.length,
        child:new Scaffold(
        body:new TabBarView(children:_components.views),
        bottomNavigationBar: new Container(
        color: Theme.of(context).primaryColor,
        padding: EdgeInsets.only(bottom: pd.bottom),
        child: new TabBar(tabs:_components.bars),
        ))));
  }
}

class _Components{
     _Components({
       this.bars,
       this.views
     });
     final List<Widget> bars;
     final List<Widget> views;
} //tab modal
