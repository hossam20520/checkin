import 'package:get/get.dart';
import '../../home_hotels_container_page/models/HotelsItemModel.dart';
import 'searchresults_item_model.dart';

class SearchResultsTwoModel {
Rx<String> search = Rx("");
  Rx<List<HotelsItemModel>> HotelsItems = Rx([]);


  Rx<List<SearchresultsItemModel>> searchresultsItemList =
      Rx(List.generate(4, (index) => SearchresultsItemModel()));



}
