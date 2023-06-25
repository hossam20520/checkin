import 'package:get/get.dart';
import 'home_cars_item_model.dart';

/// This class defines the variables used in the [home_cars_page],
/// and is typically used to hold data that is passed between different parts of the application.
class HomeCarsModel {

  Rx<String> PickUpDate = Rx("Pick_up_date".tr);
  Rx<String> DropDate = Rx("Drop_Off_Date".tr);

  Rx<String> PickUpTime = Rx("pickup_time".tr);
  Rx<String> DropTime = Rx("Drop_time".tr);

  Rx<List<HomeCarsItemModel>> homeCarsItemList =
      Rx([]);
}
