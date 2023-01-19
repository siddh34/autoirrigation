import 'package:flutter/material.dart';
import 'package:myirrigation/Utilities/DataManager.dart';
import 'package:myirrigation/Utilities/Graphdata.dart';

import '../Utilities/LineChart.dart';

class UserScreen extends StatefulWidget {
  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  // functions and variables
  DataManager myDataManager = new DataManager();

  var filterConditions = [
    'Hourly',
    'After 7 days',
    'After a month',
    'After 14 days'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My Irrigation",
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                  '\t\tSummary: \n\t  \tTemperature drops by 1 degree in between 3.50pm and 4.40pm'),
              width: 330,
              height: 200,
              decoration: BoxDecoration(
                color: Color.fromARGB(135, 255, 255, 255),
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(7)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 182, 171, 171).withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 3,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Text("Filter: "),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 100),
                  child: DropdownButton(
                    value: filterConditions[0],
                    items: filterConditions.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? val) {},
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            FutureBuilder<List<GraphData>>(
                future: myDataManager.getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var data = snapshot.data!;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(6),
                          child: CartesianLineChart(data: data),
                        ),
                      ],
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: <Color>[
                            Color.fromARGB(255, 33, 116, 241),
                            Color.fromARGB(255, 97, 156, 214),
                            Color(0xFF42A5F5),
                          ])),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            // TODO: press to open UI
                          },
                          child: Text(
                            "Devic Controls",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: <Color>[
                            Color.fromARGB(255, 33, 116, 241),
                            Color.fromARGB(255, 97, 156, 214),
                            Color(0xFF42A5F5),
                          ])),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            // TODO: press to open UI
                          },
                          child: Text(
                            "Find Devices",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
