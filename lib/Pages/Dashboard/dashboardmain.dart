import 'package:cs4800_classproject/Classes/listingentry.dart';
import 'package:cs4800_classproject/Classes/photo.dart';
import 'package:cs4800_classproject/Database/database.dart';
import 'package:cs4800_classproject/Pages/Dashboard/dashboardtrending.dart';
import 'package:cs4800_classproject/Pages/Dashboard/dashboardyourlistings.dart';
import 'package:cs4800_classproject/Pages/Profile/profilemain.dart';
import 'package:cs4800_classproject/Pages/Sell/sellmain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:substring_highlight/substring_highlight.dart';

import '../../Classes/user.dart';
import '../Listing/listingmain.dart';
import '../Login/loginmain.dart';

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

  @override
  Widget build(BuildContext context) {
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
              const Expanded(
                child: TextButton(onPressed: null, child: Text(
                  'All',
                  style: TextStyle(
                  ),
                ),),
              ),
              Expanded(
                child: TextButton(onPressed: (){
                  Navigator.pushReplacement(context,
                      PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) => DashboardTrending(user: widget.user),
                          transitionDuration: const Duration(seconds: 0)));
                }, child: const Text(
                    'Your Purchases',
                  style: TextStyle(
                    color: Colors.black
                  ),
                )),
              ),
              Expanded(
                child: TextButton(onPressed: (){
                  Navigator.pushReplacement(context,
                      PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) => DashboardListing(user: widget.user),
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
            child: searchlists.isEmpty ? Center(child: Text("No results found.")): ListView.builder(
              physics: const BouncingScrollPhysics(),
                          itemCount: searchlists.length,
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
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => Listing(listing: searchlists[index], user: widget.user,)),);
                                          },
                                          child: Row(
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(6.0),
                                                child: getPhoto(searchlists[index].listingID).first.getImage(width*.4, width*.4),
                                                ),
                                              Flexible(
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 16.0),
                                                  child: searchlists[index].buyerID !=-1 ? Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                    Text(searchlists[index].title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                                    Text("SOLD", style: TextStyle(fontSize: 18, color: Colors.red,),),
                                                    Text(searchlists[index].description,
                                                      overflow: TextOverflow.ellipsis,
                                                      softWrap: true,
                                                      maxLines: 4,
                                                    )]):
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(searchlists[index].title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                                      Text(searchlists[index].price.toString()+ " ETH", style: TextStyle(fontSize: 18, color: Colors.green, fontStyle: FontStyle.italic),),
                                                      Text(searchlists[index].description,
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
                  searchlists.shuffle();
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SellPageUpload(user: thisUser,)),);
                  //below code will generate a listing for sale.
                  //addPhoto(Photo(photoID:15, listingID:15, imagePath: 'assets/images/image.jpg'));
                  //addListing(ListingEntry(15, thisUser.userId, "Added Listing", "This is my added listing", "nFTTokenNum", 1220000.0));
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
