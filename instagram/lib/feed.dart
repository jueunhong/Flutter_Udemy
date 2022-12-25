import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Feed extends StatelessWidget {
  const Feed({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'assets/feed.png',
          height: 400,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.paperplane,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.heart,
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
            '10 likes',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        //설명
        Padding(
          padding: EdgeInsets.all(8),
          child: Text('DeliverBle designer Joon Young Kim made it.'),
        ),
        //날짜
        Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            'December 1224',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
