import 'package:contactboom/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';

class secondpage extends StatefulWidget {
  const secondpage({Key? key}) : super(key: key);



  @override
  State<secondpage> createState() => _secondpageState();


}

class _secondpageState extends State<secondpage> {


  TextEditingController Name = TextEditingController();
  TextEditingController Number = TextEditingController();

  Database? db;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdatabase();
  }

  getdatabase()
  {
    helper().Getdatabase().then((value)  {

      setState(() {
        db = value;
      });

    } );
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Page',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: TextField(
              controller: Name,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: 'Contact Name',
                  labelText: 'Name',
                  errorText: ms ? 'Enter Your Name' : null,
                  border: OutlineInputBorder(
                   // borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Colors.black, width: 3),
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: TextField(
                controller: Number,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'Contact Number',
                    labelText: 'Number',
                    errorText: mk ? 'Enter Your Number' : null,
                    border: OutlineInputBorder(
                     // borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.black, width: 3,),
                    ))),
          ),
          ElevatedButton(
            onPressed: () {
              String nName = Name.text;
              String nNumber = Number.text;


              helper().insertdata(nName,nNumber,db!);


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
              height: 30,
              width: 60,
              child: Center(
                child: Text('Save'),
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
