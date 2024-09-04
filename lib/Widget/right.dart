import 'package:flutter/material.dart';

class Right extends StatelessWidget {
  final double rightWidth;
  const Right({
    super.key,
    required this.rightWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: rightWidth,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.yellow,
          border: Border.all(),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
      ),
    );
  }
}
