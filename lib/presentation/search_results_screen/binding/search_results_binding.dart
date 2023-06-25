import '../controller/search_results_controller.dart';
import 'package:get/get.dart';

class SearchResultsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchResultsController());
  }
}
