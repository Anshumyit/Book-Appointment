import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginb/view/DialogBox1.dart';
import 'package:loginb/view/dialogbox.dart';



class DialerListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Dialer List'),
        leading: const BackButton(),
      ),
      body: Column(
        children: [
          // Tab and search bar section
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Container(
                  height: 55,
                  width: 60,
                  child: Card(
                    color: Colors.white,
                    child: Center(child: Text('All')),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child:  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search),
                      contentPadding: const EdgeInsets.symmetric(vertical: 5), // Reduces height
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Dialer List
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Number of items
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    leading: Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                    title: Text('Sejal Karad ${index + 1}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.info, color: Colors.orange),
                          onPressed: () {
                            showExcelImport(context);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.call, color: Colors.blue),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.copy, color: Colors.green),
                          onPressed: () {
                            showExcelImportDialog(context);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void showExcelImportDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ExcelImportDialog(),
    );
  }
  void showExcelImport(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) =>LabelDialog(),
    );
  }
}

