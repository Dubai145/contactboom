import 'package:contactboom/second.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: first(),
  ));
}

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Book"),
        centerTitle: true,
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)
                {
            return secondpage();
                },
            ));

          }, child: Icon(Icons.add)),
    );
  }
}
