import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';


class PasteCodePage extends StatefulWidget {
  @override
  _PasteCodePageState createState() => _PasteCodePageState();
}

class _PasteCodePageState extends State<PasteCodePage> {
  final _formKey = GlobalKey<FormState>();
  final codeController = TextEditingController();

  void applyCode() async {
    if (_formKey.currentState!.validate()) {
      final code = codeController.text;

      // Check if the code exists in Firestore.
      final snapshot =
          await FirebaseFirestore.instance.collection('codes').doc(code).get();
      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>;
        final pageRedirect = data['page_redirect'];

        // Delete the code from Firestore so it can't be used again.
        await snapshot.reference.delete();

        // Navigate to the appropriate page.
        Navigator.pushNamed(context, pageRedirect);
      } else {

        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Invalid Code'),
            content: const Text('The code you entered is not valid.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paste Code'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              TextFormField(
                controller: codeController,
                decoration: const InputDecoration(
                  labelText: 'Code',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the code';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: applyCode,
                child: const Text('Apply Code'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



