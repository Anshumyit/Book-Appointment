import 'package:flutter/material.dart';

class LabelDialog extends StatefulWidget {
  const LabelDialog({Key? key}) : super(key: key);

  @override
  _LabelDialogState createState() => _LabelDialogState();
}

class _LabelDialogState extends State<LabelDialog> {
  final List<TextEditingController> _controllers = [TextEditingController()];

  // Add a new TextField
  void _addNewTextField() {
    setState(() {
      _controllers.add(TextEditingController());
    });
  }

  // Delete a specific TextField
  void _deleteTextField(int index) {
    setState(() {
      _controllers.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Choose labels to display in sequence. You can also set the order of the labels.",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            // Dynamically Rendered TextFields
            Column(
              children: _controllers.asMap().entries.map((entry) {
                int index = entry.key;
                TextEditingController controller = entry.value;
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Column(
                    children: [
                      Text('Add New label'),
                      TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          hintText: "Contacted",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _deleteTextField(index),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 8),
            // "+" Button to Add Another TextField
            ElevatedButton(
              onPressed: _addNewTextField,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(12),
                shape: const CircleBorder(),
                backgroundColor: Colors.blue,
              ),
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
