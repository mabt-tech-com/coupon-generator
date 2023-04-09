import 'package:flutter/material.dart';
import 'package:modernlogintute/manage_codes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:modernlogintute/pages/home_page.dart';
import 'package:modernlogintute/paste_code_page.dart';
import 'package:modernlogintute/code_generator_page.dart';
import 'package:modernlogintute/page_one.dart'; 
import 'package:modernlogintute/page_two.dart';
import 'package:modernlogintute/page_three.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      initialRoute: '/home' , // Updated initial route to point to '/home'
      routes: {
        '/': (context) => CodeGeneratorPage(),
        '/home': (context) => HomePage(userId: '61XKB08HxGMZ2fsPTrW0sxXepsq1',key: key),
        '/manage-code': (context) => ManageCodesPage(),
        '/paste-code': (context) => PasteCodePage(),
        '/page-one': (context) => PageOne(),
        '/page-two': (context) => PageTwo(),
        '/page-three': (context) => PageThree(),
      },
    );
  }
}



/*

For Testing !! paste these codes in the home page above !

# User 1 :
username : vmware reporting :
registered methods : email/password , Google
UserId : 61XKB08HxGMZ2fsPTrW0sxXepsq1


# User 2 :
username : ameenbt345
registered methods : Google
UserId : iKolbD13HxVPe9t1NBzcnGzQNfD3

*/

