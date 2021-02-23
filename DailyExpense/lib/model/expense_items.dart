import 'package:meta/meta.dart';

class ExpenseItem {
  final double price;
  final String description;

  const ExpenseItem({
    @required this.price,
    @required this.description,
  });
}

class ExpenseData {
  ExpenseData(this.month, this.expense);

  final String month;
  final double expense;
}
