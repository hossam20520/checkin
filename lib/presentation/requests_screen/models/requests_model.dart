import 'package:get/get.dart';
import 'RequestRoom.dart';
import 'requests_item_model.dart';

/// This class defines the variables used in the [requests_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class RequestsModel {
  Rx<List<RequestsItemModel>> requestsItemList =
      Rx([]);
  Rx<RequestRoom> reqeustRoom = Rx(new RequestRoom());
}
