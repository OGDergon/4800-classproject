class ListingEntry{

  ListingEntry({
    required int listingID,
    required int sellerID,
    required String title,
    required String description,
    required String nFTToken,
    required double price,
});
  int listingID = 0;
  int sellerID = 0;
  String title = '';
  String description = '';
  String nFTToken = '';
  double price = 0.0;
}
