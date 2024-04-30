import 'package:ecommerce/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField(
      {super.key,
      this.onChanged,
      required this.labelTextFelid,
      this.isPassword = false,
      this.controller});
  final String labelTextFelid;
  final void Function(String)? onChanged;
  final bool isPassword;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            labelTextFelid,
            style: const TextStyle(color: AppColor.kGreyBlack),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColor.kSecondary),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextFormField(
            controller: controller,
            validator: (data) {
              if (data!.isEmpty) {
                return '';
              }
              return null;
            },
            obscureText: isPassword,
            onChanged: onChanged,
            decoration: InputDecoration(
                errorStyle:
                    const TextStyle(fontSize: 0, color: AppColor.kPrimary),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: AppColor.kPrimary)),
                contentPadding: const EdgeInsets.all(16),
                border: const OutlineInputBorder(borderSide: BorderSide.none)),
          ),
        ),
      ],
    );
  }
}
