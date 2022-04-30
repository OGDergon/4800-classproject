import 'package:cs4800_classproject/Pages/Sell/sellprice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

class SellPageDescription extends StatefulWidget {
  const SellPageDescription({Key? key}) : super(key: key);

  @override
  _SellPageDescriptionState createState() => _SellPageDescriptionState();
}

class _SellPageDescriptionState extends State<SellPageDescription> {

  @override
  Widget build(BuildContext context) {

    String dropdownValue = 'Example 1';

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
              "Description",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),

          Row(
            children: [
                Padding(padding: EdgeInsets.all(padding),
                  child: const Text(
                      'Listing Name'
                  ),
                ),
                Padding(padding: sidePadding/10,
                  child: Container(
                    height: 40,
                    width: width - 140,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),),
                  ),
                ),
            ],
          ),

          Row(
            children: [
              Padding(padding: EdgeInsets.all(padding),
                child: const Text(
                    'Listing Desc'
                ),
              ),
              Padding(padding: sidePadding/2,
                child: Container(
                  height: padding*20,
                  width: width - 140,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),),
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(right: padding),
                child: Text(
                    'Tags'
                ),
              ),
              Padding(padding: sidePadding/10,
                child: DropdownButton<String>(
                  value: dropdownValue,
                  items: <String>['Example 1', 'Example 2', 'Example 3'].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                ),
              ),
            ],
          ),
          Container(
            height: padding*2,
          ),
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
                      fontWeight: FontWeight.bold,
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
                      color: Colors.blue
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SellPagePrice()),
                    );
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