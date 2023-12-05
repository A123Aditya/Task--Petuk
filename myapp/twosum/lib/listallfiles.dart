import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'Model/file.dart';

class GetFilesWidget extends StatefulWidget {
  const GetFilesWidget({Key? key}) : super(key: key);

  @override
  _GetFilesWidgetState createState() => _GetFilesWidgetState();
}

class _GetFilesWidgetState extends State<GetFilesWidget> {
  List<FileDescription> filedescription = [];

  @override
  void initState() {
    super.initState();
    getfile();
  }

  Future getfile() async {
    List<FileDescription> temp = [];
    final storageRef = FirebaseStorage.instance.ref().child("Imagefile/");
    final listResult = await storageRef.listAll();

    for (var item in listResult.items) {
      String download = await item.getDownloadURL();
      print(download);
      temp.add(FileDescription(
        filedescription: item.fullPath,
        downloadurl: download,
      ));
    }

    setState(() {
      filedescription = temp;
    });
  }

  Future deletefile(String filename) async {
    final storageRef = FirebaseStorage.instance.ref();
    final desertRef = storageRef.child(filename);

    // Delete the file
    await desertRef.delete();
    setState(() {
      filedescription.removeWhere((file) => file.filedescription == filename);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: filedescription.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title:
                  Text('File Name: ${filedescription[index].filedescription}'),
              subtitle: Text('Location: Imagefile/'),
              leading: Image.network(
                filedescription[index].downloadurl,
                errorBuilder: (context, error, stackTrace) {
                  print("Error loading image: $error");
                  return const SizedBox();
                },
                width: 100,
                height: 100,
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  deletefile(filedescription[index].filedescription);
                },
                child: Icon(Icons.delete),
              ),
            ),
          );
        },
      ),
    );
  }
}
