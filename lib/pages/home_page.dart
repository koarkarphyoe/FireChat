import 'package:fire_chat/item_views/profile_view.dart';
import 'package:fire_chat/pages/add_new_post_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "SocialApp",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(
                Icons.search,
                color: Colors.grey,
                size: 30,
              ))
        ],
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.only(left: 16, right: 16),
        itemCount: 10,
        itemBuilder: ((context, index) {
          return ProfileView();
        }),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue.shade100,
          foregroundColor: Colors.white,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const AddNewPostPage())));
          },
          child: const Icon(
            Icons.add_circle_outline_outlined,
            size: 40,
          )),
    );
  }
}
