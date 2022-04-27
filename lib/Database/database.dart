import '../Classes/listingentry.dart';
import '../Classes/photo.dart';
import '../Classes/user.dart';

User loggedInUser = User(2, 'Chris', 'male', '123 Some st, Anaheim', '123Pass', 'myCryptoAddress');
ListingEntry listing1 = ListingEntry(1, 1, "First Listing", "This is my first listing", "nFTTokenNum", 10000.0);
ListingEntry listing2 = ListingEntry(2, 1, "Second Listing", "This is my second listing", "nFTTokenNum", 20000.0);
ListingEntry listing3 = ListingEntry(3, 2, "Third Listing", "This is my third listing", "nFTTokenNum", 30000.0);

Photo photo1 = Photo(1, 1, 'https://ichef.bbci.co.uk/news/640/cpsprodpb/DBB7/production/_122074265_hi071843849.jpg');
Photo photo2 = Photo(2, 1,'https://cdn.vox-cdn.com/thumbor/2xj1ySLIz1EZ49NvSsPzq8Itjyg=/1400x1050/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23084330/bored_ape_nft_accidental_.jpg');
Photo photo3 = Photo(3, 2,'https://imageio.forbes.com/specials-images/imageserve/6170e01f8d7639b95a7f2eeb/Sotheby-s-NFT-Natively-Digital-1-2-sale-Bored-Ape-Yacht-Club--8817-by-Yuga-Labs/0x0.png?fit=bounds&format=png&width=960');
Photo photo4 = Photo(4, 2,'https://i.guim.co.uk/img/media/ef8492feb3715ed4de705727d9f513c168a8b196/37_0_1125_675/master/1125.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=d456a2af571d980d8b2985472c262b31');
Photo photo5 = Photo(5, 2,'https://www.artnews.com/wp-content/uploads/2022/01/unnamed-2.png?w=631');
Photo photo6 = Photo(6, 2,'https://www.protocol.com/media-library/bored-ape-0.png?id=27357989&width=1245&quality=85&coordinates=0%2C0%2C0%2C0&height=700');
Photo photo7 = Photo(7, 1,'https://images.lifestyleasia.com/wp-content/uploads/sites/3/2022/01/14121726/Meebits-2.jpg');
Photo photo8 = Photo(8, 3,'https://pbs.twimg.com/media/FEaFK4OWUAAlgiV?format=jpg&name=small');
Photo photo9 = Photo(9, 3,'https://cdn.vox-cdn.com/thumbor/WNIKEHie_jTHYkepdmhrRk6tqsg=/0x0:800x600/1200x800/filters:focal(336x236:464x364)/cdn.vox-cdn.com/uploads/chorus_image/image/70668585/unnamed.0.png');
Photo photo10 = Photo(10, 3,'https://miro.medium.com/max/980/1*3iesg_sr8kC6NYN2iiFHRQ.png');

List<ListingEntry> myList= [listing1,listing2,listing3];
List<Photo> photos = [photo1,photo2,photo3,photo4,photo5,photo6,photo7,photo8,photo9,photo10];

List<ListingEntry> searchListings(String searchWord){
  if(searchWord == ''){
    return myList;
  }
  List<ListingEntry> myListings = [];
  for(var i = 0; i < myList.length; ++i){
    if(myList[i].title.contains(searchWord)){
      myListings.add(myList[i]);
    }
  }
  //List<ListingEntry> myList= [listing1,listing2,listing3];
  //this class will be responsible for returning a list of Listings which will be used to simulate our Database.
  return myListings;
}
List<Photo> findPhotos(){
  return [photo1,photo2,photo3];
  //this will simulate dereferencing a listing and returning the list of photos associated with it.
}
List<Photo> getPhoto(int listingId){
  //needs logic
  List<Photo> myPhotos = [];
  for(var i = 0; i < photos.length; ++i){
    if(photos[i].listingID == listingId){
      myPhotos.add(photos[i]);
    }
  }
  return myPhotos;;
}
List<ListingEntry> addListing(ListingEntry listing){
  myList.add(listing);
  return myList;
}
List<ListingEntry> getMyListings(User me){
  List<ListingEntry> myListings = [];

  for(var i = 0; i < myList.length; ++i){
    if(myList[i].sellerID == me.userId){
      myListings.add(myList[i]);
    }
  }
      return myListings;
}
List<Photo> addPhoto(Photo photo){
  photos.add(photo);
  return photos;
}