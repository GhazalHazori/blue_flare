import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:blue_flare/ui/shared/colors.dart';
import 'package:blue_flare/ui/shared/utlis.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color mainColor = const Color(0xFF3A93A7); // الأزرق المستخدم
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // AppBar مخصص منحني
            ClipPath(
              clipper: AppBarClipper(),
              child: Container(
                color: mainColor,
                height: 120,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.menu, color: Colors.white, size: 28),
                      Icon(Icons.notifications_none,
                          color: Colors.white, size: 28),
                    ],
                  ),
                ),
              ),
            ),

            // صورة شخصية
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

            const SizedBox(height: 10),

            // العنوان
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "الملف الشخصي",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),

            const SizedBox(height: 15),

            // الحقول
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                     _buildField("الاسم : ", "الاسم"),
                  _buildField("البريد الإلكتروني : ", "البريد الإلكتروني"),
                  _buildField("كلمة المرور : ", "كلمة المرور", obscure: true),
                  _buildField("رقم الهاتف : ", "رقم الهاتف"),
                  _buildField("العنوان : ", "العنوان"),
                    const SizedBox(height: 20),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60, vertical: 12),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "تعديل",
                        style: TextStyle(
                            fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Navigation
          
          ],
        ),
      ),
    );
  }

  // دالة لبناء حقول الإدخال
  Widget buildField(String label, String hint, Color mainColor,
      {bool obscure = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          TextField(
            obscureText: obscure,
            decoration: InputDecoration(
              hintText: hint,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: mainColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: mainColor, width: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
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


// clipper للجزء العلوي
class AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 30);
    path.quadraticBezierTo(size.width / 2, size.height + 20, size.width,
        size.height - 30);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// clipper للـ Bottom Navigation
class BottomBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 30);
    path.quadraticBezierTo(size.width / 2, -20, size.width, 30);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
