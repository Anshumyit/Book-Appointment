import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loginb/view/grid.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
            child: Container(
              height: 40,
              width: 40,
              child: Image.asset('images/12.png'),
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
                                padding: const EdgeInsets.only(top: 20),
                                child: Column(
                                  children: [
                                    _buildLegend("Total Call", 1000, Colors.blue[900]),
                                    _buildLegend("New Call", 900, Colors.blue[100]),
                                    _buildLegend("Qualified", 100, Colors.blue[200]),
                                    _buildLegend("Call Won", 300, Colors.blue[400]),
                                    _buildLegend("Approved", 200, Colors.blue[600]),
                                    _buildLegend("Rejected", 200, Colors.blue[900]),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child:  PieChart(
                                PieChartData(
                                  centerSpaceRadius: 40,
                                  sections: [
                                    PieChartSectionData(
                                      value: 200,

                                      color: Colors.blue[900],
                                      radius: 50,
                                    ),
                                    PieChartSectionData(
                                      value: 200,

                                      color: Colors.blue[600],
                                      radius: 50,
                                    ),
                                    PieChartSectionData(
                                      value: 300,

                                      color: Colors.blue[400],
                                      radius: 50,
                                    ),
                                    PieChartSectionData(
                                      value: 100,

                                      color: Colors.blue[200],
                                      radius: 50,
                                    ),
                                    PieChartSectionData(
                                      value: 900,

                                      color: Colors.blue[100],
                                      radius: 50,
                                    ),
                                  ],
                                  sectionsSpace: 2,
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

  Widget _buildLegend(String label, int value, Color? color) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          color: color,
        ),
        SizedBox(width: 8),
        Text("$label: $value"),
      ],
    );
  }
}
