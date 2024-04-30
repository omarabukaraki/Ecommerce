import 'package:ecommerce/controller/firebase_auth_methods.dart';
import 'package:ecommerce/core/constant/app_assets.dart';
import 'package:ecommerce/core/constant/app_colors.dart';
import 'package:ecommerce/core/constant/app_string.dart';
import 'package:ecommerce/view/screens/sign_up_page.dart';
import 'package:ecommerce/view/widgets/auth_widget/auth_text_field.dart';
import 'package:ecommerce/view/widgets/custom_button.dart';
import 'package:ecommerce/view/widgets/custom_logo_component.dart';
import 'package:ecommerce/view/widgets/custom_text_botton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/auth_widget/create_account_btn.dart';
import '../widgets/auth_widget/custom_icon_btn.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // FirebaseAuthMethods firebaseAuthMethods = FirebaseAuthMethods();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
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
                  const CustomLogoComponent(),
                  AuthTextField(
                    controller: email,
                    labelTextFelid: AppString.email,
                    onChanged: (data) {
                      email.text = data;
                    },
                  ),
                  AuthTextField(
                    controller: password,
                    labelTextFelid: AppString.password,
                    isPassword: true,
                    onChanged: (data) {
                      password.text = data;
                    },
                  ),
                  const CustomTextBtn(
                    name: AppString.forgetPassword,
                  ),
                  CustomButton(
                    labelBtn: AppString.signIn,
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        await context.read<FirebaseAuthMethods>().loginMethod(
                            email: email.text,
                            password: password.text,
                            context: context);
                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                  ),
                  const CustomTextBtn(
                    name: AppString.continueWith,
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
                  CreateAccountBtn(
                    onTap: () async {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const SignUpPage();
                        },
                      ));
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
