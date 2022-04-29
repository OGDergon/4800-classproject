import 'package:cs4800_classproject/Pages/Dashboard/dashboardmain.dart';
import 'package:cs4800_classproject/Pages/Dashboard/dashboardyourlistings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Classes/listingentry.dart';
import '../../Classes/photo.dart';
import '../../Classes/user.dart';
import '../../Database/database.dart';
import '../Listing/listingmain.dart';
import '../Login/loginmain.dart';


class DashboardTrending extends StatefulWidget {
  const DashboardTrending({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  _DashboardTrendingState createState() => _DashboardTrendingState();
}

class _DashboardTrendingState extends State<DashboardTrending> {


  @override

  Widget build(BuildContext context) {
    List<ListingEntry> searchLists = getMyBuys(widget.user);
    User thisUser = widget.user;
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
                      const Expanded(
                          flex: 10,
                          child: Icon(Icons.search)),
                      Expanded(
                        flex: 90,
                        child: TextField(
                            decoration: InputDecoration.collapsed(
                                hintText: 'Search...'
                            ),
                            onChanged: (String text){
                              searchLists = searchListings(text);
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
                    child: TextButton(onPressed: (){
                      Navigator.pushReplacement(context,
                          PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) => DashboardMain(user: thisUser),
                              transitionDuration: const Duration(seconds: 0)));
                    }, child: Text(
                      'All',
                      style: TextStyle(
                          color: Colors.black
                      ),
                    ),),
                  ),
                  Expanded(
                    child: TextButton(onPressed: null, child: const Text(
                      'Your Purchases',
                      style: TextStyle(
                      ),
                    )),
                  ),
                  Expanded(
                    child: TextButton(onPressed: (){
                      Navigator.pushReplacement(context,
                          PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) => DashboardListing(user: thisUser),
                              transitionDuration: Duration(seconds: 0)));
                    }, child: const Text(
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
              child: Container(
                color: Colors.grey[100],
                child: RefreshIndicator(
                  child: searchLists.isEmpty ? Center(child: Text("No results found.")):ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: searchLists.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(.5),
                                    blurRadius: 8.0,
                                    spreadRadius: 2.0,
                                    offset: Offset(2,7)
                                ),],
                            ),
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Listing(listing: searchLists[index],)),);
                              },
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(6.0),
                                    child: getPhoto(searchLists[index].listingID).first.getImage(width*.4, width*.4),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 16.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(searchLists[index].title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                          Text(searchLists[index].price.toString()+ " ETH", style: TextStyle(fontSize: 18, color: Colors.green, fontStyle: FontStyle.italic),),
                                          Text(searchLists[index].description,
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: true,
                                            maxLines: 4,
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                  ),
                  onRefresh: (){
                    return Future.delayed(const Duration(milliseconds: 500),(){
                      setState(() {
                        //nothing
                        searchLists.shuffle();
                      });
                    });

                  },

                ),
              ),
            ),
            Expanded(
                flex: 6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: IconButton(onPressed: null, icon: Icon(Icons.home)),
                    ),
                    Expanded(
                      child: IconButton(onPressed: (){
                        setState(() {
                          addPhoto(Photo(photoID:15, listingID:15, imagePath: 'assets/images/image.jpg'));
                          addListing(ListingEntry(15, thisUser.userId, "Added Listing", "This is my added listing", "nFTTokenNum", 1220000.0));
                        });

                      }, icon: const Icon(Icons.add_photo_alternate)),
                    ),
                    Expanded(
                      child: IconButton(onPressed: () {
                        Navigator.pop(context, MaterialPageRoute(builder: (context) => LoginMain()));
                      }, icon: const Icon(Icons.person)),
                    ),
                  ],
                ))
          ]
      ),
    );
  }
}
