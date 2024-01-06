import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  final Function()? onTap;

  const SwitchButton({super.key, this.onTap});

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool light = true;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Switch(
        // This bool value toggles the switch.
        value: light,
        activeColor: AppColors.primarycolor,
        onChanged: (bool value) {
          // This is called when the user toggles the switch.
          setState(() {
            light = value;
          });
        },
      ),
    );
  }
}
