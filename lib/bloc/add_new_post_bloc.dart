import 'package:fire_chat/model/custom_object/custom_object.dart';
import 'package:fire_chat/model/model/data_model.dart';
import 'package:fire_chat/model/model/data_model_impl.dart';
import 'package:flutter/cupertino.dart';

class AddNewPostBloc extends ChangeNotifier {
  DataModel dataModel = DataModelImpl();

  String? description = "";
  String? userName = "";
  String? profilePicture = "";

  bool isAddPostError = false;

  bool isEditMode = false;

  NewFeedCustomObject? newFeed;

  AddNewPostBloc(int? id) {
    if (id != null) {
      isEditMode = true;
      prepopulatedDataForEditMode(id);
      notifyListeners();
    } else {
      isEditMode = false;
      prepopulatedDataForAddNewPost();
      notifyListeners();
    }
  }

  Future<void> addNewPost() {
    if (description!.isEmpty) {
      isAddPostError = true;
      notifyListeners();
      return Future.error("error");
    } else {
      isAddPostError = false;
      return dataModel.addNewPost(description!);
    }
  }

  Future<void> editedNewPost() {
    newFeed!.description = description;
    if (newFeed != null) {
      return dataModel.editPost(newFeed!);
    } else {
      return Future.error("error");
    }
  }

  void prepopulatedDataForEditMode(int postId) {
    dataModel.getNewFeedById(postId).then((newFeedCustomObject) {
      description = newFeedCustomObject.description!;
      userName = newFeedCustomObject.userName;
      profilePicture = newFeedCustomObject.profilePicture;

      newFeed = newFeedCustomObject;
      notifyListeners();
    });
  }

  void prepopulatedDataForAddNewPost() {
    userName = "Tony";
    profilePicture =
        "https://th.bing.com/th/id/R.49376b553f3b5f5b67409592744e5579?rik=WzvpBRDluxLgBg&pid=ImgRaw&r=0";
    notifyListeners();
  }

  Future<void> onTapPostButtonInView() {
    if (isEditMode) {
      return editedNewPost();
    } else {
      return addNewPost();
    }
  }
}
