import 'dart:async';
import 'package:crud123/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Maine Provider/maineprovider.dart';

   Future<void> main()async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
     options: FirebaseOptions(
         apiKey: "AIzaSyASDOpAU8lA_Pnm78ZhrW8lcznfJ4Rz8Ck",
         appId: "1:175883160736:android:aebd069e6a3167ca9d0dc5",
         messagingSenderId: "175883160736",
         projectId:"crud-operation-c7efd",
       storageBucket:"crud-operation-c7efd.appspot.com",
     )
   );
   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),

        home: spalash(),
      )
    );
  }
}

