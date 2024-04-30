import 'package:ecommerce/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CreateAccountBtn extends StatelessWidget {
  const CreateAccountBtn({
    super.key,
    this.questionText,
    this.namePage,
    this.onTap,
  });

  final String? questionText;
  final String? namePage;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(questionText ?? "Don't have an account? ",
              style: const TextStyle(fontSize: 14, color: AppColor.kGreyBlack)),
          GestureDetector(
            onTap: onTap,
            child: Text(namePage ?? 'Sign up',
                style: const TextStyle(color: AppColor.kPrimary)),
          ),
        ],
      ),
    );
  }
}
