class Order {

  Order({
    required int orderId,
    required int buyerId,
    required int listingID,
    required double price,
    required DateTime orderDate,
    required String paymentType,
    required String orderStatus,
    required String orderType
  });


  int orderId = 0; //PK
  int buyerId = 0; //FK
  int listingID = 0; //Fk
  DateTime orderDate = DateTime(0,0,0);
  String paymentType = ''; //bitcoin?
  String orderStatus = '';//what are we storing?
  String orderType = '';//what is this?

}