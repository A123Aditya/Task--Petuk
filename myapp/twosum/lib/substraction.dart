import 'package:flutter/material.dart';

class CustomSubtractionTextFieldWidget extends StatefulWidget {
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

  CustomSubtractionTextFieldWidget({
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
  State<CustomSubtractionTextFieldWidget> createState() =>
      _CustomSubtractionTextFieldWidgetState();
}

class _CustomSubtractionTextFieldWidgetState
    extends State<CustomSubtractionTextFieldWidget> {
  int difference = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Difference : $difference", style: TextStyle(fontSize: 40)),
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
              if (firstNumber + secondNumber > 100) {
                difference = firstNumber - secondNumber;
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Higher Number Needed"),
                  ),
                );
              }
            });
          },
          child: Text('Calculate Difference'),
        ),
      ],
    );
  }
}
