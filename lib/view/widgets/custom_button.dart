import 'package:ecommerce/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.labelBtn, this.onTap});
  final VoidCallback? onTap;
  final String labelBtn;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.06,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: AppColor.kPrimary,
        ),
        child: Center(
          child: Text(
            labelBtn,
            style: const TextStyle(color: AppColor.kWhite, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
