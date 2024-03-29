// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:getwidget/shape/gf_textfield_shape.dart';

class LSFormField extends StatelessWidget {
  LSFormField({
    super.key,
    this.type = GfFormFieldType.text,
    required this.hint,
    this.controller,
  });

  final GfFormFieldType type;
  final String hint;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return GfFormField(
      controller: controller,
      gfFormFieldType: type,
      editingbordercolor: Colors.black,
      idlebordercolor: Colors.black,
      borderwidth: 2,
      hintText: hint,
      shape: GFTextFieldShape.square,
      backgroundcolor: Colors.white.withOpacity(0.9),
    );
  }
}
