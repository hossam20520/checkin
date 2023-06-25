import 'package:get/get.dart';
import 'bottomsheet_item_model.dart';

/// This class defines the variables used in the [bottom_sheet_bottomsheet],
/// and is typically used to hold data that is passed between different parts of the application.
class BottomSheetModel {
  Rx<int> rooms =  Rx(1);
  Rx<int> adults =  Rx(1);
  Rx<int> childern =  Rx(1);
  Rx<List<BottomsheetItemModel>> bottomsheetItemList =
      Rx(List.generate(3, (index) => BottomsheetItemModel()));
}
