// widgets/common_app_bar.dart

// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';

class CommonApp extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onLogout;

  const CommonApp({Key? key, required this.title, required this.onLogout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: Colors.lightBlue[700],
      actions: [
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: onLogout,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
