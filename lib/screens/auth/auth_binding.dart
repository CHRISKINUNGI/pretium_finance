
import 'package:pretium_finance/controllers/auth_controller.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // Using Get.put with fenix: true to ensure the AuthController instance
    // persists and is recreated if needed, rather than creating multiple conflicting instances.
    Get.lazyPut<AuthController>(() => AuthController(), fenix: true); // MODIFIED LINE
  }
}