import 'package:ecommerce/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextBtn extends StatelessWidget {
  const CustomTextBtn(
      {super.key,
      this.onTap,
      required this.name,
      this.mainAxisAlignment,
      this.color});
  final String name;
  final VoidCallback? onTap;
  final MainAxisAlignment? mainAxisAlignment;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: GestureDetector(
            onTap: onTap,
            child: Text(
              name,
              style: TextStyle(color: color ?? AppColor.kPrimary),
            ),
          ),
        )
      ],
    );
  }
}
