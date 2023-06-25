import 'package:checkin/core/app_export.dart';
import 'package:checkin/presentation/room_options_screen/models/room_options_model.dart';

import '../../../data/apiClient/api_client.dart';
import '../../../data/models/Room/get_rooms_resp.dart';
import '../models/roomoptions_item_model.dart';

class RoomOptionsController extends GetxController {
  Rx<RoomOptionsModel> roomOptionsModelObj = RoomOptionsModel().obs;

  RoomsResponse roomsResponse = RoomsResponse();



  @override
  void onReady() {
    super.onReady();
    fetchHotelsItems();
  }

  @override
  void onClose() {
    super.onClose();
  }


  Future<void> callGetHotels() async {
    try {
      roomsResponse = await Get.find<ApiClient>().GetRooms(
          headers: {
            'Content-Type': 'application/json',
          },
         id:roomOptionsModelObj.value.parama.value.toString(),
      );
      _handleCreateLoginSuccess();
    } on RoomsResponse catch (e) {
      // HotelsResponse = e;
      rethrow;
    }
  }



  void _handleCreateLoginSuccess() {

    final RoomItems = (roomsResponse.rooms ?? []).map((item) {


      String str = item.image.toString();
      List<String> filenames = str.split(',');
      String im = filenames.isNotEmpty ?  filenames[0] :  item.image.toString();

      String imageUrl = Constants.imageRooms + im;
      // print("111111111111111111111111111111111111111111111111111111");
      // print(beds);

      final id = item.id?.toInt() ?? 0;
      final price = item.pricePerNight?.toDouble()  ?? 0;

      final countryCode =   Get.find<PrefUtils>().getLang();



      if(countryCode == "ar"){
        final title = item.arName ?? ''; // Provide a default value for nullable strin
        final beds = item.bed!.first.qty.toString() + " " + item.bed!.first.enName.toString();
        return RoomoptionsItemModel(
          image: Rx(imageUrl),
          title: Rx(title),
          id: Rx(id),
          price: Rx(price),
          bed:Rx(beds),

        );

      }else{
        final title = item.arName ?? '';
        final beds = item.bed!.first.qty.toString() + " " + item.bed!.first.enName.toString();
        // String people = item.personNumbers!.toString();
        return RoomoptionsItemModel(

          image: Rx(imageUrl),
          title: Rx(title),
          id: Rx(id),
          price: Rx(price),
          bed:Rx(beds),
        );

      }
      // Provide a default value for nullable string




    }).toList();

    roomOptionsModelObj.value.roomoptionsItemList.value = RoomItems;

  }



  void fetchHotelsItems() async {

    try {
      await  callGetHotels();
      // _onLoginSuccess();
    } on RoomsResponse {
      // _onLoginError();
    } on NoInternetException catch (e) {
      Get.rawSnackbar(message: e.toString());
    } catch (e) {
      // _onLoginSuccess();
      print(e);
      //TODO: Handle generic errors
    }

  }


}
