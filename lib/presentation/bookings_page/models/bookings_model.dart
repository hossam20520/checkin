import 'package:get/get.dart';
import 'bookings_item_model.dart';

/// This class defines the variables used in the [bookings_page],
/// and is typically used to hold data that is passed between different parts of the application.
class BookingsModel {
  Rx<List<BookingsItemModel>> bookingsItemList =
      Rx([]);
}
