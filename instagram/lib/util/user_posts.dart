import 'package:flutter/material.dart';

class UserPosts extends StatelessWidget {
  final String userName;
  final String caption;
  const UserPosts({super.key, required this.userName, required this.caption});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
                color: Theme.of(context).primaryColor,
              ),
            ),

            // PROFILE PICTURE
            Positioned(
              left: 12.0,
              top: 30.0,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
              ),
            ),

            // USER NAME
            Positioned(
              left: 70.0,
              top: 38.0,
              child: Text(userName),
            ),

            // ICON
            Positioned(
              right: 10,
              top: 25,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_horiz),
              ),
            ),
          ],
        ),

        // LIKE COMMENT AND SHARE
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
                IconButton(onPressed: () {}, icon: Icon(Icons.chat_bubble)),
                IconButton(onPressed: () {}, icon: Icon(Icons.share)),
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_outline)),
          ],
        ),

        // LIKED BY...
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              Text('Liked by '),
              Text(
                userName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(' and '),
              Text(
                'others',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),

        // CAPTION
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 4.0, bottom: 10.0),
          child: RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              children: [
                TextSpan(
                  text: userName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: ' $caption',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
