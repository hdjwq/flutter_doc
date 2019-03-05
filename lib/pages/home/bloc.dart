import 'package:flutter_doc/bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import './models.dart';
class HomeBloc implements BlocDataBase{
    PublishSubject<List<ListItem>> _streamController=new PublishSubject<List<ListItem>>();
    PublishSubject<List<ListItem>> get streamController=>_streamController;
    void add(){
        _streamController.add([new ListItem(title: "标题",content: "内容")]);
    }
    void dispose(){
        _streamController.close();
    }
}

