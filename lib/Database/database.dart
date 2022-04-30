import '../Classes/listingentry.dart';
import '../Classes/photo.dart';
import '../Classes/user.dart';

User loggedInUser = User(2, 'Chris', 'male', '123 Some st, Anaheim', '123Pass', 'myCryptoAddress','tomes@cpp.edu');
User otherUser = User(1, 'Patrick', 'male', '123 diamond st, Anaheim', '123', 'myCryptoAddress','pat@gmail.com');
User idiotUser = User(-1, 'Idiot', '0', '0', '0', '0','0');
ListingEntry listing1 = ListingEntry(1, 1, "First Listing", "A profession is a type of class commonly found in most RPGs and is central to the gameplay in Guild Wars. Each profession has an array of attributes and skills that help narrow a class's proficiency in order to perform a customized role that is determined by the player. The Warrior profession, for example, has access to the primary Strength attribute that increases their armor penetration with martial weapons, and is able to wear heavy armor providing the highest protection against physical damage of all professions. Elementalists, on the other hand, wear less protective armor, but can use their primary Energy Storage attribute to give them a much greater pool of energy than other professions.", "nFTTokenNum", 10000.0);
ListingEntry listing2 = ListingEntry(2, 1, "Second Listing", "This is my second listing", "nFTTokenNum", 20000.0);
ListingEntry listing3 = ListingEntry(3, 2, "Third Listing", "This asdasdasdasdasdis my third listingThis is my third listingThis is my third listingThis is my third listingThis is my third listing", "nFTTokenNum", 30000.0);

Photo photo1 = Photo(photoID: 1, listingID: 1,photoUrl: 'https://ichef.bbci.co.uk/news/640/cpsprodpb/DBB7/production/_122074265_hi071843849.jpg');
Photo photo2 = Photo(photoID:2, listingID: 1,photoUrl: 'https://cdn.vox-cdn.com/thumbor/2xj1ySLIz1EZ49NvSsPzq8Itjyg=/1400x1050/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23084330/bored_ape_nft_accidental_.jpg');
Photo photo3 = Photo(photoID:3, listingID: 2,photoUrl: 'https://imageio.forbes.com/specials-images/imageserve/6170e01f8d7639b95a7f2eeb/Sotheby-s-NFT-Natively-Digital-1-2-sale-Bored-Ape-Yacht-Club--8817-by-Yuga-Labs/0x0.png?fit=bounds&format=png&width=960');
Photo photo4 = Photo(photoID:4, listingID: 2,photoUrl: 'https://i.guim.co.uk/img/media/ef8492feb3715ed4de705727d9f513c168a8b196/37_0_1125_675/master/1125.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=d456a2af571d980d8b2985472c262b31');
Photo photo5 = Photo(photoID:5, listingID: 2,photoUrl: 'https://www.artnews.com/wp-content/uploads/2022/01/unnamed-2.png?w=631');
Photo photo6 = Photo(photoID:6, listingID: 2,photoUrl: 'https://www.protocol.com/media-library/bored-ape-0.png?id=27357989&width=1245&quality=85&coordinates=0%2C0%2C0%2C0&height=700');
Photo photo7 = Photo(photoID:7, listingID: 1,photoUrl: 'https://images.lifestyleasia.com/wp-content/uploads/sites/3/2022/01/14121726/Meebits-2.jpg');
Photo photo8 = Photo(photoID:8, listingID: 3,photoUrl: 'https://pbs.twimg.com/media/FEaFK4OWUAAlgiV?format=jpg&name=small');
Photo photo9 = Photo(photoID:9, listingID: 3,photoUrl: 'https://cdn.vox-cdn.com/thumbor/WNIKEHie_jTHYkepdmhrRk6tqsg=/0x0:800x600/1200x800/filters:focal(336x236:464x364)/cdn.vox-cdn.com/uploads/chorus_image/image/70668585/unnamed.0.png');
Photo photo10 = Photo(photoID:10, listingID: 3,photoUrl: 'https://miro.medium.com/max/980/1*3iesg_sr8kC6NYN2iiFHRQ.png');

List<ListingEntry> myList= [listing1,listing2,listing3];
List<Photo> photos = [photo1,photo2,photo3,photo4,photo5,photo6,photo7,photo8,photo9,photo10];
List<User>  users = [loggedInUser, idiotUser, otherUser];

void updateUser(User newUser){
  for(var i = 0; i < users.length; ++i){
    if(users[i].userId == newUser.userId){
      users[i].name = newUser.name;
      users[i].gender = newUser.gender;
      users[i].address = newUser.address;
      users[i].password = newUser.password;
      users[i].cryptoWalletAddress = newUser.cryptoWalletAddress;
      users[i].email = newUser.email;
      return;
    }
  }
}
List<ListingEntry> searchListings(String searchWord){
  print('searching listings');
  if(searchWord == ''){
    return myList;
  }
  List<ListingEntry> myListings = [];
  for(var i = 0; i < myList.length; ++i){
    var listingString = myList[i].title.toLowerCase();
    var searchString = searchWord.toLowerCase();
    if(listingString.contains(searchString)){
      myListings.add(myList[i]);
    }
  }
  return myListings;
}
List<Photo> findPhotos(listingID){
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
  return myPhotos;
}
List<ListingEntry> addListing(ListingEntry listing){
  myList.add(listing);
  return myList;
}
List<ListingEntry> getMyListings(User me){
  print(me.name + "is the seller");
  List<ListingEntry> myListings = [];

  for(var i = 0; i < myList.length; ++i){
    if(myList[i].sellerID == me.userId){
      myListings.add(myList[i]);
    }
  }
      return myListings;
}
int generateListingID(){
  //will do this differently to handle async calls from mult devices.
  //reserve the spot on list prior to completion so listingID isnt more than once.
  int maxID= 1;
  for(var i = 0; i < myList.length; ++i){
    if(myList[i].listingID >maxID){
      maxID = myList[i].listingID;
    }
  }
  return maxID + 1;
}

List<ListingEntry> getMyBuys(User me){
  List<ListingEntry> myListings = [];

  for(var i = 0; i < myList.length; ++i){
    if(myList[i].buyerID == me.userId){
      myListings.add(myList[i]);
    }
  }
  return myListings;
}
List<Photo> addPhoto(Photo photo){
  photos.add(photo);
  return photos;
}
User getSeller(ListingEntry listing){
  for(var i = 0; i < users.length; ++i){
    if(users[i].userId==listing.sellerID){
      return users[i];
    }
  }
  return users[0];
}
bool buyListing(ListingEntry listing,User user){
  for(var i = 0; i < myList.length; ++i){
    if(myList[i].listingID == listing.listingID){
      if(myList[i].sellerID == user.userId){
        return false;
      }else{
        myList[i].buyerID = user.userId;
        return true;
      }
    }
  }
  return false;
}
User checkPassword(String email, String pass){
  for(var i = 0; i < users.length; ++i){
    if(users[i].email == email){
      if(users[i].password == pass){
        return users[i];
      }
    }
  }
  return idiotUser; //= User(2, 'Chris', 'male', '123 Some st, Anaheim', '123Pass', 'myCryptoAddress');
}