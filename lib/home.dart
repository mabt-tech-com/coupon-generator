import 'package:flutter/material.dart';
import 'package:modernlogintute/code_generator_page.dart';
import 'package:modernlogintute/manage_codes.dart';
import 'package:modernlogintute/paste_code_page.dart';
import 'package:modernlogintute/page_one.dart';
import 'package:modernlogintute/page_two.dart';
import 'package:modernlogintute/page_three.dart';


class HomePage extends StatefulWidget {
  //final User user;


//required this.user
  const HomePage({Key? key }) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  @override
  void initState() {
    super.initState();


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Welcome",
            style: TextStyle(fontSize: 16),
          ),
        ),
        backgroundColor: Colors.deepPurple[200],
        elevation: 0,
        actions: [
          TextButton.icon(
            onPressed: (){
              print("Sign out button Pressed !!");
            },
            icon: const Icon(Icons.logout, color: Colors.white),
            label: const Text(
              "Logout",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  // Use the user's profile picture URL as the image source
                  image: NetworkImage('https://i.imgur.com/a73xXCl.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ManageCodesPage(),
                  ),
                );
              },
              child: const Text('Manage Codes Page'),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepOrangeAccent,),
            ),

            const SizedBox(height: 20),

            const  Text(
              "Generate Code to be redirected !! ",
              style: const TextStyle(fontSize: 14),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CodeGeneratorPage(),
                  ),
                );
              },
              child: const Text('Code Generator Page '),
            ),

            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PasteCodePage(),
                  ),
                );
              },
              child: const Text('Paste Code Page'),
            ),

            const SizedBox(height: 10),

            const  Text(
              "My pages :",
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageOne(),
                  ),
                );
              },
              child: const Text('Page 1'),
            ),


            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageTwo(),
                  ),
                );
              },
              child: const Text('Page 2'),
            ),


            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageThree(),
                  ),
                );
              },
              child: const Text('Page 3'),
            ),

            const SizedBox(height: 20),


          ],
        ),
      ),
    );
  }
}


