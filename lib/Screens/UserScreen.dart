// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:myirrigation/Utilities/DataManager.dart';
import 'package:myirrigation/Utilities/Graphdata.dart';
import '../Utilities/TimeTempLineChart.dart';
import '../Screens/DeviceControlScreen.dart';
import '../Widgets/GraphWidgets.dart';
import 'FindDeviceScreen.dart';
import 'package:swipe_to/swipe_to.dart';

class UserScreen extends StatefulWidget {
  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  // functions and variables
  DataManager myDataManager = new DataManager();
  late DeviceControlScreen DCS = new DeviceControlScreen();
  late FindDeviceScreen FCS = new FindDeviceScreen();
  var filterConditions = [
    'Hourly',
    'After 7 days',
    'After a month',
    'After 14 days'
  ];

  List<GraphWidget> myGraphs = [];

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
                '\t\tSummary: \n\t  \tTemperature drops by 1 degree in between 3.50pm and 4.40pm',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    fontFamily: 'Genos'),
              ),
              width: 320,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.all(Radius.circular(7)),
                gradient: LinearGradient(
                    colors: [Colors.white, Color.fromARGB(255, 242, 242, 242)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 182, 171, 171).withOpacity(0.2),
                    spreadRadius: 5,
                    offset: Offset(5, 10),
                    blurRadius: 5,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    "Filter: ",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 100),
                  child: DropdownButton(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
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
            SwipeTo(
              onRightSwipe: () {},
              onLeftSwipe: () {},
              child: FutureBuilder<List<GraphData>>(
                  future: myDataManager.getData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data!;
                      myGraphs.add(GraphWidget(chart: CartesianLineChart(data: data)));
                      myGraphs.add(GraphWidget(chart: CartesianLineChart(data: data)));
                      myGraphs.add(GraphWidget(chart: CartesianLineChart(data: data)));
                      myGraphs.add(GraphWidget(chart: CartesianLineChart(data: data)));
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GraphWidget(chart: CartesianLineChart(data: data)),
                        ],
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
                            setState(() {
                              DCS.DeviceControlSheet(context);
                            });
                          },
                          child: Text(
                            "Device Controls",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
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
                            setState(() {
                              FCS.ConnectDeviceSheet(context);
                            });
                          },
                          child: Text(
                            "Find Devices",
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
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
