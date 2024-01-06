import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppIconButtonsScreenActivity extends StatelessWidget {
  final IconData icondata;
  void Function()? onTap;
  final double? size;
  final Color? color;
  AppIconButtonsScreenActivity({
    super.key,
    required this.icondata,
    this.onTap,
    this.color,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icondata,
        size: size,
        color: color ?? Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
