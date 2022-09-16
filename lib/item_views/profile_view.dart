import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16,bottom:16),
      child: SizedBox(
        height: 400,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileImageView(),
                const SizedBox(
                  width: 16,
                ),
                ProfileNameAndLocationView(),
                Spacer(),
                MoreButtonView(),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            PostImageView(),
            SizedBox(
              height: 16,
            ),
            PostTextView(),
            SizedBox(height: 16),
            Row(
              children: [
                Text(
                  "See Comments",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Icon(Icons.comment, size: 30, color: Colors.grey),
                SizedBox(width: 16,),
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
  const PostTextView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        "Social media are interactive technologies that facilitate the creation and sharing of information, ideas, interests, and other forms of expression through virtual communities and networks. While challenges to the definition of social media arise due to the variety of stand-alone and built-in social media services currently available, there are some common features:Social media are interactive Web 2.0 Internet-based applications. User-generated content—such as text posts or comments, digital photos or videos, and data generated through all online interactions—is the lifeblood of social media.",
        style: TextStyle(fontSize: 10, color: Colors.black54),
      ),
    );
  }
}

class PostImageView extends StatelessWidget {
  const PostImageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: NetworkImage(
                  "https://c.wallhere.com/images/6d/3e/de52cef4e9c49e8dc99099ed87b7-1512821.jpg!d"))),
    );
  }
}

class MoreButtonView extends StatelessWidget {
  const MoreButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Icon(
          Icons.more_vert,
          size: 30,
        ));
  }
}

class ProfileImageView extends StatelessWidget {
  const ProfileImageView({
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
          "https://c.wallhere.com/images/52/3d/c627f955498778a6d43e0b53298d-1388913.jpg!d",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class ProfileNameAndLocationView extends StatelessWidget {
  const ProfileNameAndLocationView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Text(
            "Noah",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(
            width: 16,
          ),
          Text(
            "- 3hrs ago",
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ]),
        SizedBox(
          height: 8,
        ),
        Text(
          "Paris",
          style: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12),
        ),
      ],
    );
  }
}
