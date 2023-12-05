library twosum;

import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final TextEditingController firstNumberController;
  final TextEditingController secondNumberController;
  final String? labelText;
  final Color? labelTextColor;
  final int? borderRadius;
  final Color? borderColor;
  final Color? cursorColor;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? fontSizeLabelText;

  CustomTextFieldWidget({
    required this.firstNumberController,
    required this.secondNumberController,
    this.labelText,
    this.labelTextColor,
    this.borderRadius,
    this.borderColor,
    this.cursorColor,
    this.keyboardType,
    this.textInputAction,
    this.fontSizeLabelText,
  });

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  int sum = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Sum : $sum", style: TextStyle(fontSize: 40)),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: widget.firstNumberController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelText: 'Enter first number',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: widget.secondNumberController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelText: 'Enter second number',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        ),
        ElevatedButton(
          onPressed: () {
            int firstNumber =
                int.tryParse(widget.firstNumberController.text) ?? 0;
            int secondNumber =
                int.tryParse(widget.secondNumberController.text) ?? 0;
            setState(() {
              sum = firstNumber + secondNumber;
            });
          },
          child: Text('Calculate Sum'),
        ),
      ],
    );
  }
}
