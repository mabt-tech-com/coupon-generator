import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../user_crud/add_user.dart';
import '../user_crud/read_users.dart';
import 'package:modernlogintute/code_generator_page.dart';
import 'package:modernlogintute/manage_codes.dart';
import 'package:modernlogintute/paste_code_page.dart';
import 'package:modernlogintute/page_one.dart'; 
import 'package:modernlogintute/page_two.dart';
import 'package:modernlogintute/page_three.dart';


class HomePage extends StatefulWidget {
  //final User user;
  final String userId;

//required this.user
  const HomePage({Key? key, required this.userId}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;


  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  void initState() {
    super.initState();
    getUserData();

  }


  Future<void> getUserData() async {
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();
    setState(() {
      //User = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            user.email!,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        backgroundColor: Colors.deepPurple[200],
        elevation: 0,
        actions: [
          TextButton.icon(
            onPressed: signUserOut,
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
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  // Use the user's profile picture URL as the image source
                  image: NetworkImage(
                      user.photoURL ?? 'https://i.imgur.com/a73xXCl.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Email: ${user.email}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 8),
            Text(
              "User Display Name : ${user.displayName}",
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 20),


            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReadUsersPage(),
                  ),
                );
              },
              child: const Text('View All users page'),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepOrangeAccent,),
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

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddUserPage(),
                  ),
                );
              },
              child: const Text('Add New User '),
            ),


            const SizedBox(height: 30),

            const  Text(
              "My New pages ( Code Generator ) ",
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


