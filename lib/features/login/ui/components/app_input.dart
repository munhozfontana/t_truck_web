import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppInput extends StatelessWidget {
  final String? label;

  const AppInput({
    Key? key,
    this.label,
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
        SizedBox(
          height: 8,
        ),
        TextFormField(),
      ],
    );
  }
}
