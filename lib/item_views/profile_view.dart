import 'package:fire_chat/model/custom_object/custom_object.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  final NewFeedCustomObject newFeed;
  final Function(int id) onTapDelete;
  final Function(int id) onTapEdit;
  const ProfileView(
    this.newFeed,
    this.onTapDelete,this.onTapEdit, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      child: SizedBox(
        height: 400,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileImageView(newFeed.profilePicture.toString()),
                const SizedBox(
                  width: 16,
                ),
                ProfileNameAndLocationView(newFeed.userName.toString()),
                const Spacer(),
                MoreButtonView(() {
                  onTapDelete(newFeed.id!);
                }, () {
                  onTapEdit(newFeed.id!);
                })
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            PostImageView(newFeed.postImage.toString()),
            const SizedBox(
              height: 16,
            ),
            PostTextView(newFeed.description.toString()),
            const SizedBox(height: 16),
            Row(
              children: const [
                Text(
                  "See Comments",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Icon(Icons.comment, size: 30, color: Colors.grey),
                SizedBox(
                  width: 16,
                ),
                Icon(
                  Icons.favorite,
                  size: 30,
                  color: Colors.grey,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PostTextView extends StatelessWidget {
  final String postText;
  const PostTextView(
    this.postText, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        postText,
        style: const TextStyle(fontSize: 10, color: Colors.black54),
      ),
    );
  }
}

class PostImageView extends StatelessWidget {
  final String postImage;
  const PostImageView(
    this.postImage, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image:
            DecorationImage(image: NetworkImage(postImage), fit: BoxFit.fill),
      ),
    );
  }
}

class MoreButtonView extends StatelessWidget {
  final Function() onTapDelete;
  final Function() onTapEdit;
  const MoreButtonView(
    this.onTapDelete,
    this.onTapEdit, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: ((context) {
        return [
          PopupMenuItem(
            onTap: () {
              onTapDelete();
            },
            value: 1,
            child: const Text("Delete"),
          ),
          PopupMenuItem(
            onTap: () {
              onTapEdit();
            },
            value: 2,
            child: const Text("Edit"),
          )
        ];
      }),
      icon: const Icon(
        Icons.more_vert,
        size: 30,
        color: Colors.black,
      ),
    );
  }
}

class ProfileImageView extends StatelessWidget {
  final String profileImage;
  const ProfileImageView(
    this.profileImage, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.network(
          profileImage,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class ProfileNameAndLocationView extends StatelessWidget {
  final String userName;
  const ProfileNameAndLocationView(
    this.userName, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Text(
            userName,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(
            width: 16,
          ),
          const Text(
            "- 3hrs ago",
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ]),
        const SizedBox(
          height: 8,
        ),
        const Text(
          "Paris",
          style: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12),
        ),
      ],
    );
  }
}
