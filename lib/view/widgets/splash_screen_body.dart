import 'package:ecommerce/core/constant/app_assets.dart';
import 'package:ecommerce/core/constant/app_string.dart';
import 'package:flutter/material.dart';
import '../../core/constant/app_colors.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.logoApplication,
            width: MediaQuery.of(context).size.width * 0.35,
            height: MediaQuery.of(context).size.width * 0.35,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              AppString.appName,
              style: TextStyle(color: AppColor.kWhite, fontSize: 26),
            ),
          )
        ],
      ),
    );
  }
}
