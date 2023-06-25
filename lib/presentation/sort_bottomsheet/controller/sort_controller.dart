import 'package:checkin/core/app_export.dart';
import 'package:checkin/presentation/sort_bottomsheet/models/sort_model.dart';

class SortController extends GetxController {
  Rx<SortModel> sortModelObj = SortModel().obs;

  Rx<bool> isCheckbox = false.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
