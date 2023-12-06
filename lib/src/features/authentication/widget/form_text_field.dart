import 'package:flutter/material.dart';
import 'package:sinus_mpm_application/src/config/constants/constants.dart';

class FormTextField extends StatelessWidget {
  const FormTextField(
      {super.key, required this.text, required this.controller});
  final String text;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            label: Text(
              text,
            ),
            labelStyle: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Color.fromARGB(255, 199, 199, 199),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: CustomColors.primaryColor,
              ),
            ),
            floatingLabelStyle: const TextStyle(
              fontSize: 16,
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: CustomColors.primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
