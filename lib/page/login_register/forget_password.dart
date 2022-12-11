import 'dart:ffi';

import 'package:e_milkapp/route/route_handler.dart';
import 'package:e_milkapp/services/auth.dart';
import 'package:e_milkapp/utilities/colors.dart';
import 'package:e_milkapp/utilities/dimensions.dart';
import 'package:e_milkapp/widgets/big_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../widgets/small_text.dart';

class ForgetPasswordPageView extends StatefulWidget {
  const ForgetPasswordPageView({super.key});

  @override
  State<ForgetPasswordPageView> createState() => _ForgetPasswordPageViewState();
}

class _ForgetPasswordPageViewState extends State<ForgetPasswordPageView> {
  TextEditingController _emailController = TextEditingController();

  Future<void> passwordResetWithEmail() async {
    try {
      await Auth().passwordResetWithEmail(email: _emailController.text);
    } on FirebaseAuthException catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // color: Colors.red,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: Dimensions.height20 * 2 - 1),
                width: double.maxFinite,
                height: Dimensions.height10 * 30,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/image/logo part 1.png'),
                      fit: BoxFit.contain),
                  color: Colors.white,
                ),
              ),
              Container(
                color: Colors.white,
                width: double.maxFinite,
                height: Dimensions.height10 * 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Reset Password ",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: Dimensions.fontSize16 * 3,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.height10 * 2,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: Dimensions.width15, right: Dimensions.width15),
                child: Container(
                  // ignore: sort_child_properties_last
                  child: TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email, color: Color(0xFF89dad0)),
                      border: OutlineInputBorder(),
                      hintText: 'Email',
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0, 5),
                      ),
                      BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(5, 0),
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(-5, 0),
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(5, 0),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.height10 * 2,
              ),
              Container(
                  color: Colors.white,
                  child: Container(
                    height: Dimensions.height20 * 4,
                    decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20)),
                    child: GestureDetector(
                      onTap: () async {
                        print("i am forget password");
                        try {
                          await Auth().passwordResetWithEmail(
                            email: _emailController.text,
                          );
                        } on FirebaseAuthException catch (e) {
                          Get.snackbar(
                              "Reset Password Error", e.code.toUpperCase());
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: Dimensions.height20,
                            bottom: Dimensions.height20,
                            right: Dimensions.width30 * 2,
                            left: Dimensions.width30 * 2),
                        child: BigText(
                          text: "Send Email",
                          // style: TextStyle(fontSize: Dimensions.fontSize16 * 2,),
                          size: Dimensions.fontSize16 * 2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: Dimensions.height10,
              ),
              Center(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getLoginPage());
                      },
                      child: BigText(
                        text: "Have an account?",
                        size: Dimensions.fontSize20,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height30 * 3,
                    ),
                    SmallText(
                      text: "Sign up using one of the following methods",
                      size: Dimensions.fontSize16,
                    ),
                    SizedBox(height: Dimensions.height30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.google,
                          size: Dimensions.height45,
                          color: Colors.greenAccent,
                        ),
                        SizedBox(width: Dimensions.width20 * 2),
                        FaIcon(
                          FontAwesomeIcons.twitter,
                          size: Dimensions.height45,
                          color: Colors.blue,
                        ),
                        SizedBox(width: Dimensions.width20 * 2),
                        FaIcon(
                          FontAwesomeIcons.facebook,
                          size: Dimensions.height45,
                          color: Colors.blue,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
