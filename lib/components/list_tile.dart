import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;

  const MyListTile(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.grey,
        ),
        title: Text(title),
        onTap: onTap,
      ),
    );
  }
}
