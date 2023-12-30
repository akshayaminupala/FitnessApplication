import 'package:fitnessapp/components/video_player_screen.dart';
import 'package:fitnessapp/services/use_disk_space.dart';
import 'package:flutter/material.dart';

class VideoDescription extends StatefulWidget {
  static const id = 'video_description';
  @override
  _VideoDescriptionState createState() => _VideoDescriptionState();
}

class _VideoDescriptionState extends State<VideoDescription> {
  String videoUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
        future: UseDisk.readData("videoUrl"),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            videoUrl = snapshot.data;
            return Column(
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VideoApp(url: videoUrl)));
                    },
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage("images/thumb-big.png"),
                      width: double.infinity,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        "data",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                )
              ],
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      )),
    );
  }
}
