// lib/screens/pin/pin_binding.dart
import 'package:get/get.dart';
import 'package:pretium_finance/controllers/pin_controller.dart';

class PinBinding extends Bindings {
  @override
  void dependencies() {
    // Use fenix: true if you want the controller to be recreated if it was disposed
    // but for PIN flow, lazyPut is usually fine as it's a sequential flow.
    Get.lazyPut<PinController>(() => PinController());
  }
}
