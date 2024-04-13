// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:weather_buddy/constants/colors.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool needLeadingIcon;
  final IconData? leadIcon;
  final VoidCallback? leadIconAction;
  final IconData? trailingIcon;
  final VoidCallback? trailingIconAction;

  const MyAppBar({
    Key? key,
    required this.title,
    required this.needLeadingIcon,
    this.leadIcon,
    this.leadIconAction,
    this.trailingIcon,
    this.trailingIconAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
            color: AppColor.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: needLeadingIcon
          ? IconButton(
              onPressed: leadIconAction,
              icon: Icon(
                leadIcon ?? Icons.arrow_back_ios_outlined,
                size: 15,
              ))
          : null,
      actions: trailingIcon != null
          ? [
              IconButton(
                  onPressed: trailingIconAction,
                  icon: Icon(
                    trailingIcon,
                    size: 15,
                  ))
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
