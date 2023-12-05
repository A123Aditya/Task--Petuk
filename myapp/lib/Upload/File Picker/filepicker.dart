import 'package:flutter/material.dart';
import 'package:myapp/Upload/File%20Picker/Allfiles.dart';
import 'package:twosum/fileupload.dart';

class File_Picker extends StatefulWidget {
  const File_Picker({super.key});

  @override
  State<File_Picker> createState() => File_PickerState();
}

class File_PickerState extends State<File_Picker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FilePickerWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => getfiles(),
              ));
        },
        child: Icon(Icons.more),
      ),
    );
  }
}
