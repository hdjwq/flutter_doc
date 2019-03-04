import 'package:flutter_doc/bloc/bloc.dart';
import 'dart:async';

class HomeBloc implements BlocDataBase{
    StreamController<int> _streamController=new StreamController<int>();
    StreamController<int> get streamController=>_streamController;

    void dispose(){
        _streamController.close();
    }
}