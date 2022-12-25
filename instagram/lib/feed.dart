import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  const Feed({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  //좋아요 여부
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          widget.imageUrl,
          height: 400,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              icon: Icon(
                CupertinoIcons.heart,
                color: isFavorite ? Colors.pink : Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.chat_bubble,
                color: Colors.black,
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.bookmark,
                color: Colors.black,
              ),
            ),
          ],
        ),
        //좋아요
        Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            isFavorite ? '100 likes' : '99 likes',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        //설명
        Padding(
          padding: EdgeInsets.all(8),
          child: Text(
              'Cat is adorable animal. So cute even he/she does something mean.'),
        ),
        //날짜
        Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            'December 12.24',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
