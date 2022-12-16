
import 'package:get/get.dart';

import '../network/fetch_data.dart';

class DataController extends GetxController with StateMixin<List<dynamic>>{
  @override
  void onInit() {
    super.onInit();
    /*FetchData().getUser().then((value) {
      change(value, status: RxStatus.success());
    },onError: (error){
      change(null,status: RxStatus.error(error.toString()));
    });*/
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}