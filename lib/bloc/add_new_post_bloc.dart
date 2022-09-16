import 'package:fire_chat/model/model/data_model.dart';
import 'package:fire_chat/model/model/data_model_impl.dart';
import 'package:flutter/cupertino.dart';

class AddNewPostBloc extends ChangeNotifier {
  DataModel dataModel = DataModelImpl();

  String description = "";
  bool isAddPostError = false;

  AddNewPostBloc() {}

  Future<void> addNewPost() {
    if (description.isEmpty) {
      isAddPostError = true;
      notifyListeners();
      return Future.error("error");
    } else {
      isAddPostError = false;
      return dataModel.addNewPost(description);
    }
  }
}
