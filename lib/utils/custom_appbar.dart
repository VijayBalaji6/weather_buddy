import 'package:flutter/material.dart';

AppBar myAppBar(
    {required String title,
    bool isHome = false,
    bool needLeading = false,
    IconData? leadIcon,
    required VoidCallback leadIconAction}) {
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
        : const SizedBox(),
    actions: [IconButton(onPressed: leadIconAction, icon: Icon(leadIcon))],
  );
}
