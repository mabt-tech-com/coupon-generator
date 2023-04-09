import 'dart:math';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class CodeGeneratorPage extends StatefulWidget {
  @override
  _CodeGeneratorPageState createState() => _CodeGeneratorPageState();
}

class _CodeGeneratorPageState extends State<CodeGeneratorPage> {
  final _formKey = GlobalKey<FormState>();
  final pageRedirectController = TextEditingController();
  String generatedCode = '';

  void generateCode() async {
    if (_formKey.currentState!.validate()) {
      final pageRedirect = pageRedirectController.text;
      final code = generateRandomCode();

      // Store the code in Firestore.
      await FirebaseFirestore.instance
          .collection('codes')
          .doc(code)
          .set({'page_redirect': pageRedirect});

      setState(() {
        generatedCode = code;
      });
    }
  }

  String generateRandomCode() {
    final random = Random();
    final codeLength = 6;
    final codeUnits =
    List.generate(codeLength, (index) => random.nextInt(10) + 48);

    return String.fromCharCodes(codeUnits);
  }


  void copyToClipboard() {
    Clipboard.setData(ClipboardData(text: generatedCode));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Code copied to clipboard')),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Code Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),
              TextFormField(
                controller: pageRedirectController,
                decoration: const InputDecoration(
                  labelText: 'Page Redirect',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the page redirect';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16.0),

              const Text('Options are : /page-one , /page-two , /page-three'),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: generateCode,
                child: const Text('Generate Code'),
              ),
              if (generatedCode.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Generated Code: $generatedCode',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.copy),
                        onPressed: copyToClipboard,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
