import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/radio_provider.dart';

class RadioWidget extends StatelessWidget {
  final String titleRadio;
  final Color color;
  final int value;
  final VoidCallback onChangeValue;

  RadioWidget({
    Key? key,
    required this.titleRadio,
    required this.color,
    required this.value,
    required this.onChangeValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Theme(
        data: ThemeData(unselectedWidgetColor: color),
        child: Consumer<RadioProvider>(
          builder: (context, radioProvider, child) {
            return RadioListTile(
              activeColor: color,
              contentPadding: EdgeInsets.zero,
              title: Transform.translate(
                offset: Offset(-22, 0),
                child: Text(
                  titleRadio,
                  style: TextStyle(
                      color: color, fontSize: 14, fontWeight: FontWeight.w700),
                ),
              ),
              value: value,
              groupValue: radioProvider.selectedValue,
              onChanged: (newValue) {
                onChangeValue();
                radioProvider.setSelectedValue(value);
              },
            );
          },
        ),
      ),
    );
  }
}
