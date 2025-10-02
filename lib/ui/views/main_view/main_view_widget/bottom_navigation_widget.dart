import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:blue_flare/ui/shared/colors.dart';

class BottomNavigationWidget extends StatelessWidget {
  final String selected;
  final Function(String, int) onTap;

  const BottomNavigationWidget({
    super.key,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color mainColor = const Color(0xFF3A93A7);

    return SizedBox(
      height: 100,
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Container(color: AppColors.whitecolor,
            height: 80,
            child: SvgPicture.asset(
              "assets/images/bottom_nav.svg",
              fit: BoxFit.cover,
            ),
          ),
          Stack(
            children: [
              buildNavItem("profile", "profile", 1,
                  alignment: selected == "profile"
                      ? const Alignment(0, -3)
                      : const Alignment(-0.8, 0.6)),
              buildNavItem("home", "home", 0,
                  alignment: selected == "home"
                      ? const Alignment(0, -3)
                      : selected == "profile"
                          ? const Alignment(-0.8, 0.6)
                          : const Alignment(0.8, 0.6)),
              buildNavItem("clean", "house_keeper", 2,
                  alignment: selected == "clean"
                      ? const Alignment(0, -3)
                      : const Alignment(0.8, 0.6)),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildNavItem(String type, String icon, int pageIndex,
      {required Alignment alignment}) {
    Color mainColor = const Color(0xFF3A93A7);
    bool isSelected = selected == type;

    return AnimatedAlign(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      alignment: alignment,
      child: GestureDetector(
        onTap: () => onTap(type, pageIndex),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
          width: isSelected ? 70 : 50,
          height: isSelected ? 70 : 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? Colors.white : Colors.transparent,
            boxShadow: isSelected
                ? [
                    const BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    )
                  ]
                : [],
          ),
          child: SvgPicture.asset(
            "assets/images/$icon.svg",
            color: isSelected ? mainColor : Colors.white,
            width: isSelected ? 32 : 26,
          ),
        ),
      ),
    );
  }
}
