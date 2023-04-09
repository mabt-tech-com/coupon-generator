import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ManageCodesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Codes'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('codes').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final documents = snapshot.data!.docs;
          return DataTable(
            columns: const [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Page Redirect')),
              DataColumn(label: Text('Delete')),
            ],
            rows: documents.map((doc) {
              final id = doc.id;
              final data = doc.data() as Map<String, dynamic>;
              final pageRedirect = data['page_redirect'];

              return DataRow(cells: [
                DataCell(Text(id)),
                DataCell(Text(pageRedirect ?? 'N/A')), // use null-aware operator // Use null-aware operator to handle null value
                DataCell(
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => deleteCode(id),
                  ),
                ),
              ]);

            }).toList(),
          );
        },
      ),
    );
  }

  Future<void> deleteCode(String id) async {
    await FirebaseFirestore.instance.collection('codes').doc(id).delete();
  }
}
