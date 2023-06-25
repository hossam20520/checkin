import 'package:checkin/core/app_export.dart';
import 'package:checkin/presentation/profile_page/models/profile_model.dart';

/// A controller class for the ProfilePage.
///
/// This class manages the state of the ProfilePage, including the
/// current profileModelObj
class ProfileController extends GetxController {
  ProfileController(this.profileModelObj);

  Rx<ProfileModel> profileModelObj;





  @override
  void onReady() {
    super.onReady();
    loadData();
  }

  @override
  void onClose() {
    super.onClose();
  }


  void loadData(){
    final avatar =    Constants.imageAvatar + Get.find<PrefUtils>().getAvatar();
    final Name =    Get.find<PrefUtils>().getName() ;
    final email =    Get.find<PrefUtils>().getEmail() ;
    final lastname =    Get.find<PrefUtils>().getLastname() ;
    final id =    Get.find<PrefUtils>().getId();
    final username =    Get.find<PrefUtils>().getUsername() ;
    final phone =    Get.find<PrefUtils>().getPhone() ;
    profileModelObj.value.image.value = avatar;

    profileModelObj.value.lastname.value = lastname.toString();
    profileModelObj.value.username.value =  username.toString();
    profileModelObj.value.email.value = email.toString();
    profileModelObj.value.name.value = Name.toString();
    profileModelObj.value.phone.value = phone.toString();
  }
}
