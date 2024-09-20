import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'HomePage.dart';
import 'Maine Provider/maineprovider.dart';

class spalash extends StatefulWidget {
  const spalash({super.key});

  @override
  State<spalash> createState() => _spalashState();
}
class _spalashState extends State<spalash> {
  @override

  void initState(){
    super.initState();


    Future.delayed(Duration(seconds: 2),() {
      MainProvider provider=
      Provider.of<MainProvider>(context,listen:false);
      provider.getdoner();

      Navigator.push(context, MaterialPageRoute(builder: (context) => home(),));
    },);
  }
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:180,top: 300),
            child: Text(" Splach Screen",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 20

            ),
            ),
          )
        ],
      ),
    );
  }
}
