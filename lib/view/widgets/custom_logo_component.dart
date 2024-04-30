import 'package:ecommerce/core/constant/app_assets.dart';
import 'package:ecommerce/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CustomLogoComponent extends StatelessWidget {
  const CustomLogoComponent({super.key, this.margin, this.width});
  final double? width;
  final double? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin ?? 32),
      width: MediaQuery.of(context).size.width * (width ?? 0.6),
      height: MediaQuery.of(context).size.width * (width ?? 0.6),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.kPrimary,
        ),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Container(
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColor.kPrimary,
          borderRadius: BorderRadius.circular(999),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Image.asset(
            AppAssets.logoApplication,
          ),
        ),
      ),
    );
  }
}
