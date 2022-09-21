import 'dart:io';

import 'package:fire_chat/model/custom_object/custom_object.dart';
import 'package:fire_chat/model/custom_object/user_vo.dart';
import 'package:fire_chat/model/model/authentication_model.dart';
import 'package:fire_chat/model/model/authentication_model_impl.dart';
import 'package:fire_chat/model/model/data_model.dart';
import 'package:fire_chat/model/model/data_model_impl.dart';
import 'package:flutter/cupertino.dart';

class AddNewPostBloc extends ChangeNotifier {
  DataModel dataModel = DataModelImpl();
  AuthenticationModel authenticationModel = AuthenticationModelImpl();

  String? description = "";
  String? userName = "";
  String? profilePicture = "";
  UserVo? userVo;

  bool isAddPostError = false;

  bool isEditMode = false;

  bool isLoading = false;

  NewFeedCustomObject? newFeed;

  File? chooseImage;

  AddNewPostBloc(int? id) {
    
    userVo = authenticationModel.getLoggedInUser();

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
      return dataModel.addNewPost(description!, chooseImage!).then((value) {
        isLoading = false;
        notifyListeners();
      });
    }
  }

  Future<void> editedNewPost() {
    newFeed!.description = description;
    if (newFeed != null) {
      return dataModel.editPost(newFeed!).then((value) {
        isLoading = false;
        notifyListeners();
      });
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
    userName = userVo!.userName;
    profilePicture =
        "https://th.bing.com/th/id/R.49376b553f3b5f5b67409592744e5579?rik=WzvpBRDluxLgBg&pid=ImgRaw&r=0";
    notifyListeners();
  }

  Future<void> onTapPostButtonInView() {
    if (isEditMode) {
      isLoading = true;
      notifyListeners();
      return editedNewPost();
    } else {
      isLoading = true;
      notifyListeners();
      return addNewPost();
    }
  }

  void onTapChooseImag(File image) {
    chooseImage = image;
    notifyListeners();
  }

  void onTapDeleteIcon() {
    chooseImage = null;
    notifyListeners();
  }
}
