import 'package:get/get.dart';
import '../../home_hotels_container_page/models/HotelsItemModel.dart';
import 'saved_item_model.dart';

/// This class defines the variables used in the [saved_page],
/// and is typically used to hold data that is passed between different parts of the application.
class SavedModel {
  Rx<List<HotelsItemModel>> savedItemList =
      Rx([]);
}
