import 'package:cs4800_classproject/Classes/listingentry.dart';
import 'package:cs4800_classproject/Classes/photo.dart';
import 'package:cs4800_classproject/Database/database.dart';
import 'package:cs4800_classproject/Pages/Dashboard/dashboardtrending.dart';
import 'package:cs4800_classproject/Pages/Dashboard/dashboardyourlistings.dart';
import 'package:cs4800_classproject/Pages/Profile/profilemain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:substring_highlight/substring_highlight.dart';

import '../../Classes/user.dart';
import '../Listing/listingmain.dart';

//Our local list of values that only persist during run time.
//This will not persist if app is closed.
//List<Photo> photos = findPhotos();

class DashboardMain extends StatefulWidget {
  const DashboardMain({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  _DashboardMainState createState() => _DashboardMainState();
}
List<ListingEntry> searchlists = searchListings('');
class _DashboardMainState extends State<DashboardMain> {
  static const itemCount = 3;

  @override

  Widget build(BuildContext context) {

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    double width = MediaQuery.of(context).size.width;
    double padding = 16;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return Scaffold(
      resizeToAvoidBottomInset: false,
    body: Column(
      children: [
        Padding(padding: EdgeInsets.all(padding),
        child: const Text(
          "Dashboard",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold
          ),
        ),),
        Padding(padding: sidePadding,
        child: Container(
          height: 40,
            decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8),),
          child: Row(
            children: [
              Expanded(
                flex: 10,
                child: Icon(Icons.search)),
              Expanded(
                flex: 90,
                child: TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: 'Search...'
                  ),
                    onChanged: (String text){
                    searchlists = searchListings(text);
                    }
                ),
              ),
            ],
          ),
        )),
        Padding(padding: sidePadding,
        child:
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TextButton(onPressed: null, child: const Text(
                  'All',
                  style: TextStyle(
                    color: Colors.blue
                  ),
                ),),
              ),
              Expanded(
                child: TextButton(onPressed: (){
                  Navigator.pushReplacement(context,
                      PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) => DashboardTrending(),
                          transitionDuration: Duration(seconds: 0)));
                }, child: Text(
                    'Trending',
                  style: TextStyle(
                    color: Colors.black
                  ),
                )),
              ),
              Expanded(
                child: TextButton(onPressed: (){
                  Navigator.pushReplacement(context,
                      PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) => DashboardListing(),
                          transitionDuration: Duration(seconds: 0)));
                }, child: Text(
                    'Your Listings',
                    style: TextStyle(
                    color: Colors.black
                ),
                )),
              )
            ],
          ),
        ),
      Expanded(
        flex: 60,
        child: ListView.builder(
                      itemCount: searchlists.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Listing(listing: searchlists[index],)),);
                                    },
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(6.0),
                                          child: Image.network(getPhoto(searchlists[index].listingID).first.photoUrl,fit: BoxFit.cover,
                                            width: width * .4,
                                            height: width * .4,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 16.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(searchlists[index].title),
                                              Text(searchlists[index].price.toString()),
                                              Text(searchlists[index].description)
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                        );
                      }
                    ),
      ),
        Expanded(
          flex: 6,
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: IconButton(onPressed: null, icon: const Icon(Icons.home)),
            ),
            Expanded(
              child: IconButton(onPressed: (){
                setState(() {
                  addPhoto(Photo(15, 15, 'https://www.nrn.com/sites/nrn.com/files/styles/article_featured_retina/public/chefpizza_0.jpg?itok=0lJB0GeU'));
                  addListing(ListingEntry(15, 1, "Added Listing", "This is my added listing", "nFTTokenNum", 1220000.0));
                });
                print(photos.length);
              }, icon: const Icon(Icons.add_photo_alternate)),
            ),
            Expanded(
              child: IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileMain(user: loggedInUser,),));
              },
                  icon: const Icon(Icons.person)),
            ),
          ],
        ))
      ]
    ),
    );
  }
}
