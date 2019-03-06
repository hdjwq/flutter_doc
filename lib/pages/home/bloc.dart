import 'package:flutter_doc/bloc/listBloc.dart';
import 'package:flutter_doc/components/sliverWithBarList/sliverWithBarList.dart';
import 'dart:async';
class HomeListBloc extends ListBloc<DefaultItemData>{
     void addList(int len){
         List<DefaultItemData> data=[];
         for(int i =0;i<len;i++){
             data.add(new DefaultItemData(title: "标题",content: "内容",itemId: ""));
         }
         Future.delayed(new Duration(seconds: 2),(){
           this.add(data);
         });
     }
}



