import 'package:flutter/material.dart';
import 'package:Google_Sheet_with_Flutter/model/Transaction.dart';
import 'package:Google_Sheet_with_Flutter/model/TransactionType.dart';
import 'package:Google_Sheet_with_Flutter/service/TransactionService.dart';
import 'package:Google_Sheet_with_Flutter/page/AddTransactionPage.dart';

class ListTransactionPage extends StatefulWidget {
  ListTransactionPage({Key key}) : super(key: key);

  @override
  _ListTransactionPageState createState() => _ListTransactionPageState();
}

class _ListTransactionPageState extends State<ListTransactionPage> {
  List<Transaction> _items = List<Transaction>();
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() {
    TransactionService.getList().then((items) {
      setState(() {
        this._items = items;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รายรับ/รายจ่าย',style: TextStyle(fontFamily: 'Serithai', fontWeight: FontWeight.w600,)),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'เพิ่มรายการ',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddTransactionPage()),
              ).then((value) {
                getData();
              });
            },
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: this._items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(getIcon(this._items[index].getType())),
            title: Text(
              this._items[index].getMessage(),
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold,fontFamily:'Serithai',fontSize: 17),
            ),
            subtitle: Text(
              this._items[index].getTransactionDate().toIso8601String(),
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
            trailing: Text(
              this._items[index].getCash().toString(),
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Roboto'),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }

  IconData getIcon(TransactionType type) {
    switch (type) {
      case TransactionType.Income:
        return Icons.local_atm_outlined;
      case TransactionType.Expense:
        return Icons.do_disturb_on_outlined;
      default:
        return Icons.report;
    }
  }
}
