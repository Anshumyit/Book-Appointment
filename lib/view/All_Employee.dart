import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loginb/view/AddEmployees.dart';

class AllEmployee extends StatelessWidget {
  const AllEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'All Employees',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          InkWell(
            onTap: ()=>Get.to(Addemployees()),
            child: Container(
              height: MediaQuery.of(context).size.height*.034,
              width: MediaQuery.of(context).size.width*.07,
              decoration: BoxDecoration(
                color: HexColor('#eff4ff'),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Icon(
                Icons.add,
                size: 15,
                color: HexColor('#7091db'),
              ),
            ),
          ),
          const SizedBox(width: 5),
          Container(
            height: MediaQuery.of(context).size.height*.034,
            width: MediaQuery.of(context).size.width*.07,
            decoration: BoxDecoration(
              color: HexColor('#eff4ff'),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Image.asset('images/menu50.png'),
          ),
          const SizedBox(width: 5),
          Container(
            height: MediaQuery.of(context).size.height*.034,
            width: MediaQuery.of(context).size.width*.07,
            decoration: BoxDecoration(
              color: HexColor('#eff4ff'),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset('images/253.png'),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Employee',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                  suffixIcon: Image.asset(
                    'images/searchimage15.png',
                    height: 5,
                  ),
                ),
              ),
            ),

            // Employee Cards
            _buildEmployeeCard(context, "Umme Abiha"),
            const Divider(),
            _buildEmployeeCard(context, "John Doe"),
            const Divider(),
            _buildEmployeeCard(context, "Jane Smith"),
          ],
        ),
      ),
    );
  }

  // Widget for Employee Card
  Widget _buildEmployeeCard(BuildContext context, String employeeName) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        width: MediaQuery.of(context).size.width,
        child: Card(
          color: Colors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Header Row with Employee Name and Actions
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      employeeName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.info_outline),
                          tooltip: 'Info',
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.insert_chart_outlined),
                          tooltip: 'Stats',
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.download_outlined),
                          tooltip: 'Download',
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(),

                // Employee Details Rows
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildInfoRow("New Contact", "08"),
                    buildInfoRow("Qualified", "08"),
                    buildInfoRow("Not Qualified", "08"),
                  ],
                ),
                Divider(),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildInfoRow("Proposal", "08"),
                    buildInfoRow("Follow Up", "08"),
                    buildInfoRow("Call Won", "08"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget for Info Row
  Widget buildInfoRow(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}
