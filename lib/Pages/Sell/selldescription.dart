import 'package:cs4800_classproject/Pages/Sell/sellprice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

import '../../main.dart';

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
        title: Text('Description'),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [

          Padding(
            padding: EdgeInsets.all(padding),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Listing name...'
              ),
            ),
          ),

          Expanded(
            child: Padding(padding: sidePadding,
              child: Container(
                height: padding*20,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8),),

                  child: const Expanded(
                    flex: 10,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.0, top: 8.0),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 20,
                        textAlignVertical: TextAlignVertical.top,
                        decoration: InputDecoration.collapsed(
                            hintText: 'Description...'
                        ),
                      ),
                    ),
                  ),
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(right: padding),
                child: const Text(
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
              Padding(padding: sidePadding/4,
                child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {

                  },
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: padding*6.25),
          ),
          Column(
            children: [
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
                            fontWeight: FontWeight.bold
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SellPagePrice())
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
        ],
      ),
    );
  }
}