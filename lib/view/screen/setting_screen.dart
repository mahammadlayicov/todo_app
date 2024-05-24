import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/theme_provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text("Setting")),
        body: Column(
          children: [
            ListTile(
              leading: Icon(CupertinoIcons.moon_stars_fill),
              title: Text("Dark theme"),
              trailing: Consumer<ThemeProvider>(
                builder: (context, provider, child) {
                  return Switch(
                      value: provider.value,
                      onChanged: (value) {
                        provider.changeValue();
                      });
                },
              ),
            )
          ],
        ));
  }
}
