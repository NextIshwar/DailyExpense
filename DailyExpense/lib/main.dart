import 'package:DailyExpense/config/config.dart';
import 'package:DailyExpense/data/data.dart';
import 'package:DailyExpense/model/expense_items.dart';
import 'package:DailyExpense/second_page/stats_page.dart';
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
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight;
    double width = SizeConfig.screenWidth;
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
                    colors: [Colors.limeAccent[700], Colors.orange[400]]),
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
          Expanded(flex: 2, child: StatesButton()),
        ],
      ),
    );
  }
}

class DateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.screenHeight;
    double width = SizeConfig.screenWidth;

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
    double height = SizeConfig.screenHeight;
    double width = SizeConfig.screenWidth;
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
                      onPressed: () {
                        popSlider(context, height, width);
                      },
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
                        "Rs. " + (index * 10).toString(),
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

  void popSlider(context, height, width) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(height * 0.03),
          ),
        ),
        context: context,
        builder: (BuildContext ctx) {
          return SliderDialogue(
            height: height,
            width: width,
          );
        });
  }
}

class StatesButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.screenHeight;
    double width = SizeConfig.screenWidth;
    return Container(
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
          GestureDetector(
            child: Container(
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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StatsWidget(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SliderDialogue extends StatefulWidget {
  final double height, width;
  SliderDialogue({this.height, this.width});
  @override
  _SliderDialogueState createState() => _SliderDialogueState();
}

class _SliderDialogueState extends State<SliderDialogue> {
  final key = GlobalKey<AnimatedListState>();
  final items = List.from(Data.expenseItem);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(widget.height * 0.01),
            height: widget.height * 0.008,
            width: widget.width * 0.3,
            decoration: BoxDecoration(
              color: Colors.grey[850],
              borderRadius: BorderRadius.circular(widget.width * 0.01),
            ),
          ),
          Container(
              height: 100,
              child: AddExpenseWidget(
                  item: Data.expenseItem[0],
                  onClicked: () {
                    print("object");
                  })),
          Container(
            height: 100,
            child: RaisedButton(
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget addExpense(item, int index, Animation<double> animation) {
    return AddExpenseWidget(item: item, onClicked: removeItem(index));
  }

  removeItem(int index) {
    final item = items.removeAt(index);
    key.currentState.removeItem(
        index, (context, animation) => addExpense(item, index, animation));
  }

  insertItem(int index, ExpenseItem item) {
    items.insert(index, item);
    key.currentState.insertItem(index);
  }
}

class AddExpenseWidget extends StatelessWidget {
  final ExpenseItem item;
  // final Animation animation;
  final VoidCallback onClicked;
  AddExpenseWidget(
      {@required this.item,
      //   @required this.animation,
      @required this.onClicked});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        leading: CircleAvatar(
          radius: 32,
          backgroundImage: AssetImage("images/money_expense.png"),
        ),
        title: Text(
          item.price.toString(),
          style: TextStyle(fontSize: 20),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: onClicked,
        ),
      ),
    );
  }
}
