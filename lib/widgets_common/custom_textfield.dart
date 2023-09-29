import 'package:e_mart_app/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

Widget customTextField(
    {String? title,
    String? hint,
    TextEditingController? controller,
    String? Function(String?)? validator}) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    title!.text.color(redColor).fontFamily(semibold).size(16).make(),
    5.heightBox,
    TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
          isDense: true,
          hintStyle:
              const TextStyle(fontFamily: semibold, color: textfieldGrey),
          hintText: hint,
          fillColor: lightGrey,
          filled: true,
          border: InputBorder.none,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: redColor))),
    ),
    5.heightBox,
  ]);
}
