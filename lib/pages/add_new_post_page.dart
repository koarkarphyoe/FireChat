import 'dart:io';

import 'package:fire_chat/bloc/add_new_post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';

class AddNewPostPage extends StatelessWidget {
  final int? id;
  const AddNewPostPage({this.id, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: AddNewPostBloc(id),
      child: Consumer<AddNewPostBloc>(
        builder: (BuildContext context, bloc, Widget? child) {
          return Stack(
            children: [
              Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  title: const Text(
                    "Add New Post",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Consumer<AddNewPostBloc>(
                    builder: (BuildContext context, bloc, Widget? child) {
                      return SingleChildScrollView(
                        child: Column(children: [
                          UserProfileImageAndNameView(bloc.userName!),
                          const SizedBox(
                            height: 16,
                          ),
                          const DescriptionTextBoxView(),
                          const SizedBox(
                            height: 8,
                          ),
                          PostErrorView(bloc.isAddPostError),
                          const SizedBox(
                            height: 8,
                          ),
                          ChooseImageView(() async {
                            final ImagePicker picker = ImagePicker();
                            // Pick an image
                            final XFile? image = await picker.pickImage(
                                source: ImageSource.gallery);
                            bloc.onTapChooseImag(File(image!.path));
                          }, () {
                            bloc.onTapDeleteIcon();
                          }),
                          const SizedBox(
                            height: 16,
                          ),
                          InkWell(
                            onTap: () {
                              // bloc.addNewPost().then((value) => Navigator.pop(context));
                              bloc
                                  .onTapPostButtonInView()
                                  .then((value) => Navigator.pop(context));
                            },
                            child: const PostButtonView(),
                          ),
                        ]),
                      );
                    },
                  ),
                ),
              ),
              Visibility(
                visible: bloc.isLoading,
                child: Container(
                  color: Colors.black12,
                  child: const Center(
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: LoadingIndicator(
                          colors: [Colors.white, Colors.transparent],
                          strokeWidth: 5,
                          indicatorType: Indicator.ballRotate),
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class UserProfileImageAndNameView extends StatelessWidget {
  final String userName;
  const UserProfileImageAndNameView(this.userName,{
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: const DecorationImage(
                  image: NetworkImage(
                      "https://c.wallhere.com/images/13/c5/4009382d8def55e9a6874212be0b-1561467.jpg!d"),
                  fit: BoxFit.cover)),
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          userName,
          style:const TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ],
    );
  }
}

class PostButtonView extends StatelessWidget {
  const PostButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.blue.shade100, width: 2)),
      child: const Center(
        child: Text(
          "POST",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}

class DescriptionTextBoxView extends StatelessWidget {
  const DescriptionTextBoxView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddNewPostBloc>(
      builder: (BuildContext context, bloc, Widget? child) {
        return Container(
          height: 250,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blue.shade100, width: 2)),
          child: TextField(
            controller: TextEditingController(text: bloc.description),
            decoration: const InputDecoration(
              hintText: "Show your mind!",
              border: InputBorder.none,
            ),
            maxLines: 50,
            onChanged: ((text) {
              bloc.description = text;
            }),
          ),
        );
      },
    );
  }
}

class PostErrorView extends StatelessWidget {
  final bool isAddPostError;
  const PostErrorView(
    this.isAddPostError, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isAddPostError,
      child: const Text(
        "Should not empty your post!",
        style: TextStyle(color: Colors.red, fontSize: 10),
      ),
    );
  }
}

class ChooseImageView extends StatelessWidget {
  final Function() onTapChooseGallery;
  final Function() onTapDelete;
  const ChooseImageView(
    this.onTapChooseGallery,
    this.onTapDelete, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddNewPostBloc>(
      builder: (context, bloc, child) {
        return Container(
          height: 250,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blue.shade100, width: 2)),
          child: Stack(
            children: [
              InkWell(
                onTap: () {
                  onTapChooseGallery();
                },
                child: Align(
                  alignment: Alignment.center,
                  child: (bloc.chooseImage == null)
                      ? Image.network(
                          "https://th.bing.com/th/id/OIP.8qX0SWYHSNAGhhLxS_GHzgAAAA?pid=ImgDet&rs=1",
                          fit: BoxFit.fill,
                        )
                      : Image.file(bloc.chooseImage!),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    onTapDelete();
                  },
                  child: const Icon(
                    Icons.delete_forever,
                    size: 30,
                    color: Colors.red,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
