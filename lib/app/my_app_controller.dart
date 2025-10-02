import 'package:blue_flare/core/enums/connectivity_status.dart';
import 'package:blue_flare/core/services/base_controller.dart';
import 'package:blue_flare/core/utils/general_utile.dart';
import 'package:blue_flare/ui/shared/utlis.dart';

class MyAppContoller extends BaseControoler {
  ConnectivityStatus connectionStatus = ConnectivityStatus.ONLINE;
  @override
  void onInit() {
    // listenToConnectionStatus();

    super.onInit();
  }

  // void listenToConnectionStatus() {
  //   connectivityService.connectivityStatusController.stream.listen((event) {
  //     connectionStatus = event;
  //   });
  // }
}
