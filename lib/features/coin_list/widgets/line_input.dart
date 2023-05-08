import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

import 'package:waddi/utils/color_mannager.dart';

class LineInputText extends StatefulWidget {
  final bool autofocus;
  final String label;
  final String? Function(String?)? validator;
  final Function(String)? change;
  final String? initialValue;
  final bool isSecure;
  final bool isEnabled;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final FocusNode? focusFieldNode;
  final TextInputType inputType;
  final double fontSize;
  final bool isMoney;
  const LineInputText({
    required Key key,
    required this.label,
    required this.validator,
    this.change,
    this.autofocus = false,
    this.isSecure = false,
    this.isEnabled = true,
    this.isMoney = false,
    this.inputType = TextInputType.text,
    this.fontSize = 17,
    this.initialValue,
    this.controller,
    this.focusFieldNode,
    this.textInputAction = TextInputAction.next,
  }) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _LineInputTextState createState() => _LineInputTextState();
}

class _LineInputTextState extends State<LineInputText> {
  final doneFieldFocus = FocusNode();

  List<TextInputFormatter> inputFormatters = [];

  @override
  void dispose() {
    doneFieldFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        inputFormatters: inputFormatters,
        focusNode: widget.focusFieldNode ?? doneFieldFocus,
        controller: widget.controller,
        initialValue: widget.initialValue,
        autofocus: widget.autofocus,
        enabled: widget.isEnabled,
        keyboardType: widget.inputType,
        textInputAction: widget.textInputAction,
        validator: widget.validator,
        obscureText: widget.isSecure,
        onChanged: widget.change,
        style: GoogleFonts.roboto(color: Colors.black),
        decoration: InputDecoration(
          border: InputBorder.none,
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorManager.error),
          ),
          alignLabelWithHint: true,
          labelStyle: TextStyle(
            fontSize: widget.fontSize,
            color: Colors.black54,
          ),
          labelText: widget.label,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        ),
      ),
    );
  }
}

class DecimalTextInputFormatter extends TextInputFormatter {
  final int? decimalRange;

  DecimalTextInputFormatter({this.decimalRange = 0});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, // unused.
    TextEditingValue newValue,
  ) {
    print('formating...');
    TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    if (decimalRange != null) {
      String value = newValue.text;

      if (value.contains(".") &&
          value.substring(value.indexOf(".") + 1).length > decimalRange!) {
        truncated = oldValue.text;
        newSelection = oldValue.selection;
      } else if (value == ".") {
        truncated = "0.";

        newSelection = newValue.selection.copyWith(
          baseOffset: math.min(truncated.length, truncated.length + 1),
          extentOffset: math.min(truncated.length, truncated.length + 1),
        );
      }

      return TextEditingValue(
        text: truncated,
        selection: newSelection,
        composing: TextRange.empty,
      );
    }
    return newValue;
  }
}
