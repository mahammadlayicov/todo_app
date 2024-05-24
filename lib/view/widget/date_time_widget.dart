import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/theme/text_styles.dart';

class DateTimeWidget extends StatelessWidget {
  final String title;
  final String valueTitle;
  final IconData icon;
  final VoidCallback ontap;
  const DateTimeWidget({
    super.key,
    required this.title,
    required this.valueTitle,
    required this.icon,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: CustomTextStyles.headlineSmallOne,
          ),
          Gap(6),
          Material(
            child: Ink(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: InkWell(
                onTap: ontap,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [Icon(icon), Gap(12), Text(valueTitle)],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
