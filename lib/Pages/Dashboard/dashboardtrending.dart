import 'package:cs4800_classproject/Pages/Dashboard/dashboardmain.dart';
import 'package:cs4800_classproject/Pages/Dashboard/dashboardyourlistings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Listing/listingmain.dart';


class DashboardTrending extends StatefulWidget {
  const DashboardTrending({Key? key}) : super(key: key);
  @override
  _DashboardTrendingState createState() => _DashboardTrendingState();
}

class _DashboardTrendingState extends State<DashboardTrending> {

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
                    child: TextButton(onPressed: (){
                      Navigator.pushReplacement(context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) => DashboardMain(),
                            transitionDuration: Duration(seconds: 0)));
                    }, child: const Text(
                      'All',
                      style: TextStyle(
                          color: Colors.black
                      ),
                    ),),
                  ),
                  Expanded(
                    child: TextButton(onPressed: null, child: Text(
                      'Trending',
                      style: TextStyle(
                          color: Colors.blue
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
                                child: Image.asset('assets/images/image.jpg',fit: BoxFit.cover,
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
                                child: Image.asset('assets/images/image.jpg',fit: BoxFit.cover,
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
                              child: Image.asset('assets/images/image.jpg',fit: BoxFit.cover,
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
                      child: IconButton(onPressed: null,
                          icon: const Icon(Icons.home)),
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
