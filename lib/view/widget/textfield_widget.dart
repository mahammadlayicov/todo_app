import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  int maxLines;
  String title;
  final TextEditingController textEditingController;

  TextFieldWidget({
    Key? key,
    required this.maxLines,
    required this.title,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
            color: Colors.grey,
            width: 1),
      ),
      child: TextField(
        controller: textEditingController,
        maxLines: maxLines,
        decoration: InputDecoration(
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          hintText: title,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
