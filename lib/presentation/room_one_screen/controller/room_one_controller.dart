import 'package:checkin/core/app_export.dart';
import 'package:checkin/presentation/room_one_screen/models/facilities_item.dart';
import 'package:checkin/presentation/room_one_screen/models/room_one_model.dart';

import '../../../data/apiClient/api_client.dart';
import '../../../data/models/Room/get_room_resp.dart';

class RoomOneController extends GetxController {
  Rx<RoomOneModel> roomOneModelObj = RoomOneModel().obs;

  SelectionPopupModel? selectedDropDownValue;
  RoomResponse roomResponse = RoomResponse();

  @override
  Future<void> onReady() async {
    super.onReady();
    // print("00000000000000000000000000000000");
    // print(hotelModelObj.value.parama.value);
    try {
      await  CallGetHotelDetail();
      // _onGetHotelSuccess();
    } on RoomResponse {
      // _onGetHotelError();
    } on NoInternetException catch (e) {
      Get.rawSnackbar(message: e.toString());
    } catch (e) {
      // _onGetHotelError();
      print(e);
      //TODO: Handle generic errors
    }

  }

  @override
  void onClose() {
    super.onClose();
  }

  onSelected(dynamic value) {
    selectedDropDownValue = value as SelectionPopupModel;
    roomOneModelObj.value.dropdownItemList.value.forEach((element) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    });
    roomOneModelObj.value.dropdownItemList.refresh();
  }


  Future<void> CallGetHotelDetail() async {

    try {
      roomResponse = await Get.find<ApiClient>().GetRoom(
          headers: {
            'Content-Type': 'application/json',
          },
          id:  roomOneModelObj.value.parama.value.toString(),

      );
      _handleGetRoomSuccess();

    } on RoomResponse catch (e) {
      // HotelsResponse = e;

      rethrow;
    }
  }




  void _handleGetRoomSuccess() {

    final countryCode =   Get.find<PrefUtils>().getLang();


    String filenames = roomResponse.room!.image.toString();
    List<String> filenamesArray = filenames.split(',');
    if(filenamesArray.isNotEmpty){

      final images = (filenamesArray ?? []).map((img) {

         return Constants.imageRooms + img;
      }).toList();

      roomOneModelObj.value.images.value  =  images ;
    }

    final facilites = (roomResponse.room!.facilitie ?? []).map((itms) {

      final image = itms.icon.toString() ?? "";
      final countryCode =   Get.find<PrefUtils>().getLang();
      if (countryCode == 'ar') {
        final title = itms.arName.toString() ?? "";
        return FacilitesItem( title: Rx(title), image: Rx(image) );
      }else{
        final title = itms.enName.toString() ?? "";
        return FacilitesItem( title: Rx(title), image: Rx(image) );
      }


    }).toList();



    roomOneModelObj.value.facilitesITems.value = facilites;
    roomOneModelObj.value.id.value  =  roomResponse.room!.id!.toInt();
    roomOneModelObj.value.price.value  =  roomResponse.room!.pricePerNight!.toDouble();


    if (countryCode == 'ar') {
      roomOneModelObj.value.title.value  =  roomResponse.room!.arName.toString() ;

      roomOneModelObj.value.description.value  =  roomResponse.room!.arDescription!.toString();
      roomOneModelObj.value.bed.value  =  roomResponse.room!.bed!.first.qty.toString() + " " +roomResponse.room!.bed!.first.arName!.toString();
    } else {
      roomOneModelObj.value.title.value  =  roomResponse.room!.enName.toString() ;
      roomOneModelObj.value.description.value  =  roomResponse.room!.enDescription!.toString();
      roomOneModelObj.value.bed.value  =   roomResponse.room!.bed!.first.qty.toString() + " " + roomResponse.room!.bed!.first.enName!.toString();


    }
  }


  void _onGetHotelSuccess() {}
  void _onGetHotelError() {}





  // GetRoom









}
