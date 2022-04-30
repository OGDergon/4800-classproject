import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

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

          Row(
            children:  [
              Expanded(
                flex: 20,
                child: Padding(
                  padding: EdgeInsets.all(padding),
                  child: const Text(
                      'Location'
                  ),
                ),
              ),
              Expanded(
                flex: 80,
                child: Padding(
                  padding: EdgeInsets.only(right: padding),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    /*children: [
                      Padding(padding: EdgeInsets.all(padding),
                        child: Icon((Icons.attach_money)),
                      ),
                      Padding(padding: EdgeInsets.all(padding),
                        child: const TextField(
                          decoration: InputDecoration.collapsed(hintText: 'Asking price...'),
                          onChanged: null,
                        ),
                      ),
                    ],*/
                  ),
                ),
              ),
            ],
          ),

          Padding(padding: EdgeInsets.all(padding*6)),

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