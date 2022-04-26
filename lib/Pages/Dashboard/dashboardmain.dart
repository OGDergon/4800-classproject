import 'package:cs4800_classproject/Classes/listingentry.dart';
import 'package:cs4800_classproject/Classes/photo.dart';
import 'package:cs4800_classproject/Pages/Dashboard/dashboardtrending.dart';
import 'package:cs4800_classproject/Pages/Dashboard/dashboardyourlistings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Listing/listingmain.dart';


class DashboardMain extends StatefulWidget {
  const DashboardMain({Key? key}) : super(key: key);
  @override
  _DashboardMainState createState() => _DashboardMainState();
}

class _DashboardMainState extends State<DashboardMain> {

  static const itemCount = 3;

  @override

  Widget build(BuildContext context) {

    ListingEntry listing1 = ListingEntry(listingID: 1, sellerID: 1, title: "First Listing", description: "This is my first listing", nFTToken: "nFTTokenNum", price: 10000.0);
    Photo photo1 = Photo(photoId: 1, photoUrl: 'https://ichef.bbci.co.uk/news/640/cpsprodpb/DBB7/production/_122074265_hi071843849.jpg', listingID: 1);

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
            children: const [Expanded(
                flex: 10,
                child: Icon(Icons.search)),
              Expanded(
                flex: 90,
                child: TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: 'Search...'
                  ),
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
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(0.4),
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Listing()),
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6.0),
                                    child: Image.network('https://ichef.bbci.co.uk/news/640/cpsprodpb/DBB7/production/_122074265_hi071843849.jpg',fit: BoxFit.cover,
                                      width: width * .3,
                                      height: width * .3,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(0.4),
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Listing()),
                                  );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6.0),
                                    child: Image.network('https://cdn.vox-cdn.com/thumbor/2xj1ySLIz1EZ49NvSsPzq8Itjyg=/1400x1050/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23084330/bored_ape_nft_accidental_.jpg',fit: BoxFit.cover,
                                      width: width * .3,
                                      height: width * .3,
                                    ),
                                    ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(0.4),
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Listing()),
                                    );
                                  }
                                  ,child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6.0),
                                    child: Image.network('https://i.guim.co.uk/img/media/ef8492feb3715ed4de705727d9f513c168a8b196/37_0_1125_675/master/1125.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=d456a2af571d980d8b2985472c262b31',fit: BoxFit.cover,
                                      width: width * .3,
                                      height: width * .3,
                                    ),
                                  ),
                                ),
                              ),
                            ],
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

              }, icon: const Icon(Icons.add_photo_alternate)),
            ),
            Expanded(
              child: IconButton(onPressed: (){

              }, icon: const Icon(Icons.person)),
            ),
          ],
        ))
      ]
    ),
    );
  }
}
