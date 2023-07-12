import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../data/models/selectionPopupModel/selection_popup_model.dart';

class CreateAccountModel {

  Rx<String> selectedId = Rx("");

  Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
    // SelectionPopupModel(
    //   id: 1,
    //   title: "Item One",
    //   isSelected: true,
    // ),
    // SelectionPopupModel(
    //   id: 2,
    //   title: "Item Two",
    // ),
    // SelectionPopupModel(
    //   id: 3,
    //   title: "Item Three",
    // )
  ]);
}
