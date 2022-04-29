

import 'package:flutter/cupertino.dart';

class Photo{
  int photoID = 0;
  int listingID = 0;
  String photoUrl= '';
  Image image = Image.asset('assets/images/image.jpg');
  String imagePath = '';

  Image getImage(double width, double height){
    if(photoUrl != '')
    {
      return Image.network(photoUrl, fit: BoxFit.cover,
          width: width,
          height: width);
    }else if(imagePath != '')
    {
      return Image.asset(imagePath, fit: BoxFit.cover,
          width: width,
          height: width);
    }else{
      return image;
    }
    //change the functionality so that this returns an Image instead of URL.
    //we will have the class return the image and handle logic in hear to
    //special cases of user saved files. we can save images in cache and leave URL empty.

  }
  //Photo(this.photoID, this.listingID, this.photoUrl);
  Photo({required this.photoID, required this.listingID, this.photoUrl = '', this.imagePath = 'assets/images/image.jpg'});
}