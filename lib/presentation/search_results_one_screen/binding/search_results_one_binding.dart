import '../controller/search_results_one_controller.dart';
import 'package:get/get.dart';

class SearchResultsOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchResultsOneController());
  }
}
