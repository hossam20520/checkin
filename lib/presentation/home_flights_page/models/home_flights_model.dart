import 'package:get/get.dart';
import 'cards_item_model.dart';

class HomeFlightsModel {
  Rx<String> chekin = Rx("lbl_depart".tr);
  Rx<String> from = Rx("");
  Rx<String> to = Rx("");

  Rx<String> checkout = Rx("lbl_return".tr);

  Rx<List<CardsItemModel>> cardsItemList =
      Rx([]);
}
