import 'package:rxdart/rxdart.dart';
import './model.dart';

class ListBloc<T>  implements BlocDataBase{
  BehaviorSubject<List<T>> _behaviorSubject=new BehaviorSubject<List<T>>();// List Stream
  BehaviorSubject<List<T>> get behaviorSubject=>_behaviorSubject;
  List<T> datas=[];
  void add(List<T> itemDatas){
     datas.addAll(itemDatas);
    _behaviorSubject.add(datas);
  }

  void dispose(){
    _behaviorSubject.close();
  }
}