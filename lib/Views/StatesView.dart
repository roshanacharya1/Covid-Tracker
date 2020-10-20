import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid_tracker_beta/Controller/StatesDataController.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  ChartData(this.template, this.data, this.pointColor);
  final String template;
  final double data;
  final Color pointColor;
}

class StatesView extends StatelessWidget {
  final stateDataController = Get.put(StateDataController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CovidTracker"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Card(
                child: Obx(
                  () => Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text('India',style: TextStyle(
                          fontSize: 40,fontWeight: FontWeight.w900
                        ),),
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                            child: SfCircularChart(series: <CircularSeries>[
                          RadialBarSeries<ChartData, String>(
                            dataSource: <ChartData>[
                              ChartData(
                                  'deaths',
                                  stateDataController.CTdeaths.value
                                              .toDouble() /
                                          stateDataController.CTases.value
                                              .toDouble() *
                                          100 +
                                      20,
                                  Colors.red),
                              ChartData(
                                  'infected',
                                  stateDataController.CactivCases.value
                                              .toDouble() /
                                          stateDataController.CTases
                                              .toDouble() *
                                          100 +
                                      20,
                                  Colors.orange),
                              ChartData(
                                  'recovered',
                                  stateDataController.CTrecovered.value
                                          .toDouble() /
                                      stateDataController.CTases.value
                                          .toDouble() *
                                      100,
                                  Colors.green),
                              ChartData(
                                  'infected',
                                  stateDataController.CTases.value.toDouble() /
                                          stateDataController.CTases
                                              .toDouble() *
                                          100 +
                                      5,
                                  Colors.blue),
                            ],
                            xValueMapper: (ChartData data, _) => data.template,
                            yValueMapper: (ChartData data, _) => data.data,
                            pointColorMapper: (ChartData data, _) =>
                                data.pointColor,
                            innerRadius: '20%',
                            maximumValue: 100,
                            gap: '3%',
                            cornerStyle: CornerStyle.endCurve,
                            trackColor: Colors.transparent
                          )
                        ])),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Total Cases',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${stateDataController.CTases}',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10)
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Total Deaths',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${stateDataController.CTdeaths}',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10)
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Column(
mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Total Recovered',
                                      style: TextStyle(color: Colors.green),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${stateDataController.CTrecovered}',
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(color: Colors.green.withOpacity(0.2),borderRadius: BorderRadius.circular(10)),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Total Infected',
                                        style: TextStyle(color: Colors.orange),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        '${stateDataController.CactivCases}',
                                        style: TextStyle(
                                            color: Colors.orange,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.orange.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(10)))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GetX<StateDataController>(builder: (controller) {
                return ListView.builder(
                    itemCount: controller.statesData.length,
                    itemBuilder: (context, Index) {
                      return Card(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                '${controller.statesData[Index].Region}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 32.0, vertical: 20),
                                          child: Column(
                                            children: [
                                              Text(
                                                'Total Cases',
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                '${controller.statesData[Index].Tinfected + controller.statesData[Index].Trecovered + controller.statesData[Index].TDead}',
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ],
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            color: Colors.blue.withOpacity(0.2),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 32.0, vertical: 20),
                                          child: Column(
                                            children: [
                                              Text(
                                                'Total Deaths',
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    '${controller.statesData[Index].TDead}',
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w900),
                                                  ),
                                                  Text(
                                                    '+${controller.statesData[Index].NDead.abs()}',
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            color: Colors.red.withOpacity(0.2),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            children: [
                                              Text(
                                                'Total Recovered',
                                                style: TextStyle(
                                                    color: Colors.green,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    '${controller.statesData[Index].Trecovered}',
                                                    style: TextStyle(
                                                        color: Colors.green,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w900),
                                                  ),
                                                  Text(
                                                    '+${controller.statesData[Index].Nrecovered.abs()}',
                                                    style: TextStyle(
                                                        color: Colors.green,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.green.withOpacity(0.2),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 32.0, vertical: 20),
                                          child: Column(
                                            children: [
                                              Text(
                                                'Total infected',
                                                style: TextStyle(
                                                    color: Colors.orange),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    '${controller.statesData[Index].Tinfected}',
                                                    style: TextStyle(
                                                        color: Colors.orange,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w900),
                                                  ),
                                                  Text(
                                                    '+${controller.statesData[Index].Ninfected.abs()}',
                                                    style: TextStyle(
                                                        color: Colors.orange,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.orange.withOpacity(0.2),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    });
              }),
            )
          ],
        ),
      ),
    );
  }
}
