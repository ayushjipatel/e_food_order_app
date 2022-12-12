import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_milkapp/route/route_handler.dart';
import 'package:e_milkapp/services/auth.dart';
import 'package:e_milkapp/services/register_user.dart';
import 'package:e_milkapp/utilities/colors.dart';
import 'package:e_milkapp/utilities/dimensions.dart';
import 'package:e_milkapp/widgets/big_text.dart';
import 'package:e_milkapp/widgets/small_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class RegisterPageView extends StatefulWidget {
  const RegisterPageView({super.key});

  @override
  State<RegisterPageView> createState() => _RegisterPageViewState();
}

class _RegisterPageViewState extends State<RegisterPageView> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _nameController;
  late TextEditingController _phoneController;

  //initialize firebase app

//create user
  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
    } on FirebaseAuthException catch (e) {}
  }

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _phoneController = TextEditingController();
    _nameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          // color: Colors.red,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: Dimensions.height20 * 2 - 1),
                width: double.maxFinite,
                height: Dimensions.height20 * 10,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/image/logo part 1.png'),
                      fit: BoxFit.contain),
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: Dimensions.height10 * 2,
              ),
//email
              Padding(
                padding: EdgeInsets.only(
                    left: Dimensions.width15, right: Dimensions.width15),
                child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(Dimensions.radius30 / 2),
                      borderSide: BorderSide(color: Colors.grey.shade500),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          Dimensions.radius30 / 2 + Dimensions.radius20 / 4),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    hintText: 'Email',
                    fillColor: Colors.grey.shade50,
                    filled: true,
                    prefixIcon: Icon(
                      Icons.email,
                      color: AppColors.mainColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.height15,
              ),
//password
              Padding(
                padding: EdgeInsets.only(
                    left: Dimensions.width15, right: Dimensions.width15),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(Dimensions.radius30 / 2),
                      borderSide: BorderSide(color: Colors.grey.shade500),
                    ),
                    fillColor: Colors.grey.shade50,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          Dimensions.radius30 / 2 + Dimensions.radius20 / 4),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    hintText: 'Password',
                    prefixIcon: Icon(
                      Icons.password,
                      color: AppColors.mainColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.height15,
              ),
//Phone
              Padding(
                padding: EdgeInsets.only(
                    left: Dimensions.width15, right: Dimensions.width15),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  controller: _phoneController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(Dimensions.radius30 / 2),
                      borderSide: BorderSide(color: Colors.grey.shade500),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            Dimensions.radius30 / 2 + Dimensions.radius20 / 4),
                        borderSide: const BorderSide(color: Colors.black)),
                    prefixIcon:
                        const Icon(Icons.smartphone, color: Color(0xFF89dad0)),
                    hintText: 'Phone',
                    fillColor: Colors.grey.shade50,
                    filled: true,
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.height15,
              ),
//Name
              Padding(
                padding: EdgeInsets.only(
                    left: Dimensions.width15, right: Dimensions.width15),
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius30 / 2),
                        borderSide: BorderSide(color: Colors.grey.shade500),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            Dimensions.radius30 / 2 + Dimensions.radius20 / 4),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      hintText: 'Name',
                      fillColor: Colors.grey.shade50,
                      filled: true,
                      prefixIcon: Icon(
                        Icons.person,
                        color: AppColors.mainColor,
                      )),
                ),
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              SizedBox(
                height: Dimensions.height10 * 2,
              ),
//sign up button
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
                        print("i am sign up");
                        try {
                          await Auth().createUserWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                        } on FirebaseAuthException catch (e) {
                          print(e.code.toString());
                          if (e.code == "invalid-email") {
                            Get.snackbar("Sign Up Error", e.code.toUpperCase());
                          } else {
                            Get.snackbar("Sign Up Error", e.code.toUpperCase());
                          }
                          if (e.code == 'email-already-in-use') {
                            Get.toNamed(RouteHelper.getLoginPage());
                          }
                        }
                        try {
                          await RegisterUser().registerUserDetail(
                            email: _emailController.text.trim(),
                            name: _nameController.text.trim(),
                            phone: int.parse(_phoneController.text),
                          );
                          print("hello i am called for users details");
                        } on FirebaseException catch (e) {
                          print(e.code);
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: Dimensions.height20,
                            bottom: Dimensions.height20,
                            right: Dimensions.width30 * 2,
                            left: Dimensions.width30 * 2),
                        child: BigText(
                          text: "Sign Up",
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
//bottom naivgation
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
                      height: Dimensions.height30,
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
