import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class InteractivePieChart extends StatefulWidget {
  @override
  _InteractivePieChartState createState() => _InteractivePieChartState();
}

class _InteractivePieChartState extends State<InteractivePieChart> {
  final Map<String, double> dataMap = {
    "New Call": 900,
    "Qualified": 100,
    "Call Won": 300,
    "Approved": 200,
    "Rejected": 200,
  };

  String selectedCategory = "Total 100";

  @override
  Widget build(BuildContext context) {
    double totalValue = dataMap.values.reduce((a, b) => a + b);

    return Scaffold(
      appBar: AppBar(
        title: Text("Interactive Pie Chart"),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            "Calling Source Summary",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Stack(
            alignment: Alignment.center,
            children: [
              PieChart(
                PieChartData(
                  centerSpaceRadius: 50,
                  sections: _getPieSections(),
                  sectionsSpace: 2,
                  pieTouchData: PieTouchData(
                    touchCallback: (event, response) {
                      if (response != null &&
                          response.touchedSection != null &&
                          response.touchedSection!.touchedSection != null) {
                        setState(() {
                          selectedCategory =
                              response.touchedSection!.touchedSection!.title ??
                                  "Total";
                        });
                      }
                    },
                  ),
                ),
              ),
              Text(
                selectedCategory == "Total"
                    ? "Total: ${totalValue.toInt()}"
                    : "$selectedCategory\n${dataMap[selectedCategory]!.toInt()}",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          SizedBox(height: 30),
          Wrap(
            spacing: 10,
            children: dataMap.keys.map((key) {
              return ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedCategory = key;
                  });
                },
                child: Text(key),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> _getPieSections() {
    return dataMap.keys.map((key) {
      bool isSelected = selectedCategory == key || selectedCategory == "Total";
      return PieChartSectionData(
        value: selectedCategory == "Total"
            ? dataMap[key]
            : (selectedCategory == key ? dataMap[key] : 0),
        title: selectedCategory == "Total" ? key : "",
        color: _getColorForCategory(key),
        radius: isSelected ? 60 : 40,
      );
    }).toList();
  }

  Color _getColorForCategory(String category) {
    switch (category) {
      case "New Call":
        return Colors.blue[100]!;
      case "Qualified":
        return Colors.blue[200]!;
      case "Call Won":
        return Colors.blue[400]!;
      case "Approved":
        return Colors.blue[600]!;
      case "Rejected":
        return Colors.blue[900]!;
      default:
        return Colors.grey;
    }
  }
}


