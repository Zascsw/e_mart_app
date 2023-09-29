import 'package:e_mart_app/consts/consts.dart';
import 'package:e_mart_app/widgets_common/applogo_widget.dart';
import 'package:e_mart_app/widgets_common/bg_widget.dart';
import 'package:e_mart_app/widgets_common/custom_textfield.dart';
import 'package:e_mart_app/widgets_common/our_button.dart';
import 'package:e_mart_app/widgets_common/snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailTextInputController = TextEditingController();
  TextEditingController passwordTextInputController = TextEditingController();
  TextEditingController passwordTextRepeatInputController =
      TextEditingController();
  bool isChecked = false;
  final formKey = GlobalKey<FormState>();

  void dispose() {
    emailTextInputController.dispose();
    passwordTextInputController.dispose();
    passwordTextRepeatInputController.dispose();

    super.dispose();
  }

  Future<void> signUp() async {
    final navigator = Navigator.of(context);

    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    if (passwordTextInputController.text !=
        passwordTextRepeatInputController.text) {
      SnackBarService.showSnackBar(
        context,
        'Пароли должны совпадать',
        true,
      );
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailTextInputController.text.trim(),
        password: passwordTextInputController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e.code);

      if (e.code == 'email-already-in-use') {
        SnackBarService.showSnackBar(
          context,
          'Такой Email уже используется, повторите попытку с использованием другого Email',
          true,
        );
        return;
      } else {
        SnackBarService.showSnackBar(
          context,
          'Неизвестная ошибка! Попробуйте еще раз или обратитесь в поддержку.',
          true,
        );
      }
    }

    navigator.pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Center(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    (context.screenHeight * 0.1).heightBox,
                    applogoWidget(),
                    10.heightBox,
                    "Sign up in $appname"
                        .text
                        .fontFamily(bold)
                        .white
                        .size(22)
                        .make(),
                    10.heightBox,
                    Column(
                      children: [
                        customTextField(
                          hint: emailHint,
                          title: email,
                          controller: emailTextInputController,
                          validator: (email) =>
                              email != null && !EmailValidator.validate(email)
                                  ? 'Введите правильный Email'
                                  : null,
                        ),
                        customTextField(
                            hint: passwordhint,
                            title: password,
                            controller: passwordTextInputController),
                        customTextField(
                          hint: passwordhint,
                          title: retypePassword,
                          controller: passwordTextRepeatInputController,
                        ),
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
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: redColor),
                          onPressed: signUp,
                          child: const Center(child: Text('Регистрация')),
                        ),
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
            )));
  }
}
