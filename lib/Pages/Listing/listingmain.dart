import 'dart:ui';
import 'dart:ui';

import 'package:cs4800_classproject/Classes/listingentry.dart';
import 'package:cs4800_classproject/Database/database.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../Classes/photo.dart';
import '../../Classes/user.dart';
import '../Dashboard/dashboardmain.dart';

// void main() => runApp(Listing());

class Listing extends StatefulWidget {
  const Listing({Key? key, required this.listing, required this.user}) : super(key: key);
  final User user;
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

    double padding = 16;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    final verticalPadding = EdgeInsets.symmetric(vertical: padding);
    final allPadding =
        EdgeInsets.symmetric(vertical: padding, horizontal: padding);
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            title: Text(widget.listing.title,
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold
              ),),

          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  flex: 90,
                  child: Column(children: [
                    Container(
                        child: CarouselSlider(
                      options: CarouselOptions(),
                      items: photo
                          .map((item) => Container(
                                child: Center(
                                    child: item.getImage(width*.8,width*.8)),
                              )).toList(),
                    )),
                    Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: widget.listing.buyerID != -1 ?Text('Sold for '+ widget.listing.price.toString() + ' ETH', style: TextStyle(fontSize: 24, color: Colors.red, fontStyle: FontStyle.italic),) : Text(widget.listing.price.toString() + ' ETH', style: TextStyle(fontSize: 24, color: Colors.green, fontStyle: FontStyle.italic)),
                    ),
                    Container(
                      width: width,
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Description: ", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)),
                                  Padding(padding: EdgeInsets.all(8.0)),
                                  Text( widget.listing.description,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    maxLines: 18,
                          ),
                                ],
                              )
                      ),
                    ),
                    Container(
                      padding:  const EdgeInsets.only(top:8.0, bottom: 8.0),
                      child: Text(
                          "Seller: "+getSeller(widget.listing).name,style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],

                  ),

                ),
                Expanded(
                  flex:10,
                      child:((widget.listing.buyerID != -1) || (widget.user.userId == widget.listing.sellerID)) ? Text('') : TextButton(
                        child: Text('Buy',
                            style: TextStyle(fontSize: 30, color: Colors.white)),
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size.infinite),
                            shadowColor: MaterialStateProperty.all(Colors.black),
                            shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
                              return RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20));
                            }),
                            backgroundColor: MaterialStateProperty.all(Colors.blue)),
                        onPressed: () {
                          buyListing(widget.listing,widget.user);
                          Navigator.of(context).pop();

                        },
                      ),
                ),
              ],
            ),
          )
    );
  }
}
