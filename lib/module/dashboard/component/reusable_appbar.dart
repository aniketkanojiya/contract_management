import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue[900], // Dark blue color
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          'assets/images/magic_logo.png', 
          width: 100,
          height: 30,
        ),
      ),
      leadingWidth: 120,

      actions: <Widget>[
        IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Handle menu icon pressed
          },
        ),
      ],
    );
  }
}
