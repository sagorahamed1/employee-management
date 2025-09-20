import 'package:get/get.dart';
import '../controller/auth_controller.dart';
import '../controller/neighbor/neighbor_controller.dart';


class DependencyInjection implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => NeighborController(), fenix: true);

  }

}