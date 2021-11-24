import 'package:flutter/material.dart';

class textField extends StatelessWidget {

  String? hint;

  TextEditingController? controller;

  bool? isTextArea;

  bool? isEnabled;

  double? width;

  TextInputType? keyboardType;

  textField({this.hint, this.controller, this.isTextArea,
    this.isEnabled, this.keyboardType , this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      height: isTextArea != null ? 120 : 50,
      child: TextFormField(
        keyboardType: keyboardType ?? TextInputType.multiline,
        controller: controller,
        enabled: isEnabled ?? true,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(fontSize: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        maxLines: isTextArea != null ? 20 : 1,
      ),
    );
  }
}
