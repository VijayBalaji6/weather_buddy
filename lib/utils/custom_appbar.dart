import 'package:flutter/material.dart';

AppBar myAppBar({required String title, bool isHome = false}) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
    ),
    centerTitle: true,
    leading: GestureDetector(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [Icon(Icons.arrow_back_ios_outlined),Text("Back"), ],
      ),
    ),
  );
}
