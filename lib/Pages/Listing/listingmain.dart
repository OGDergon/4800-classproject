import 'package:flutter/material.dart';

import '../Dashboard/dashboardmain.dart';

class Listing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                          child: Image.asset('assets/images/image.jpg'))),
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
                              Navigator.pop(context, MaterialPageRoute(builder: (context) => DashboardMain()));
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
