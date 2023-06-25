import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'NotificatonItem.dart';

/// This class defines the variables used in the [notifications_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class NotificationsModel {

  Rx<List<NotificatonItem>> notificationitem = Rx([]);

}
