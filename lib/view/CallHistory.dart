import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginb/view/DialListcard.dart';

class Callhistory extends StatelessWidget {
  const Callhistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Call History',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          InkWell(
            onTap: ()=>Get.to(()=>DialerListScreen()),
            child: Icon(
              Icons.filter_list,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
            child: Card(
              shadowColor: Colors.blue,
              color: Colors.white,
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Umme Abiha',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Row(
                          children: [
                            Text('49 min ago'),
                            SizedBox(width: 5),
                            Icon(
                              Icons.info_outline,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Intercom',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'forwarded',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                   Padding(
                     padding: const EdgeInsets.only(bottom: 20),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Icon(Icons.call_received,color: Colors.lightBlue,),
                         Padding(
                           padding: const EdgeInsets.only(right: 185),
                           child: Text('07081887576'),
                         ),
                         Text('00:00:6')
                       ],
                     ),
                   )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
