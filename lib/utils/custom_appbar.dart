import 'package:flutter/material.dart';
import 'package:weather_buddy/utils/utils.dart';

AppBar myAppBar(
    {required String title, bool isHome = false, bool needLeading = false}) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
    ),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: needLeading
        ? GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(
                  Icons.arrow_back_ios_outlined,
                  size: 15,
                ),
                Text("Back"),
              ],
            ),
          )
        : null,
    actions: [
      IconButton(onPressed: () {
        CommonUtils.getChangeTheme();
      }, icon: const Icon(Icons.shield_moon))
    ],
  );
}
