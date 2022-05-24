import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class secondpage extends StatefulWidget {
  const secondpage({Key? key}) : super(key: key);

  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  TextEditingController Name = TextEditingController();
  TextEditingController Number = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Editing page',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: TextField(
              controller: Name,
              decoration: InputDecoration(
                  hintText: 'Contact Name',
                  labelText: 'Name',
                  errorText: ms ? 'Blank Your Name' : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Colors.black, width: 3),
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: TextField(
                controller: Number,
                decoration: InputDecoration(
                    hintText: 'Contact Number',
                    labelText: 'Number',
                    errorText: mk ? 'Blank Your Number' : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.black, width: 3),
                    ))),
          ),
          ElevatedButton(
            onPressed: () {
              String nName = Name.text;
              String nNumber = Number.text;

              setState(() {
                if (nName.isEmpty) {
                  ms = true;
                } else if (nNumber.isEmpty) {
                  mk = true;
                } else {
                  ms = false;
                  mk = false;
                }
              });
            },
            child: Container(
              height: 20,
              width: 50,
              child: Center(
                child: Text('Get'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool ms = false;
  bool mk = false;
}
