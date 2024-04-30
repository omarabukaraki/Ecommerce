import 'package:ecommerce/controller/firebase_auth_methods.dart';
import 'package:ecommerce/core/constant/app_assets.dart';
import 'package:ecommerce/core/constant/app_colors.dart';
import 'package:ecommerce/core/constant/app_string.dart';
import 'package:ecommerce/view/widgets/auth_widget/auth_text_field.dart';
import 'package:ecommerce/view/widgets/auth_widget/create_account_btn.dart';
import 'package:ecommerce/view/widgets/auth_widget/custom_icon_btn.dart';
import 'package:ecommerce/view/widgets/custom_button.dart';
import 'package:ecommerce/view/widgets/custom_logo_component.dart';
import 'package:ecommerce/view/widgets/custom_text_botton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;

  void clearTextField() {
    firstName.clear();
    lastName.clear();
    email.clear();
    password.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.kWhite,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomLogoComponent(
                    width: 0.5,
                    margin: 16,
                  ),
                  const CustomTextBtn(
                    name: AppString.signUpToJoin,
                    color: AppColor.kBlack,
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: Row(
                      children: [
                        CustomIconBtn(
                          padding: 4,
                        ),
                        CustomIconBtn(image: AppAssets.facebookImage),
                        CustomIconBtn(
                          image: AppAssets.appleImage,
                        ),
                      ],
                    ),
                  ),
                  const CustomTextBtn(
                    name: 'Or, register with email..',
                    color: AppColor.kGreyBlack,
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  AuthTextField(
                    controller: firstName,
                    labelTextFelid: AppString.firstName,
                    onChanged: (data) {
                      firstName.text = data;
                    },
                  ),
                  AuthTextField(
                    controller: lastName,
                    labelTextFelid: AppString.lastName,
                    onChanged: (data) {
                      lastName.text = data;
                    },
                  ),
                  AuthTextField(
                    controller: email,
                    labelTextFelid: AppString.email,
                    onChanged: (data) {
                      email.text = data;
                    },
                  ),
                  AuthTextField(
                    controller: password,
                    isPassword: true,
                    labelTextFelid: AppString.password,
                    onChanged: (data) {
                      password.text = data;
                    },
                  ),
                  isLoading == false
                      ? CustomButton(
                          labelBtn: AppString.signUp,
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              await context
                                  .read<FirebaseAuthMethods>()
                                  .signUpMethod(
                                      firstName: firstName.text,
                                      lastName: lastName.text,
                                      email: email.text,
                                      password: password.text,
                                      context: context);
                              setState(() {
                                isLoading = false;
                              });
                              clearTextField();
                            }
                          },
                        )
                      : const Padding(
                          padding: EdgeInsets.all(16),
                          child: CircularProgressIndicator(),
                        ),
                  CreateAccountBtn(
                    questionText: "Already have an account? ",
                    namePage: AppString.signIn,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
