import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppInput extends StatelessWidget {
  final String? label;
  final TextFormField textFormField;

  const AppInput({
    Key? key,
    this.label,
    required this.textFormField,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: label != null,
          child: Text(
            label != null ? label! : '',
            style: Get.textTheme.headline2,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        textFormField,
      ],
    );
  }
}
