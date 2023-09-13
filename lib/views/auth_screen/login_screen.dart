import 'package:e_mart_app/consts/consts.dart';
import 'package:e_mart_app/consts/lists.dart';
import 'package:e_mart_app/views/auth_screen/signup_screen.dart';
import 'package:e_mart_app/views/home_screen/home_screen.dart';
import 'package:e_mart_app/widgets_common/applogo_widget.dart';
import 'package:e_mart_app/widgets_common/bg_widget.dart';
import 'package:e_mart_app/widgets_common/custom_textfield.dart';
import 'package:e_mart_app/widgets_common/our_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? _textController;
    String? _passworcontroller;
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            applogoWidget(),
            10.heightBox,
            "Log in to $appname".text.fontFamily(bold).white.size(22).make(),
            10.heightBox,
            Column(
              children: [
                customTextField(
                    hint: emailHint, title: email, controller: _textController),
                customTextField(
                    hint: passwordhint,
                    title: password,
                    controller: _passworcontroller),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {}, child: forgetPass.text.make())),
                5.heightBox,
                ourButton(
                    color: redColor,
                    title: login,
                    textColor: whiteColor,
                    onPress: () {
                      Get.to(HomeScreen());
                    }).box.width(context.screenWidth - 50).make(),
                5.heightBox,
                createNewAccount.text.color(fontGrey).make(),
                5.heightBox,
                ourButton(
                    color: lightGrey,
                    title: signup,
                    textColor: redColor,
                    onPress: () {
                      Get.to(() => const SignupScreen());
                    }).box.width(context.screenWidth - 50).make(),
                10.heightBox,
                loginWith.text.color(fontGrey).make(),
              ],
            )
                .box
                .white
                .rounded
                .padding(const EdgeInsets.all(16))
                .width(context.screenWidth - 70)
                .make(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  3,
                  (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: lightGrey,
                        radius: 25,
                        child: Image.asset(
                          socialIconList[index],
                          width: 30,
                        ),
                      ))),
            )
          ],
        ),
      ),
    ));
  }
}
