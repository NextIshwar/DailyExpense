import 'package:DailyExpense/config/config.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(fontFamily: 'Circular'),
      home: Home(),
    ),
  );
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              padding: EdgeInsets.only(bottom: height * 0.01),
              margin: EdgeInsets.all(width * 0.05),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(height * 0.05),
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.lime, Colors.orange[400]]),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DateWidget(),
                  ExpenseWidget(),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                left: width * 0.05,
                right: width * 0.05,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(height * 0.05),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(width * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rs. 341",
                          style: TextStyle(
                              fontSize: height * 0.03, color: Colors.grey[800]),
                        ),
                        Text(
                          "Money Left for the day",
                          style: TextStyle(
                              fontSize: height * 0.02, color: Colors.grey[800]),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    height: height * 0.085,
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(height * 0.05),
                    ),
                    margin: EdgeInsets.only(
                      left: width * 0.05,
                      right: width * 0.05,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.09),
                          child: Text(
                            "View Stats",
                            style: TextStyle(fontSize: height * 0.02),
                          ),
                        ),
                        Container(
                          height: height * 0.05,
                          margin: EdgeInsets.only(right: width * 0.09),
                          child: Image(
                            image: AssetImage(
                              "images/arrow.png",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: height * 0.001, color: Colors.grey[400]),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Today",
                      style: TextStyle(
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[800]),
                    ),
                    Text(
                      "18 February",
                      style: TextStyle(
                          color: ColorPalette.fontColor,
                          fontSize: width * 0.06,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: width * 0.11,
                width: width * 0.11,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(height * 0.05),
                  image: DecorationImage(
                    image: AssetImage("images/money_expense.png"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpenseWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Expanded(
      flex: 3,
      child: Container(
        margin: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "1,259",
                    style: TextStyle(
                        fontSize: height * 0.05,
                        fontWeight: FontWeight.bold,
                        color: ColorPalette.fontColor),
                  ),
                  Text(
                    "Today's Expense",
                    style: TextStyle(
                        fontSize: height * 0.03, color: Colors.grey[800]),
                  ),
                  Container(
                    height: width * 0.25,
                    width: width * 0.25,
                    margin: EdgeInsets.only(top: height * 0.05),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(height * 0.03)),
                      onPressed: () {},
                      child: Icon(
                        Icons.add,
                        size: width * 0.15,
                        color: ColorPalette.fontColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    50,
                    (index) => Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.01, bottom: height * 0.01),
                      child: Text(
                        "Rs. " + (index * 243).toString(),
                        style: TextStyle(
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
