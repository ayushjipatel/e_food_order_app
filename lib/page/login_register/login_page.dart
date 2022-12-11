import 'package:e_milkapp/route/route_handler.dart';
import 'package:e_milkapp/services/auth.dart';
import 'package:e_milkapp/utilities/colors.dart';
import 'package:e_milkapp/utilities/dimensions.dart';
import 'package:e_milkapp/widgets/big_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({super.key});

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  bool isLogin = true;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  //initialize firebase app
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

//logion function
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        Get.snackbar("Login Error", "User-not-found");
      } else {
        Get.snackbar("Login Error", "Something went wrong");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _initializeFirebase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              print("Connection is established");
              return SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.only(top: Dimensions.height20 * 2 - 1),
                        width: double.maxFinite,
                        height: Dimensions.height20 * 11,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/image/logo part 1.png'),
                          ),
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        width: double.maxFinite,
                        height: Dimensions.height10 * 12,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello ",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: Dimensions.fontSize16 * 5 - 10,
                                  fontWeight: FontWeight.bold),
                            ),
                            BigText(
                              text: "Sign in your account",
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height30 * 2,
                      ),
                      //email entry
                      Padding(
                        padding: EdgeInsets.only(
                            left: Dimensions.width15,
                            right: Dimensions.width15),
                        child: Container(
                          // ignore: sort_child_properties_last
                          child: TextField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              prefixIcon:
                                  Icon(Icons.mail, color: Color(0xFF89dad0)),
                              border: OutlineInputBorder(),
                              hintText: 'Email',
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20),
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
                        height: Dimensions.height15,
                      ),
                      //password input
                      Padding(
                        padding: EdgeInsets.only(
                            left: Dimensions.width15,
                            right: Dimensions.width15),
                        child: Container(
                          // ignore: sort_child_properties_last
                          child: TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.password,
                                  color: Color(0xFF89dad0)),
                              border: OutlineInputBorder(),
                              hintText: 'Password',
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20),
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
                        height: Dimensions.height20,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(right: Dimensions.width15),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(RouteHelper.getForgetPage());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Forget Password?",
                                    style: TextStyle(
                                      fontSize: Dimensions.fontSize20,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.height30 * 2,
                            ),
                            Center(
                                child: Container(
                              height: 80,
                              decoration: BoxDecoration(
                                  color: AppColors.mainColor,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius20)),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: Dimensions.height20,
                                    bottom: Dimensions.height20,
                                    right: Dimensions.width30 * 2,
                                    left: Dimensions.width30 * 2),
                                child: GestureDetector(
                                  onTap: () async {
                                    print("i Am touched");
                                    try {
                                      await Auth().signInWithEmailAndPassword(
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                      );
                                    } on FirebaseAuthException catch (e) {
                                      if (e.code == 'user-not-found') {
                                        Get.snackbar(
                                            "Login Error", "User Not Found",
                                            backgroundColor:
                                                AppColors.mainColor,
                                            colorText: Colors.white);
                                      } else if (e.code == "wrong-password") {
                                        print("this is error" +
                                            e.code.toString());
                                        Get.snackbar("Login Error",
                                            e.code.toString().toUpperCase());
                                      } else {
                                        print("this is error" +
                                            e.code.toString());
                                        Get.snackbar("Login Error",
                                            e.code.toString().toUpperCase());
                                      }
                                    }
                                    if (Auth().currentUser != null) {
                                      Get.toNamed(RouteHelper.getInitial());
                                    }
                                  },
                                  child: BigText(
                                    text: "Sign In",
                                    // style: TextStyle(fontSize: Dimensions.fontSize16 * 2,),
                                    size: Dimensions.fontSize16 * 2,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height30,
                      ),
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: Dimensions.width30 * 2,
                              right: Dimensions.width20),
                          child: Row(
                            children: [
                              BigText(
                                text: "Don't have an account?",
                                size: Dimensions.fontSize20,
                                color: Colors.grey,
                              ),
                              GestureDetector(
                                onTap: () {
                                  //print("i am tapped in register");
                                  Get.toNamed(RouteHelper.getRegisterPage());
                                },
                                child: BigText(
                                  text: "Create",
                                  size: Dimensions.fontSize20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
