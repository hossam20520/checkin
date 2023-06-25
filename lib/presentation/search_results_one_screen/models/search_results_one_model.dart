import 'package:checkin/presentation/search_results_one_screen/models/flightItemModel.dart';
import 'package:get/get.dart';
import 'listwizzairlogo_item_model.dart';
import 'listnileairone_item_model.dart';
import 'listgroup10342_item_model.dart';

class SearchResultsOneModel {
  Rx<List<ListwizzairlogoItemModel>> listwizzairlogoItemList =
      Rx(List.generate(2, (index) => ListwizzairlogoItemModel()));


  Rx<List<FlightItemModel>> flightItem =
  Rx(List.generate(2, (index) => FlightItemModel()));


  Rx<List<ListnileaironeItemModel>> listnileaironeItemList =
      Rx(List.generate(2, (index) => ListnileaironeItemModel()));

  Rx<List<Listgroup10342ItemModel>> listgroup10342ItemList =
      Rx(List.generate(2, (index) => Listgroup10342ItemModel()));
}
