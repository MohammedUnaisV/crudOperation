import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AddPage.dart';
import 'Maine Provider/maineprovider.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text(
            " Home Page",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        floatingActionButton:
            Consumer<MainProvider>(builder: (context, value, child) {
          return FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Doners(
                      from: "NEW",
                      oldid: "",
                    ),
                  ));
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            backgroundColor: Colors.red,
          );
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: SingleChildScrollView(
          child: Consumer<MainProvider>(builder: (context, value, child) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ListView.builder(
                    itemCount: value.donerlist.length,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 80,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Text(
                                value.donerlist[index].name,
                                style: TextStyle(color: Colors.white),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(width: 200),
                                  Text(value.donerlist[index].number.toString(),
                                      style: TextStyle(color: Colors.white)),
                                  Row(
                                    children: [
                                      SizedBox(width: 120),
                                      InkWell(
                                          onTap: () {
                                            value.deleteDoner(
                                                value.donerlist[index].id);
                                          },
                                          child: Icon(
                                            Icons.delete,
                                            size: 20,
                                            color: Colors.white,
                                          )),
                                      SizedBox(width: 20),
                                      InkWell(
                                          onTap: () {
                                            value.EditDoner(value
                                                .donerlist[index].id
                                                .toString());
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => Doners(
                                                    from: "EDIT",
                                                    oldid: value
                                                        .donerlist[index].id
                                                        .toString(),
                                                  ),
                                                ));
                                          },
                                          child: Icon(
                                            Icons.edit,
                                            size: 20,
                                            color: Colors.white,
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                value.donerlist[index].location,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          }),
        ));
  }
}
