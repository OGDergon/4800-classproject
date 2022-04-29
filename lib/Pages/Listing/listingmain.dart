import 'package:cs4800_classproject/Classes/listingentry.dart';
import 'package:cs4800_classproject/Database/database.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../Classes/photo.dart';
import '../Dashboard/dashboardmain.dart';

// void main() => runApp(Listing());

class Listing extends StatefulWidget {
  const Listing({Key? key, required this.listing}) : super(key: key);
  final ListingEntry listing;

  @override
  _ListingState createState() => _ListingState();
}

class _ListingState extends State<Listing> {
  //const ListingState({Key? key, required this.listing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ListingEntry mylisting = widget.listing;
    List<Photo> photo = getPhoto(mylisting.listingID);
    // Photo photo2 = getPhoto(mylisting.listingID).second;
    // Photo photo3 = getPhoto(mylisting.listingID).third;
    // print(photo.getPhoto());
    // print("after photo");
    // List<String> imgList = ['', '', ''];

    // for (var foto in photo) {
    //   imgList.add(new Text(foto.getPhoto));
    // }
    // final List<String> imgList = [
    //   'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    //   'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    //   'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    //   'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    //   'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    //   'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
    // ];
    // print(photo.getPhoto());
    double padding = 16;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    final verticalPadding = EdgeInsets.symmetric(vertical: padding);
    final allPadding =
        EdgeInsets.symmetric(vertical: padding, horizontal: padding);
    double width = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              SafeArea(
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashboardMain(
                                        user: loggedInUser,
                                      )));
                        },
                        icon: const Icon(Icons.arrow_back)),
                    Padding(
                      padding: allPadding,
                      child: Text('Listing',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30)),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 90,
                child: Column(children: [
                  Container(
                      child: CarouselSlider(
                    options: CarouselOptions(),
                    items: photo
                        .map((item) => Container(
                              child: Center(
                                  child: Image.network(item.getPhoto(),
                                      fit: BoxFit.cover, width: 1000)),
                            ))
                        .toList(),
                  )),

                  // Container(
                  //     height: 250.0,
                  //     width: 500.0,
                  //     margin: EdgeInsets.all(20.0),
                  //     color: Colors.white,
                  //     child: Image.network(photo.photoUrl, fit: BoxFit.cover)),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Padding(
                  //       padding: const EdgeInsets.all(2.0),
                  //       child: ClipRRect(
                  //         borderRadius: BorderRadius.circular(6.0),
                  //         child: Image.asset(
                  //           'assets/images/image.jpg',
                  //           fit: BoxFit.cover,
                  //           width: width * .3,
                  //           height: width * .3,
                  //         ),
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: const EdgeInsets.all(2.0),
                  //       child: ClipRRect(
                  //         borderRadius: BorderRadius.circular(6.0),
                  //         child: Image.asset(
                  //           'assets/images/image.jpg',
                  //           fit: BoxFit.cover,
                  //           width: width * .3,
                  //           height: width * .3,
                  //         ),
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: const EdgeInsets.all(2.0),
                  //       child: ClipRRect(
                  //         borderRadius: BorderRadius.circular(6.0),
                  //         child: Image.asset(
                  //           'assets/images/image.jpg',
                  //           fit: BoxFit.cover,
                  //           width: width * .3,
                  //           height: width * .3,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 110.0),
                    child: Row(
                      children: [
                        Text('Price', style: TextStyle(fontSize: 24)),
                        Text(new String.fromCharCodes(new Runes('\u0024')),
                            style: TextStyle(fontSize: 24)),
                        Text(' 10000', style: TextStyle(fontSize: 24))
                      ],
                    ),
                  ),

                  // Container(
                  //   child: ListView.builder(
                  //       itemCount: 1,
                  //       itemBuilder: (context, index) {
                  //         return Padding(
                  //           padding: const EdgeInsets.all(8.0),
                  //           child: Text('Description'),
                  //         );
                  //       }),
                  // ),

                  Container(
                    height: 100,
                    width: 350,
                    padding: const EdgeInsets.all(10.0),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(
                          'Description .............................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................'),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Container(
                        height: 50,
                        width: 350,
                        child: TextButton(
                          child: Text('Buy',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white)),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue)),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              Expanded(
                  flex: 6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DashboardMain(
                                            user: loggedInUser,
                                          )));
                            },
                            icon: const Icon(Icons.home)),
                      ),
                      Expanded(
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.add_photo_alternate)),
                      ),
                      Expanded(
                        child: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.person)),
                      ),
                    ],
                  ))
            ],
          )),
    );
  }
}
