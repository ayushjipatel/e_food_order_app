import 'package:e_milkapp/route/route_handler.dart';
import 'package:e_milkapp/services/auth.dart';
import 'package:e_milkapp/utilities/app_constants.dart';
import 'package:e_milkapp/utilities/colors.dart';
import 'package:e_milkapp/utilities/dimensions.dart';
import 'package:e_milkapp/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await Auth().signOut();
              Get.toNamed(RouteHelper.getLoginPage());
            },
            icon: Icon(
              Icons.logout,
              size: Dimensions.height10 * 3,
            ),
          ),
        ],
        title: BigText(
          text: 'Profile',
          size: Dimensions.fontSize26,
        ),
        backgroundColor: AppColors.mainColor,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: Dimensions.height15),
        child: Column(
          children: [
            Center(
              child: Container(
                height: Dimensions.height45 * 4,
                width: Dimensions.width30 * 8,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage('assets/image/profile.png'),
                        fit: BoxFit.cover),
                    shape: BoxShape.circle,
                    // border: Border.all(width: 1, color: Colors.red),
                    color: AppColors
                        .mainColor), // child: BigText(text: 'helool '),
              ),
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            //name
            Padding(
              padding: EdgeInsets.only(
                  left: Dimensions.width15, right: Dimensions.width15),
              child: Container(
                height: Dimensions.height30 * 2,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20 / 2),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.person_sharp,
                        color: AppColors.mainColor,
                      ),
                      SizedBox(
                        width: Dimensions.width15,
                      ),
                      BigText(
                        text: 'Name',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            //phone no
            Padding(
              padding: EdgeInsets.only(
                  left: Dimensions.width15, right: Dimensions.width15),
              child: Container(
                height: Dimensions.height30 * 2,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20 / 2),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: AppColors.mainColor,
                      ),
                      SizedBox(
                        width: Dimensions.width15,
                      ),
                      BigText(
                        text: 'Phone',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            //email
            Padding(
              padding: EdgeInsets.only(
                  left: Dimensions.width15, right: Dimensions.width15),
              child: Container(
                height: Dimensions.height30 * 2,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20 / 2),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.email,
                        color: AppColors.mainColor,
                      ),
                      SizedBox(
                        width: Dimensions.width15,
                      ),
                      BigText(
                        text: 'Email',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            //address
            Padding(
              padding: EdgeInsets.only(
                  left: Dimensions.width15, right: Dimensions.width15),
              child: Container(
                height: Dimensions.height30 * 2,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20 / 2),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: AppColors.mainColor,
                      ),
                      SizedBox(
                        width: Dimensions.width15,
                      ),
                      BigText(
                        text: 'Address',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            //message
            Padding(
              padding: EdgeInsets.only(
                  left: Dimensions.width15, right: Dimensions.width15),
              child: Container(
                height: Dimensions.height30 * 2,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20 / 2),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.message,
                        color: AppColors.mainColor,
                      ),
                      SizedBox(
                        width: Dimensions.width15,
                      ),
                      BigText(
                        text: 'Message',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            //edit profiel
            Padding(
              padding: EdgeInsets.only(
                  left: Dimensions.width15, right: Dimensions.width15),
              child: Container(
                height: Dimensions.height30 * 2,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20 / 2),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.edit,
                        color: AppColors.mainColor,
                      ),
                      SizedBox(
                        width: Dimensions.width15,
                      ),
                      BigText(
                        text: 'Edit Profile',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
          ],
        ),
      ),
    );
  }
}
