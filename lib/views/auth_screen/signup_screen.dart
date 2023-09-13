import 'package:e_mart_app/consts/consts.dart';
import 'package:e_mart_app/widgets_common/applogo_widget.dart';
import 'package:e_mart_app/widgets_common/bg_widget.dart';
import 'package:e_mart_app/widgets_common/custom_textfield.dart';
import 'package:e_mart_app/widgets_common/our_button.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            applogoWidget(),
            10.heightBox,
            "Sign up in $appname".text.fontFamily(bold).white.size(22).make(),
            10.heightBox,
            Column(
              children: [
                customTextField(hint: nameHint, title: name),
                customTextField(hint: emailHint, title: email),
                customTextField(hint: passwordhint, title: password),
                customTextField(hint: passwordhint, title: retypePassword),
                5.heightBox,
                Row(
                  children: [
                    Checkbox(
                        activeColor: redColor,
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        }),
                    10.widthBox,
                    Expanded(
                        child: RichText(
                      text: const TextSpan(children: [
                        TextSpan(
                            text: "I agree to the ",
                            style: TextStyle(
                              fontFamily: bold,
                              color: fontGrey,
                            )),
                        TextSpan(
                            text: "Terms and Conditions ",
                            style: TextStyle(
                              fontFamily: bold,
                              color: redColor,
                            )),
                        TextSpan(
                            text: "& ",
                            style: TextStyle(
                              fontFamily: bold,
                              color: fontGrey,
                            )),
                        TextSpan(
                            text: "Privacy Policy ",
                            style: TextStyle(
                              fontFamily: bold,
                              color: redColor,
                            ))
                      ]),
                    ))
                  ],
                ),
                ourButton(
                        color: redColor,
                        title: signup,
                        textColor: whiteColor,
                        onPress: () {})
                    .box
                    .width(context.screenWidth - 50)
                    .make(),
                5.heightBox,
              ],
            )
                .box
                .white
                .rounded
                .padding(const EdgeInsets.all(16))
                .width(context.screenWidth - 70)
                .make(),
          ],
        ),
      ),
    ));
  }
}
