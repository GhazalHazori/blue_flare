import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:blue_flare/main.dart';
import 'package:blue_flare/ui/shared/custom_widgets/custom_button_new.dart';
import 'package:blue_flare/ui/views/sign_up_view/sign_up_view.dart';
import 'package:get/get.dart';
import 'package:blue_flare/ui/shared/colors.dart';
import 'package:blue_flare/ui/shared/utlis.dart';
import 'package:blue_flare/ui/views/splash_screen/splash_screen_controller.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  SplashScreenController controller = Get.put(SplashScreenController());
  //late BuildContext mycontext;
  @override
  // void initState() {
  //   Future.delayed(Duration(seconds: 5)).then((value) {
  //     if (SharedPrefrenceRepository.getFirstLunch()) {
  //       Get.off(IntroView);
  //     } else {
  //       return SharedPrefrenceRepository.getLogeedIn()
  //           ? Get.off(MainView)
  //           : Get.off(LandingView);
  //     }

  //     SharedPrefrenceRepository.setFirstLunch(false);
  //   });

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //mycontext = context;
    return Scaffold(
          body: Column(
            
    // alignment: AlignmentDirectional.bottomCenter,
    // fit: StackFit.passthrough,
    children: [
     Image.asset(
          'assets/images/splash_image.png',
          width: screenWidth(1),
        
        ),
       screenHeight(50).ph,
    
     Text(".لأن راحتك تبدأ من بيتك",style:TextStyle(fontSize: screenWidth(15),fontWeight: FontWeight.bold,color: AppColors.blacktext)),
      // Align(
      //   alignment: Alignment.bottomCenter,
      // child: Container(
      //   margin: EdgeInsets.only(bottom: size.width * 0.40),
      //   width: size.width * 0.1,
      //   height: size.width * 0.1,
      //   child: CircularProgressIndicator(
      //     color: AppColors.mainorangecolor,
      //   ),
      // ),
    
      // )
        screenHeight(50).ph,
    Text(
  "اكتشف أفضل عاملات التنظيف\n"
  "الموثوقات احجز بسهولة،\n"
  "واستمتع بمنزل نظيف ومرتب دون عناء.",
  textAlign: TextAlign.center, // يخلي النص بالوسط
  style: TextStyle(
    color: AppColors.blacktext,
    fontSize: screenWidth(15),
  ),
),
     screenHeight(50).ph,
     CustomButtonNew(text: "ابدأ الان",
     textsize: screenWidth(25),
     textfontwieght: FontWeight.w600, onpressed: (){
      Get.to(RegisterScreen());
    
     },backgroundcolor: AppColors.maincolor,),
     SvgPicture.asset(
          'assets/images/splash_blue.svg',
          width: screenWidth(1),
        
        )
    ],
          ),
        );
  }
}
