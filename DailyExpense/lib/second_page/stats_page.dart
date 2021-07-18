import 'package:DailyExpense/config/config.dart';
import 'package:DailyExpense/model/expense_items.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Colors.limeAccent[700], Colors.amberAccent]),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 150.0),
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "Your Stats",
                        style: TextStyle(
                            color: ColorPalette.fontColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 35),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  color: Colors.grey[300],
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.screenWidth * 0.05, top: 350.0),
                    child: Row(
                      children: [
                        Text(
                          "Past Records",
                          style: TextStyle(
                              color: ColorPalette.fontColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Icon(Icons.arrow_drop_down_outlined),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Positioned(
            top: 200,
            child: Column(
              children: [
                Container(
                  height: SizeConfig.screenHeight * 0.30,
                  width: SizeConfig.screenWidth * 0.90,
                  decoration: BoxDecoration(
                    color: ColorPalette.secondaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: SizeConfig.screenWidth * 0.05),
                                  child: Text(
                                    "Total Expense",
                                    style: TextStyle(
                                        color: ColorPalette.fontColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: SizeConfig.screenWidth * 0.05),
                                  child: Text("Rs34000/-"),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: SizeConfig.screenWidth * 0.05),
                                  child: Text(
                                    "Goal",
                                    style: TextStyle(
                                        color: ColorPalette.fontColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: SizeConfig.screenWidth * 0.05),
                                  child: Text(
                                    "Rs24000/month",
                                    style: TextStyle(color: Colors.green[900]),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: _ChartApp(),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: SizeConfig.screenHeight * 0.015,
                          right: SizeConfig.screenHeight * 0.015),
                      height: SizeConfig.screenHeight * 0.30,
                      width: SizeConfig.screenWidth * 0.4425,
                      decoration: BoxDecoration(
                        color: ColorPalette.secondaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Average expense",
                              style: TextStyle(
                                  color: ColorPalette.fontColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.limeAccent[700], width: 5),
                                borderRadius: BorderRadius.circular(1000),
                              ),
                              child: Text(
                                "Rs 230/day",
                                style: TextStyle(
                                    color: ColorPalette.fontColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: SizeConfig.screenHeight * 0.015),
                      height: SizeConfig.screenHeight * 0.30,
                      width: SizeConfig.screenWidth * 0.4425,
                      decoration: BoxDecoration(
                        color: ColorPalette.secondaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Daily goal",
                              style: TextStyle(
                                  color: ColorPalette.fontColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.limeAccent[700], width: 5),
                                borderRadius: BorderRadius.circular(1000),
                              ),
                              child: Text(
                                "Rs 130/day",
                                style: TextStyle(
                                    color: ColorPalette.fontColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _MyHomePage();
  }
}

class _MyHomePage extends StatefulWidget {
  _MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  List<ExpenseData> data = [
    ExpenseData('Jan', 350),
    ExpenseData('Feb', 280),
    ExpenseData('Mar', 340),
    ExpenseData('Apr', 320),
    ExpenseData('May', 200)
  ];
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        // Chart title
        title: ChartTitle(text: 'Expense analysis'),
        // Enable legend
        legend: Legend(isVisible: true),
        // Enable tooltip
        tooltipBehavior: TooltipBehavior(
            enable: true, format: 'Month : point.x, Rs. point.y'),
        series: <ChartSeries<ExpenseData, String>>[
          LineSeries<ExpenseData, String>(
              dataSource: data,
              xValueMapper: (ExpenseData sales, _) => sales.month,
              yValueMapper: (ExpenseData sales, _) => sales.expense,
              name: "Expense",
              // Enable data label
              dataLabelSettings: DataLabelSettings(isVisible: true))
        ]);
  }
}
