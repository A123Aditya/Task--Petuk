import 'package:flutter/material.dart';
import 'package:twosum/listallfiles.dart';

class getfiles extends StatefulWidget {
  const getfiles({super.key});

  @override
  State<getfiles> createState() => _getfilesState();
}

class _getfilesState extends State<getfiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetFilesWidget(),
      ),
    );
  }
}
