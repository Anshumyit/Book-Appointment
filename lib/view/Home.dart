import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginb/proposal.dart';
import 'package:loginb/view/CallHistory.dart';
import 'package:loginb/view/NewContact.dart';
import 'package:loginb/view/NotQualified.dart';
import 'package:loginb/view/QualifiedPage.dart';

class Home extends StatelessWidget {
  final List<String> labels = [
    "New Contact",
    "Qualified",
    "Not Qualified",
    "Proposal",
    "Follow Up",
    "Test Label",
    "Test Demo Label 1",
    "Report",
  ];

  final List<Widget> pages = [
    NewContact(),
    Qualifiedpage(),
    Notqualified(),
    Proposal()

    // Add additional pages for other labels as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Call Info"),

        actions: [
          Padding(
            padding:EdgeInsets.only(
                right: MediaQuery.of(context).size.width*.05),
            child: InkWell(
              onTap: (){
                Get.to(()=>Callhistory());
              },
                child: Icon(Icons.filter_list)),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: labels.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width*.02,
                vertical: MediaQuery.of(context).size.height*.005),
            child: GestureDetector(
              onTap: () {
                // Handle item tap
                if (index < pages.length) {
                  Get.to(() => pages[index]);
                } else {
                  print("${labels[index]} tapped");
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: index == 1 ? Colors.blue : Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    labels[index],
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

