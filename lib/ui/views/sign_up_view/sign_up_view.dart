import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:blue_flare/ui/shared/colors.dart';
import 'package:blue_flare/ui/shared/utlis.dart';
import 'package:blue_flare/ui/views/main_view/main_view.dart';
import 'package:blue_flare/ui/views/update_profile_view/update_profile_view_controller.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // المحتوى الرئيسي
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  // الأيقونة العلوية
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: AppColors.maincolor.withOpacity(0.2),
                        child: SvgPicture.asset(
                          "assets/images/person.svg",
                          width: screenWidth(8),
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.maincolor.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 0,
                              ),
                            ],
                            color: AppColors.maincolor,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              width: 2,
                              color: AppColors.whitecolor,
                              strokeAlign: BorderSide.strokeAlignInside,
                            ),
                          ),
                          child: const Icon(Icons.add,
                              size: 16, color: Colors.white),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  // العنوان
                  Text(
                    "إنشاء حساب المستخدم",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.maincolor,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    height: 2,
                    width: 200,
                    color: AppColors.maincolor,
                  ),

                  const SizedBox(height: 20),

                  // الحقول
                  _buildField("الاسم : ", "الاسم"),
                  _buildField("البريد الإلكتروني : ", "البريد الإلكتروني"),
                  _buildField("كلمة المرور : ", "كلمة المرور", obscure: true),
                  _buildField("رقم الهاتف : ", "رقم الهاتف"),
                  _buildField("العنوان : ", "العنوان"),

                  const SizedBox(height: 25),

                  // زر تسجيل الدخول
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.maincolor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      Get.to(MainView());
                    },
                    child: const Text(
                      "تسجيل دخول",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),

                  const SizedBox(height: 100), // مساحة لتفادي تغطية زر المساعدة
                ],
              ),
            ),

            // زر المساعدة (مقطوش من الحافة)
            Positioned(
              bottom: -20,
              left: -20,
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.maincolor,
                ),
                child: const Center(
                  child: Text(
                    "?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // عنصر الحقل
  Widget _buildField(String label, String hint, {bool obscure = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        children: [
          SizedBox(
            width: screenWidth(1.3),
            child: Text(label,
                style: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 5),
          TextField(
            obscureText: obscure,
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: AppColors.maincolor.withOpacity(0.3),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(
                  color: AppColors.maincolor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide:
                    BorderSide(color: AppColors.maincolor, width: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
