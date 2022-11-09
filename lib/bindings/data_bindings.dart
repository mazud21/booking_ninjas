
import 'package:get/get.dart';

import '../controller/data_controller.dart';

class DataBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => DataController());
  }

}