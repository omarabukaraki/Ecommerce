import 'package:ecommerce/core/constant/app_assets.dart';
import 'package:flutter/material.dart';

class CustomIconBtn extends StatelessWidget {
  const CustomIconBtn({super.key, this.onTap, this.image, this.padding});

  final String? image;
  final void Function()? onTap;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.all(8),
          padding: EdgeInsets.all(padding ?? 9),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color.fromARGB(255, 218, 217, 217)),
          ),
          height: MediaQuery.of(context).size.height * 0.06,
          child: Image.asset(image ?? AppAssets.googleImage),
        ),
      ),
    );
  }
}
