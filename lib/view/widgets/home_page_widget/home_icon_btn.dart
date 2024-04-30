import 'package:ecommerce/core/constant/app_assets.dart';
import 'package:ecommerce/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class HomeIconBtn extends StatelessWidget {
  const HomeIconBtn(
      {super.key,
      required this.padding,
      this.image,
      this.icon,
      this.onTap,
      this.radius,
      this.iconColor,
      this.backgroundColor,
      required this.isImage});
  final EdgeInsetsGeometry padding;
  final String? image;
  final IconData? icon;
  final bool isImage;
  final VoidCallback? onTap;
  final double? radius;
  final Color? backgroundColor;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: GestureDetector(
        onTap: onTap,
        child: CircleAvatar(
          radius: radius ?? 20,
          backgroundColor: backgroundColor ?? AppColor.kSecondary,
          child: isImage != true
              ? Icon(
                  icon ?? Icons.menu_rounded,
                  color: iconColor ?? AppColor.kBlack,
                )
              : Padding(
                  padding: const EdgeInsets.all(6),
                  child: Image.asset(image ?? AppAssets.googleImage),
                ),
        ),
      ),
    );
  }
}
