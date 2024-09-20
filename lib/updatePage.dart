import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class update extends StatefulWidget {
  const update({super.key});

  @override
  State<update> createState() => _homeState();
}

class _homeState extends State<update> {

  final bloodGroup =["A+", "A-", "B+", "B-", "O+", "O-", "AB+", "AB-"];

  String? selectedGroup;



  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back,color: Colors.white,),
          ),
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text("Upedate Donors",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  decoration: InputDecoration(
                    label: Text("Doner Name"),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  decoration: InputDecoration(
                    label: Text("Doner Number"),
                    border: OutlineInputBorder(),
                  ),
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: DropdownButtonFormField<String>(
                  value: selectedGroup,
                  decoration: InputDecoration(
                    labelText: "Blood Group",
                    border: OutlineInputBorder(),
                  ),
                  items:bloodGroup.map((value) {
                    return DropdownMenuItem<String>(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedGroup =newValue;
                    });
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {

                  Navigator.pop(context);
                },
                child: Text("Update",
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
              ),
            ],
            ),
        );
    }
}