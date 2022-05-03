import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

import '../../main.dart';
import '../Dashboard/dashboardmain.dart';

class SellPageLocation extends StatefulWidget {
  const SellPageLocation({Key? key}) : super(key: key);

  @override
  _SellPageLocationState createState() => _SellPageLocationState();
}

class _SellPageLocationState extends State<SellPageLocation> {

  @override
  Widget build(BuildContext context) {

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    double padding = 16;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    final verticalPadding = EdgeInsets.symmetric(vertical: padding);
    final allPadding =
    EdgeInsets.symmetric(vertical: padding, horizontal: padding);
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Listing'),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(padding),
            child: const Text(
              "Location",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),

          Padding(padding: EdgeInsets.all(padding*6.5)),

          Padding(padding: sidePadding,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8),),
              child: Row(
                children: const [
                  Expanded(
                    flex: 10,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: TextField(
                        decoration: InputDecoration.collapsed(
                            hintText: 'Listing location...'
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(padding: EdgeInsets.all(padding*8.25)),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.all(0),
                child: Container(
                  height: 20,
                  width: width/6,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white)
                  ),
                  child: const Text(
                    'Upload',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ),Padding(padding: EdgeInsets.all(0),
                child: Container(
                  height: 20,
                  width: width/6,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                  ),
                  child: const Text(
                    'Description',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ),Padding(padding: EdgeInsets.all(0),
                child: Container(
                  height: 20,
                  width: width/6,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                  ),
                  child: const Text(
                    'Price',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ),Padding(padding: EdgeInsets.all(0),
                child: Container(
                  height: 20,
                  width: width/6,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                  ),
                  child: const Text(
                    'Location',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.all(0),
                child: Container(
                  height: 20,
                  width: width/6,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                ),
              ),Padding(padding: EdgeInsets.all(0),
                child: Container(
                  height: 20,
                  width: width/6,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                  ),
                ),
              ),Padding(padding: EdgeInsets.all(0),
                child: Container(
                  height: 20,
                  width: width/6,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                ),
              ),Padding(padding: EdgeInsets.all(0),
                child: Container(
                  height: 20,
                  width: width/6,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                      color: Colors.blue
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(right: padding*4, bottom: padding/4),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  iconSize: width * 0.05,
                  icon: const Icon(Icons.cancel_presentation_sharp),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: padding*4, bottom: padding/4),
                child: IconButton(
                  onPressed: () {
                  },
                  iconSize: width * 0.05,
                  icon: const Icon(Icons.arrow_right_alt_outlined),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}