import 'package:cs4800_classproject/Pages/Sell/selllocation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

import '../../main.dart';

class SellPagePrice extends StatefulWidget {
  const SellPagePrice({Key? key}) : super(key: key);

  @override
  _SellPagePriceState createState() => _SellPagePriceState();
}

class _SellPagePriceState extends State<SellPagePrice> {

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
        title: Text('Price'),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [

          Expanded(
            child: Padding(padding: sidePadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  TextField (
                    decoration: InputDecoration(
                      hintText: 'Price...'
                    ),
                  ),
                ],
              ),
            ),
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
                        showDialog(context: context, builder: (_) => AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          title: const Text('Your listing is ready to be created'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: const [
                                Text('Are you ready to list')
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(onPressed: (){
                              //final listing creation here

                              Navigator.of(context).pop();
                            }, child: const Text('List Item')),
                            TextButton(onPressed: (){
                              Navigator.of(context).pop();
                            }, child: const Text('Cancel')),
                          ],
                        ));
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