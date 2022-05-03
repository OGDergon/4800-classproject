import 'package:cs4800_classproject/Pages/Sell/selldescription.dart';
import 'package:cs4800_classproject/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

import '../../Classes/photo.dart';

class SellPageUpload extends StatefulWidget {
  const SellPageUpload({Key? key}) : super(key: key);

  @override
  _SellPageUploadState createState() => _SellPageUploadState();
}

class _SellPageUploadState extends State<SellPageUpload> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    List<Photo> photos;
    int incriment = 0;
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
              "Upload Picture",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold
              ),
            ),),
          Padding(padding: EdgeInsets.all(padding),
            child: const Text(
              "Upload Existing Image",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
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
                            hintText: 'Filename...'
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                  flex: 0,
                  child: Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Icon((Icons.upload_file_rounded),),
                  ),
                ),
                ],
              ),
              ),
            ),
          Padding(
            padding: EdgeInsets.all(padding),
            child: const Text(
              "Or",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Padding(
            padding: sidePadding,
            child: const Text(
              "Take New Photo",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: padding, bottom: padding/2),
            child: IconButton(
              onPressed: (){

              },
              iconSize: width/10,
              color: Colors.blue,
              icon: const Icon(Icons.add_a_photo),
            ),
          ),
          Expanded(
            flex: 90,
            child: Padding(
              padding: EdgeInsets.only(top: padding, left: padding, right: padding),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        width: width * .2,
                        height: width * .2,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6.0),
                          child: Image.network(
                            'assets/images/amoogus.jpg',
                            fit: BoxFit.cover,
                            width: width * .2,
                            height: width * .2,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        width: width * .2,
                        height: width * .2,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6.0),
                          child: Image.network(
                            'assets/images/amoogus.jpg',
                            fit: BoxFit.cover,
                            width: width * .2,
                            height: width * .2,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        width: width * .2,
                        height: width * .2,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6.0),
                          child: Image.network(
                            'assets/images/amoogus.jpg',
                            fit: BoxFit.cover,
                            width: width * .2,
                            height: width * .2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        width: width * .2,
                        height: width * .2,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6.0),
                          child: Image.network(
                            'assets/images/amoogus.jpg',
                            fit: BoxFit.cover,
                            width: width * .2,
                            height: width * .2,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        width: width * .2,
                        height: width * .2,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6.0),
                          child: Image.network(
                            'assets/images/amoogus.jpg',
                            fit: BoxFit.cover,
                            width: width * .2,
                            height: width * .2,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        width: width * .2,
                        height: width * .2,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6.0),
                          child: Image.network(
                            'assets/images/amoogus.jpg',
                            fit: BoxFit.cover,
                            width: width * .2,
                            height: width * .2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
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
                      fontWeight: FontWeight.bold,
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
                    color: Colors.blue
                  ),
                ),
              ),Padding(padding: EdgeInsets.all(0),
                child: Container(
                  height: 20,
                  width: width/6,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),),
                ),
              ),Padding(padding: EdgeInsets.all(0),
                child: Container(
                  height: 20,
                  width: width/6,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),),
                ),
              ),Padding(padding: EdgeInsets.all(0),
                child: Container(
                  height: 20,
                  width: width/6,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MyHomePage(title: '',)),
                      );
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
                      MaterialPageRoute(builder: (context) => const SellPageDescription()),
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
