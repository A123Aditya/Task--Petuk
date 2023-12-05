import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/firebase_options.dart';
import 'package:twosum/twosum.dart';
import 'package:twosum/substraction.dart';

import 'Upload/File Picker/filepicker.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final num1 = TextEditingController();
  final num2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextFieldWidget(
              firstNumberController: num1,
              secondNumberController: num2,
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            heroTag: "subtraction_button", // Assign a unique hero tag
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Substraction(),
                ),
              );
            },
            child: Icon(Icons.navigate_next),
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            heroTag: "file_picker_button", // Assign a unique hero tag
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => File_Picker(),
                ),
              );
            },
            child: Icon(Icons.upload_file),
          ),
        ],
      ),
    );
  }
}


class Substraction extends StatefulWidget {
  const Substraction({super.key});

  @override
  State<Substraction> createState() => _SubstractionState();
}

class _SubstractionState extends State<Substraction> {
  final num1 = TextEditingController();
  final num2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomSubtractionTextFieldWidget(
              firstNumberController: num1,
              secondNumberController: num2,
            ),
          )
        ],
      ),
    );
  }
}
