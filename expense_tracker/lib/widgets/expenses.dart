import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 9.99,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'Dinner',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.food,
    ),
  ];


  void _openOverlay() {
    // final RenderBox renderBox = key.currentContext.findRenderObject();
    // final componentPosition = renderBox.localToGlobal(Offset.zero);

    // double sheetHeight =
    //     MediaQuery.of(context).size.height - componentPosition.dy;

    showModalBottomSheet(
        // enableDrag: true,
        showDragHandle: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
            child: Center(
              child: NewExpense(onAddExpense: _addExpense),
            ),
          );
        });
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);

    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context)
        .clearSnackBars(); // removes existing snackbars

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text("Expense Deleted"),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No Expenses Found. Start Adding Some!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
            'Expense Tracker',
          style: Theme.of(context).textTheme.titleLarge,
          ),
        //   actions: [
        //     IconButton(
        //       onPressed: _openOverlay,
        //       icon: const Icon(Icons.add)),
        // ],
      ),
      body: Column(

        children: [
          Chart(expenses: _registeredExpenses),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openOverlay,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        child: const Icon(Icons.add),
      ),
    );
  }
}
