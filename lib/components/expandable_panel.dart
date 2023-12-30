import 'dart:convert';
import 'package:expandable/expandable.dart';
import 'package:fitnessapp/screens/video_description.dart';
import 'package:fitnessapp/utilities/constants.dart';
import 'package:flutter/material.dart';
import '../services/rest_api_service.dart';
import '../services/use_disk_space.dart';
import '../utilities/constants.dart';

class ExpandableWidget extends StatelessWidget {
  final int dayx;
  static Map subscription;
  final List<String> excercises = [];
  final List<String> warmups = [];
  ExpandableWidget({this.dayx});

  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      header: Container(
        height: 50,
        color: Colors.white38,
        margin: EdgeInsets.all(3),
        child: Center(
          child: Text(
            "Day " + dayx.toString(),
            style: TextStyle(fontSize: 30, fontFamily: kGoogleFontFamily),
          ),
        ),
      ),
      expanded: Container(
        child: Column(
          children: [
            Container(
              child: Text("Warm Ups"),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                ),
              ),
            ),
            ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: countWarmups(),
              itemBuilder: (BuildContext ctxt, int index) {
                return GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: kBrandColor),
                      color: Colors.white24,
                    ),
                    child: Center(
                      child: Text(
                        warmups[index],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 5),
            Container(
              child: Text("Excercises"),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                ),
              ),
            ),
            SizedBox(height: 5),
            ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: countExcercises(),
              itemBuilder: (BuildContext ctxt, int index) {
                return GestureDetector(
                  onTap: () async {
                    final subcriptionId = subscription['subscriptionId'];
                    final token = await UseDisk.readData('token');
                    String contentCode = '';
                    for (var item in subscription['content']) {
                      if (item['shortDesc'] == excercises[index]) {
                        contentCode = item["contentCode"];
                      }
                    }
                    final body = {
                      'subscriptionId': subcriptionId,
                      'token': token,
                      'contentCode': contentCode
                    };
                    final videoUrl =
                        await RestAPIService.makePostRequest(body, '/videoUrl');
                    final url = jsonDecode(videoUrl.body)["url"];
                    print(url);
                    UseDisk.writeData("videoUrl", url);
                    Navigator.pushNamed(context, VideoDescription.id);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Image(image: AssetImage("images/thumb.png")),
                        SizedBox(width: 10),
                        Text(
                          excercises[index],
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
      tapHeaderToExpand: true,
      hasIcon: true,
      iconColor: kBrandColor,
      tapBodyToCollapse: true,
    );
  }

  int countWarmups() {
    int count = 0;
    for (var item in subscription["content"]) {
      if (item["type"] == "warm" && item["day"] == dayx) {
        count++;
        warmups.add(item["shortDesc"]);
      }
    }
    return count;
  }

  int countExcercises() {
    int count = 0;
    for (var item in subscription["content"]) {
      if (item["type"] == "exrc" && item["day"] == dayx) {
        count++;
        excercises.add(item["shortDesc"]);
      }
    }
    return count;
  }
}
