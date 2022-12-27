import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/camera.dart';

import 'feed.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool cameraOn = false;

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      "https://cdn2.thecatapi.com/images/bi.jpg",
      "https://cdn2.thecatapi.com/images/63g.jpg",
      "https://cdn2.thecatapi.com/images/a3h.jpg",
      "https://cdn2.thecatapi.com/images/a9m.jpg",
      "https://cdn2.thecatapi.com/images/aph.jpg",
      "https://cdn2.thecatapi.com/images/1rd.jpg",
      "https://cdn2.thecatapi.com/images/805.gif",
    ];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.camera,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TakePictureScreen()));
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.paperplane,
              color: Colors.black,
            ),
          ),
        ],
        title: Image.asset(
          'assets/logo.png',
          height: 32,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
          itemCount: images.length,
          itemBuilder: (context, index) {
            String image = images[index];
            return Feed(
              imageUrl: image,
            );
          }),
    );
  }
}
