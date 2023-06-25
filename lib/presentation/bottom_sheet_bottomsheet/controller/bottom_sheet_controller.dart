import 'package:checkin/core/app_export.dart';
import 'package:checkin/presentation/bottom_sheet_bottomsheet/models/bottom_sheet_model.dart';

import '../../home_hotels_container_page/controller/home_hotels_container_controller.dart';

class BottomSheetController extends GetxController {
  Rx<BottomSheetModel> bottomSheetModelObj = BottomSheetModel().obs;
  // controller.homeHotelsContainerModelObj.value.gustsRooms.value
     Rx<int>? rooms;
  Rx<int>? adults;
  Rx<int>? childern;
  void getRooms(){
     rooms = bottomSheetModelObj.value.rooms;
  }

  void getAdults(){
    adults = bottomSheetModelObj.value.adults;
  }

  void getChild(){
    childern = bottomSheetModelObj.value.childern;
  }


  var controllerSearch = Get.find<HomeHotelsContainerController>();
     // bottomSheetModelObj
  void apply(){
    getRooms();
    getAdults();
    getChild();
    controllerSearch.homeHotelsContainerModelObj.value.gustsRooms.value  =
        rooms.toString() + " Rooms - "+ adults.toString() + " Adults - " + childern.toString() + " Childern";
    Get.back();
  }

  void increaseFun(){
    bottomSheetModelObj.update((model) {

        model!.rooms.value = model!.rooms.value + 1;

    });
  }

  void DecreaseFun(){
    bottomSheetModelObj.update((model) {
      if(model!.rooms.value >=  2) {
      model!.rooms.value =  model!.rooms.value - 1 ;
      }
    });
  }


  void increaseFunAdults(){
    bottomSheetModelObj.update((model) {
      model!.adults.value =  model!.adults.value + 1 ;
    });
  }

  void DecreaseFunAdults(){
    bottomSheetModelObj.update((model) {
      if(model!.adults.value >=  2) {
        model!.adults.value = model!.adults.value - 1;
      }
    });
  }





  void increaseFunChildern(){
    bottomSheetModelObj.update((model) {

        model!.childern.value = model!.childern.value + 1;

    });
  }

  void DecreaseFunChildern(){
    bottomSheetModelObj.update((model) {
      if(model!.childern.value >  0){
        model!.childern.value =  model!.childern.value - 1 ;
      }

    });
  }



  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
