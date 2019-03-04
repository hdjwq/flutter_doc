import 'package:flutter/material.dart';
import 'package:flutter_doc/bloc/bloc.dart';
import './bloc.dart';
class Home extends StatefulWidget{
  HomeState createState()=>new HomeState();
}
class HomeState extends State<Home>{
  List<String> _bar=["MAT","IOS","基础","关于"];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HomeBloc user=Bloc.ofData<HomeBloc>(context)["user"];
    print(user.streamController);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    EdgeInsets pd=MediaQuery.of(context).padding;
    return new DefaultTabController(length:_bar.length,
        child:new Scaffold(
          body:new Container(
            padding: EdgeInsets.only(top:pd.top),
          ),
          bottomNavigationBar: new Container(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.only(bottom: pd.bottom),
            child: new TabBar(tabs:_bar.map<Tab>((String item){
              return Tab(text: item);
            }).toList()),
          ),
        ));
  }
}