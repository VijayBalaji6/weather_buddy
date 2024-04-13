import 'package:flutter/material.dart';
import 'package:weather_buddy/utils/custom_appbar.dart';
import 'package:weather_buddy/utils/utils.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[500],
        appBar: MyAppBar(
          title: 'Settings',
          leadIconAction: () {},
          leadIcon: Icons.home,
          needLeadingIcon: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            optionPanel(
                optionHeading: 'Theme',
                option1: 'Light',
                option2: 'Dark',
                option1Action: () {
                  CommonUtils.getChangeTheme();
                },
                option2Action: () {
                  CommonUtils.getChangeTheme();
                })
          ],
        ),
      ),
    );
  }
}

Widget optionPanel({
  required String optionHeading,
  required String option1,
  required String option2,
  required VoidCallback option1Action,
  required VoidCallback option2Action,
}) {
  return Card(
    color: Colors.blue[200],
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
      child: Column(
        children: [
          Text(
            optionHeading,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          RadioListTile(
            title: Text(option1),
            value: option1,
            groupValue: option1,
            onChanged: (value) {
              option1Action();
            },
          ),
          RadioListTile(
            title: Text(option2),
            value: option2,
            groupValue: option2,
            onChanged: (value) {
              option2Action;
            },
          )
        ],
      ),
    ),
  );
}
