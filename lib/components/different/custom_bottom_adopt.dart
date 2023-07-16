import 'package:flutter/material.dart';

class CustomButtonAdopt extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomButtonAdopt({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: Column(
        children: [
          const Text("adopt"),
          SizedBox(
            height: 50,
            child: IconButton(
              onPressed: onPressed,
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              color: Colors.white,
              iconSize: 30,
              splashRadius: 25,
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              alignment: Alignment.center,
              tooltip: 'Adopt',
              splashColor: Colors.red,
              highlightColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}