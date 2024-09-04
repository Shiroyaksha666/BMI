import 'package:flutter/material.dart';

class Left extends StatelessWidget {
  final double leftWidth;
  const Left({
    super.key,
    required this.leftWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: leftWidth,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.yellow,
          border: Border.all(),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
    );
  }
}
