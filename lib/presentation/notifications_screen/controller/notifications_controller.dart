import 'package:checkin/core/app_export.dart';
import 'package:checkin/data/models/Notification/NotiResp.dart';
import 'package:checkin/presentation/notifications_screen/models/notifications_model.dart';

import '../../../data/apiClient/api_client.dart';
import '../models/NotificatonItem.dart';

/// A controller class for the NotificationsScreen.
///
/// This class manages the state of the NotificationsScreen, including the
/// current notificationsModelObj
class NotificationsController extends GetxController {
  Rx<NotificationsModel> notificationsModelObj = NotificationsModel().obs;

  @override
  void onReady() {

    super.onReady();

    fetcheNotificationItems();


  }

  @override
  void onClose() {
    super.onClose();
  }









  NotificationResp notificationResp = NotificationResp();


  Future<void> CallGetNotification() async {

    String token =  Get.find<PrefUtils>().getToken();
    try {
      notificationResp = await Get.find<ApiClient>().GetNotifications(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer  '+ token
          },
          requestData: {
            'SortField': 'id',
            'SortType': 'desc',
            'search':  '',
            'limit': 5,
            'page':1
          }
      );
      _handleNotificationSuccess();
    } on NotificationResp catch (e) {
      // HotelsResponse = e;
      rethrow;
    }
  }




  void _handleNotificationSuccess() {
    // Logger.PretteyLogger("aaa");
    final notiItems = (notificationResp.noti ?? []).map((item) {
     Logger.PretteyLogger(notificationResp.noti);
      String  title      =    item.title.toString();
      String  message    =  item.message.toString();




      return NotificatonItem(title: Rx(title) , message: Rx(message) );

    }).toList();

    notificationsModelObj.value.notificationitem.value = notiItems;


  }


    fetcheNotificationItems() async {

    try {
      await  CallGetNotification();
      // _onLoginSuccess();
    } on NotificationResp {
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
