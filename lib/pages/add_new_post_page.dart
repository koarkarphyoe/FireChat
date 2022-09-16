import 'package:fire_chat/bloc/add_new_post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNewPostPage extends StatelessWidget {
  const AddNewPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: AddNewPostBloc(),
      child: Scaffold(
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
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Consumer<AddNewPostBloc>(
            builder: (BuildContext context, bloc, Widget? child) {
              return SingleChildScrollView(
                child: Column(children: [
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: Colors.blue.shade100, width: 2)),
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: "Show your mind!",
                        border: InputBorder.none,
                      ),
                      maxLines: 50,
                      onChanged: ((value) {
                        bloc.description = value;
                      }),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Visibility(
                    visible: bloc.isAddPostError,
                    child: const Text(
                      "Should not empty your post!",
                      style: TextStyle(color: Colors.red, fontSize: 10),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: Colors.blue.shade100, width: 2)),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InkWell(
                    onTap: () {
                      bloc.addNewPost().then((value) => Navigator.pop(context));
                    },
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.blue.shade100, width: 2)),
                      child: const Center(
                        child: Text(
                          "POST",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ]),
              );
            },
          ),
        ),
      ),
    );
  }
}
