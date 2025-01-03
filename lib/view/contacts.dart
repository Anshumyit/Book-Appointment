import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loginb/view/All_Employee.dart';
import 'package:loginb/view/grid.dart';

class contacts extends StatefulWidget {
  const contacts({super.key});

  @override
  State<contacts> createState() => _HomeState();
}

class _HomeState extends State<contacts> {

  int selectedIndex = -1;

  final List<Map<String, dynamic>> data = [
    {'label': 'New Contact', 'value': 3, 'color': Colors.red},
    {'label': 'Qualified', 'value': 2, 'color': Colors.orange},
    {'label': 'Not Qualified', 'value': 1, 'color': Colors.green},
    {'label': 'Proposal', 'value': 1, 'color': Colors.blue},
    {'label': 'Follow Up', 'value': 8, 'color': Colors.purple},
    {'label': 'Gone', 'value': 1, 'color': Colors.teal},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Call dialer',style: TextStyle(fontWeight: FontWeight.bold),),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                Get.to(AllEmployee());
              },
              child: SizedBox(
                height: 40,
                width: 40,
                child: Image.asset('images/12.png'),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Select Employee',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        prefixIcon: Icon(Icons.search)
                    ),

                  ),
                ),
              ),
              Padding(
                padding:const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.grey,
                  child: Image.asset('images/menu1.png'),
                ),
              ),
            ],
          ),
          gridview(),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.280,
              child: Card(
                  color: HexColor('#ffffff'),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 150,top: 25),
                        child: Text('calling Source summary',
                          style: TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 15),),
                      ),

                      Container(
                        height: MediaQuery.of(context).size.height*0.2,
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 22,left: 20),
                                child: ListView.builder(
                                  itemCount: data.length,
                                  itemBuilder: (context, index) {
                                    final item = data[index];
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = index;
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 12,
                                            height: 12,
                                            decoration: BoxDecoration(
                                              color: item['color'],
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          SizedBox(width: 15),
                                          Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Text(
                                              item['label'],
                                              style: TextStyle(
                                                color: selectedIndex == index
                                                    ? Colors.black
                                                    : Colors.grey,
                                                fontWeight: selectedIndex == index
                                                    ? FontWeight.bold
                                                    : FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:EdgeInsets.only(bottom:MediaQuery.of(context).size.height*0.028,right:MediaQuery.of(context).size.height*0.03 ),
                                child: PieChart(
                                  PieChartData(
                                    sectionsSpace: 2,
                                    centerSpaceRadius: 30,
                                    sections: data.asMap().entries.map((entry) {
                                      final index = entry.key;
                                      final item = entry.value;
                                      final isSelected = selectedIndex == index;
                                      return PieChartSectionData(
                                        color: item['color'],
                                        value: item['value'].toDouble(),
                                        title: '${item['value']}',
                                        radius: isSelected ? 70 : 50,
                                        titleStyle: TextStyle(
                                          fontSize: isSelected ? 18 : 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      )

                    ],
                  )
              ),
            ),
          )
        ],
      ),
    );
  }


}
