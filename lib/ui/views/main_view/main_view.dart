import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:blue_flare/core/enums/bottom_navigation_enum.dart';
import 'package:blue_flare/ui/shared/colors.dart';
import 'package:blue_flare/ui/shared/custom_widgets/custom_drawer.dart';
import 'package:blue_flare/ui/views/main_view/main_view_widget/bottom_navigation_widget.dart';
import 'package:blue_flare/ui/views/sign_up_view/sign_up_view.dart';
import 'package:blue_flare/ui/views/update_profile_view/update_profile_view.dart';
import 'package:blue_flare/ui/views/update_profile_view/update_profile_view_controller.dart';
import 'package:get/get.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  PageController controller = PageController(initialPage: 0);

  // هون نخزن أي تب حالياً مفتوح
  String selected = "home"; // نفس المفاتيح اللي بال BottomNavigationWidget

  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.page?.round() != 0) {
          controller.jumpToPage(0);
          return false;
        }
        return true;
      },
      child: Scaffold(
        drawer: CustomDrawer(),
        resizeToAvoidBottomInset: false,
        key: key,
        bottomNavigationBar: BottomNavigationWidget(
          // نرسل selected للـ bottom
          selected: selected,
          // نرجع النتيجة لما المستخدم يضغط
          onTap: (String newSelected, int pageIndex) {
            setState(() {
              selected = newSelected;
            });
            controller.jumpToPage(pageIndex);
          },
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          children: const [
            // حط هون شاشاتك بالترتيب
            // home
           // profile
            ProfileScreen(), // clean
          ],
        ),
      ),
    );
  }
}
