import 'package:get/get.dart';
import 'package:checkin/data/models/selectionPopupModel/selection_popup_model.dart';
import 'chipviewframe12_item_model.dart';
import 'facilities_item.dart';

class RoomOneModel {


  Rx<String> parama = Rx("");
  Rx<String> title = Rx("");
  Rx<int> id = Rx(0);
  Rx<List<String>> images = Rx([]);
  Rx<String> bed = Rx("");
  Rx<String> persons = Rx("");
  Rx<double> price = Rx(0);
  Rx<String> description = Rx("");




  Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
    SelectionPopupModel(
      id: 1,
      title: "Item One",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Item Two",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Item Three",
    )
  ]);

  Rx<List<FacilitesItem>> facilitesITems =
      Rx([]);
}
