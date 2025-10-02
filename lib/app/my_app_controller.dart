import 'package:flutter_templat/core/enums/connectivity_status.dart';
import 'package:flutter_templat/core/services/base_controller.dart';
import 'package:flutter_templat/core/utils/general_utile.dart';
import 'package:flutter_templat/ui/shared/utlis.dart';

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
