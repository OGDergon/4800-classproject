import 'package:cs4800_classproject/Classes/listingentry.dart';
import 'package:cs4800_classproject/Pages/Dashboard/dashboardmain.dart';
import 'package:cs4800_classproject/Pages/Dashboard/dashboardtrending.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Classes/photo.dart';
import '../../Classes/user.dart';
import '../../Database/database.dart';
import '../Listing/listingmain.dart';
import '../Login/loginmain.dart';
import '../Profile/profilemain.dart';


class DashboardListing extends StatefulWidget {
  const DashboardListing({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  _DashboardListingState createState() => _DashboardListingState();
}

class _DashboardListingState extends State<DashboardListing> {

  static const itemCount = 3;

  @override

  Widget build(BuildContext context) {
    List<ListingEntry> searchLists = getMyListings(widget.user);
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
                    child: TextButton(onPressed: (){
                      Navigator.pushReplacement(context,
                          PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) => DashboardTrending(user: widget.user,),
                              transitionDuration: const Duration(seconds: 0)));
                    }, child: const Text(
                      'Your Purchases',
                      style: TextStyle(
                          color: Colors.black
                      ),
                    )),
                  ),
                  Expanded(
                    child: TextButton(onPressed: null, child: const Text(
                      'Your Listings',
                      style: TextStyle(
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
                  child: searchLists.isEmpty ? Center(child: Text("No results found.")): ListView.builder(
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Listing(listing: searchLists[index], user: widget.user,)),);
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
                                      child:searchLists[index].buyerID!=-1?Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(searchLists[index].title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                          Text("Sold for " + searchLists[index].price.toString()+ " ETH", style: TextStyle(fontSize: 18, color: Colors.red, fontStyle: FontStyle.italic),),
                                          Text(searchLists[index].description,
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: true,
                                            maxLines: 4,
                                          )
                                        ],
                                      ): Column(
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileMain(user: widget.user,)),);
                      }, icon: const Icon(Icons.person)),
                    ),
                  ],
                ))
          ]
      ),
    );
  }
}
