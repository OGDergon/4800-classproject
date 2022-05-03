class Photo{
  int photoID = 0;
  int listingID = 0;
  String photoUrl= '';

  String getPhoto(){
    return photoUrl;
  }
  Photo(this.photoID, this.listingID, this.photoUrl);

}