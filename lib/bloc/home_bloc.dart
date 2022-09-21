import 'package:fire_chat/model/custom_object/custom_object.dart';
import 'package:fire_chat/model/model/authentication_model.dart';
import 'package:fire_chat/model/model/authentication_model_impl.dart';
import 'package:fire_chat/model/model/data_model_impl.dart';
import 'package:flutter/cupertino.dart';

import '../model/model/data_model.dart';

class HomeBloc extends ChangeNotifier {
  DataModel dataModel = DataModelImpl();
  AuthenticationModel authenticationModel = AuthenticationModelImpl();

  List<NewFeedCustomObject>? newFeedList;

  HomeBloc() {
    dataModel.getNewFeedList().listen((event) {
      newFeedList = event;
      notifyListeners();
    });
  }

  void deletePost(int id) {
    dataModel.deletePost(id);
  }

  Future logOut() {
    return authenticationModel.logOut();
  }
}
