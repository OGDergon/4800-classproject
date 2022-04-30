class ListingEntry{

  ListingEntry(
      this.listingID,
      this.sellerID,
      this.title,
      this.description,
      this.nFTToken,
      this.price,
);
  int listingID = 0;
  int sellerID = 0;
  int buyerID = -1;
  String title = '';
  String description = '';
  String nFTToken = '';
  double price = 0.0;
  //used to hide listings from searches prior to creation
  //maybe even after sells
  bool visible = false;

  void assignBuyer(int buyerID){
    this.buyerID = buyerID;
  }
}
