import 'package:checkin/core/app_export.dart';
import 'package:checkin/presentation/home_hotels_container_page/models/HotelsItemModel.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

/// This class defines the variables used in the [home_hotels_container_page],
/// and is typically used to hold data that is passed between different parts of the application.
class HomeHotelsContainerModel {
  Rx<String> chekin = Rx("lbl_check_inn".tr);
  Rx<String> gustsRooms = Rx("msg_guests_and_rooms".tr);
  Rx<String> search = Rx("msg_enter_destination".tr);
  Rx<String> checkout = Rx("lbl_check_outt".tr);
  Rx<List<HotelsItemModel>> HotelsItems = Rx(
    [

      // HotelsItemModel(id: Rx(0) , image: Rx("") , title: Rx("") , price: Rx("")),
      // HotelsItemModel(id: Rx(0) , image: Rx("") , title: Rx("") , price: Rx("")),
      // HotelsItemModel(id: Rx(0) , image: Rx("") , title: Rx("") , price: Rx("")),
      // HotelsItemModel(id: Rx(0) , image: Rx("") , title: Rx("") , price: Rx("")),

    ]
  );
  // Rx(List.generate(3, (index) => HotelsItemModel()));


}
