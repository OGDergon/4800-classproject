import 'package:cs4800_classproject/Classes/listingentry.dart';
import 'package:cs4800_classproject/Database/database.dart';
import 'package:flutter/material.dart';

import '../../Classes/photo.dart';
import '../Dashboard/dashboardmain.dart';
import '../Profile/profilemain.dart';

class Listing extends StatelessWidget {
  const Listing({Key? key, required this.listing}) : super(key: key);
  final ListingEntry listing;
  @override
  Widget build(BuildContext context) {
    Photo photo = getPhoto(listing.listingID).first;
    print(photo.getPhoto());
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
              Padding(
                padding: allPadding,
                child: Text('Listing',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30)),
              ),
              Expanded(
                flex: 90,
                child: Column(children: [
                  SafeArea(
                      child: Container(
                          height: 250.0,
                          width: 500.0,
                          margin: EdgeInsets.all(20.0),
                          color: Colors.white,
                          child: Image.network(photo.photoUrl,fit: BoxFit.cover))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6.0),
                          child: Image.asset(
                            'assets/images/image.jpg',
                            fit: BoxFit.cover,
                            width: width * .3,
                            height: width * .3,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6.0),
                          child: Image.asset(
                            'assets/images/image.jpg',
                            fit: BoxFit.cover,
                            width: width * .3,
                            height: width * .3,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6.0),
                          child: Image.asset(
                            'assets/images/image.jpg',
                            fit: BoxFit.cover,
                            width: width * .3,
                            height: width * .3,
                          ),
                        ),
                      ),
                    ],
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
                              Navigator.pop(context, MaterialPageRoute(builder: (context) => DashboardMain(user: loggedInUser,)));
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
                            onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileMain(),));
                              }, icon: const Icon(Icons.person)),
                      ),
                    ],
                  ))
            ],
          )),
    );
  }
}
