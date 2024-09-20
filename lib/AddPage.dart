// import 'package:flutter/cupertino.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import 'Maine Provider/maineprovider.dart';
//
// class Doners extends StatefulWidget {
//   const Doners({super.key});
//
//   @override
//   State<Doners> createState() => _DonersState();
// }
//
// class _DonersState extends State<Doners> {
//   // final bloodGroup = ["A+", "A-", "B+", "B-", "O+", "O-", "AB+", "AB-"];
//   // String? selectedGroup;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: Icon(Icons.arrow_back, color: Colors.white),
//           ),
//           backgroundColor: Colors.red,
//           centerTitle: true,
//           title: Text(
//             "Add Doners",
//             style: TextStyle(
//               color: Colors.white,
//             ),
//           ),
//         ),
//         body: Consumer<MainProvider>(
//               builder: (context,login,child) {
//                 return Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(15),
//                         child: TextField(
//
//                        controller: login.nameController,
//
//                           decoration: InputDecoration(
//                             labelText: "Doner Name",
//                             border: OutlineInputBorder(),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(15),
//                         child: TextField(
//
//                           controller: login.numberController,
//
//                           decoration: InputDecoration(
//                             labelText: "Doner Number",
//                             border: OutlineInputBorder(),
//                           ),
//                           maxLength: 10,
//                           keyboardType: TextInputType.number,
//                         ),
//                       ),
//
//                       Padding(
//                         padding: const EdgeInsets.all(15),
//                         child: TextField(
//
//                           controller: login.locationController,
//
//                           decoration: InputDecoration(
//                             labelText: "Location",
//                             border: OutlineInputBorder(),
//                           ),
//                         ),
//                       ),
//
//
//
//                       // Padding(
//                       //   padding: const EdgeInsets.all(15),
//                       //   child: DropdownButtonFormField<String>(
//                       //     decoration: InputDecoration(
//                       //       labelText: "Blood Group",
//                       //       border: OutlineInputBorder(),
//                       //     ),
//                       //     items: bloodGroup.map((value) {
//                       //       return DropdownMenuItem<String>(
//                       //         child: Text(value),
//                       //         value: value,
//                       //       );
//                       //     }).toList(),
//                       //     onChanged: (String? newValue) {
//                       //       setState(() {
//                       //         selectedGroup = newValue;
//                       //       });
//                       //     },
//                       //   ),
//                       // ),
//                       Padding(
//                         padding: const EdgeInsets.all(15),
//                         child: ElevatedButton(
//                           onPressed: () {
//
//                             if (login.nameController.text.isEmpty) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(content: Text('Please enter the donor name')),
//                               );
//                               return;
//                             }
//
//                             if (login.numberController.text.isEmpty) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(content: Text('Please enter the donor number')),
//                               );
//                               return;
//                             }
//
//                             if (login.locationController.text.isEmpty) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(content: Text('Please enter the location')),
//                               );
//                               return;
//                             }
//
//                             login.adddoner();
//                             login.getdoner();
//
//                             Navigator.pop(context);
//                           },
//                           child: Text(
//                             "Submit",
//                             style: TextStyle(
//                               color: Colors.white,
//                             ),
//                           ),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.red,
//                           ),
//                         ),
//                       ),
//                     ],
//
//
//                         );
//               }
//             ),
//         );
//     }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Maine Provider/maineprovider.dart';

class Doners extends StatefulWidget {
  final String from;
  final String oldid;
  Doners({super.key,required this.from,required this.oldid});

  @override
  State<Doners> createState() => _DonersState();
}

class _DonersState extends State<Doners> {
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _numberFocusNode = FocusNode();
  final FocusNode _locationFocusNode = FocusNode();

  bool isNameValid = true;
  bool isNumberValid = true;
  bool isLocationValid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text(
          "Add Page",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Consumer<MainProvider>(
        builder: (context, login, child) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: login.nameController,
                  focusNode: _nameFocusNode,
                  decoration: InputDecoration(
                    labelText: "    Name",
                    border: OutlineInputBorder(),
                    errorText: isNameValid ? null : "Please enter the donor name",
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: login.numberController,
                  focusNode: _numberFocusNode,
                  decoration: InputDecoration(
                    labelText: "    Number",
                    border: OutlineInputBorder(),
                    errorText: isNumberValid ? null : "Please enter Valid Phone Number",
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(


                  controller: login.locationController,


                  focusNode: _locationFocusNode,
                  decoration: InputDecoration(
                    labelText: "    Location",
                    border: OutlineInputBorder(),
                    errorText: isLocationValid ? null : "Please enter the location",
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isNameValid = login.nameController.text.isNotEmpty;
                      isNumberValid = login.numberController.text.length==10;
                      isLocationValid = login.locationController.text.isNotEmpty;
                    });

                    if (isNameValid && isNumberValid && isLocationValid) {
                      if(widget.from=="NEW"){
                        login.adddoner(widget.from,"");
                      }
                      else{
                        login.adddoner(widget.from, widget.oldid);
                      }

                      login.getdoner();
                      Navigator.pop(context);
                    } else {
                      if (!isNameValid) {
                        _nameFocusNode.requestFocus();
                      } else if (!isNumberValid) {
                        _numberFocusNode.requestFocus();
                      } else if (!isLocationValid) {
                        _locationFocusNode.requestFocus();
                      }
                    }
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,

                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _numberFocusNode.dispose();
    _locationFocusNode.dispose();
    super.dispose();
  }
}
