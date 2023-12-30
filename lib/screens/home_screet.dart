import 'dart:convert';
import 'dart:io';
import 'package:fitnessapp/components/expandable_panel.dart';
import 'package:fitnessapp/services/use_disk_space.dart';
import 'package:fitnessapp/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';

import '../components/expandable_panel.dart';

class HomeScreen extends StatefulWidget {
  static const id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File _image;
  final picker = ImagePicker();
  Map subscription;
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  Widget buildContainer(Map subscription) {
    ExpandableWidget.subscription = subscription;
    if (subscription['days'] == 5) {
      return Container(
        child: ListView(
          children: [
            ExpandableWidget(dayx: 1),
            SizedBox(height: 20),
            ExpandableWidget(dayx: 2),
            SizedBox(height: 20),
            ExpandableWidget(dayx: 3),
            SizedBox(height: 20),
            ExpandableWidget(dayx: 4),
            SizedBox(height: 20),
            ExpandableWidget(dayx: 5)
          ],
        ),
      );
    } else if (subscription['days'] == 4) {
      return Container(
        child: Column(
          children: [
            ExpandableWidget(dayx: 1),
            SizedBox(height: 20),
            ExpandableWidget(dayx: 2),
            SizedBox(height: 20),
            ExpandableWidget(dayx: 3),
            SizedBox(height: 20),
            ExpandableWidget(dayx: 4)
          ],
        ),
      );
    } else if (subscription['days'] == 3) {
      return Container(
        child: Column(
          children: [
            ExpandableWidget(dayx: 1),
            SizedBox(height: 20),
            ExpandableWidget(dayx: 2),
            SizedBox(height: 20),
            ExpandableWidget(dayx: 3)
          ],
        ),
      );
    } else {
      return Container(
        child: Column(
          children: [
            ExpandableWidget(dayx: 1),
            SizedBox(height: 20),
            ExpandableWidget(dayx: 2)
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBrandColor,
        title: Text(
          "SayesFit",
          style: TextStyle(
              fontFamily: kGoogleFontFamily,
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
      ),
      drawer: SafeArea(
        child: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
                color: kScaffoldBackgroundColor,
                child: InkWell(
                  onTap: getImage,
                  child: CircleAvatar(
                    radius: 40.0,
                    child: ClipOval(
                      child: (_image != null)
                          ? Image.file(_image)
                          : Image.asset('images/newlogo.png'),
                    ),
                    backgroundColor: kScaffoldBackgroundColor,
                  ),
                )),
            Container(
              color: kScaffoldBackgroundColor,
              child: Divider(
                color: kBrandColor,
              ),
            ),
            Container(
              color: kScaffoldBackgroundColor,
              child: ListTile(
                leading: Icon(Icons.pie_chart),
                title: Text(
                  "Change Plan",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: kGoogleFontFamily,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              color: kScaffoldBackgroundColor,
              child: Divider(
                color: kBrandColor,
              ),
            ),
            Container(
              color: kScaffoldBackgroundColor,
              child: ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text(
                  "Log Out",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: kGoogleFontFamily,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        )),
      ),
      body: FutureBuilder(
        future: UseDisk.readData("subscription"),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            subscription = jsonDecode(snapshot.data);
            ExpandableWidget.subscription = subscription;
            return buildContainer(subscription);
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
