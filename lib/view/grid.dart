import 'package:flutter/material.dart';
import 'package:loginb/utils/color.dart';

class gridview extends StatelessWidget {
  gridview ({super.key});

  final List image = [
    'images/facbook1.png',
    'images/indiamart1.png',
    'images/viewRe1.png',
    'images/do1.png',
  ];

  final List name = [
    'Facebook',
    'India Mart',
    'View Report',
    'Download',
  ];

  final List middle = [
    'Seamless facebook Integration for Enhanced User Eng,.',
    'Effortless facebook Integration for Enhanced User Eng',
    'Compress facebook Integration for Enhanced User Eng',
    'Quick and Easy download facebook Integration for Enhanced User Eng',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.40,
      width: MediaQuery.of(context).size.width,
      child: GridView.builder(
        itemCount: name.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
           childAspectRatio: 3/2.5

           // Adjust the card's aspect ratio
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              color: [
                AppColors.primary,
                AppColors.cardBackground1,
                AppColors.cardBackground2,
                AppColors.card,
              ][index % 4],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 1,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10,right: 120),
                    child: Image.asset(
                      image[index],
                      width: 50, // Adjust image size as needed
                      height: 50,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 85,top: 10,),
                    child: Text(name[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(middle[index], style: TextStyle(fontSize: 10)),
                  ), // Adjust font size as needed
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}