import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_manga/config/_colors.dart';

class FilterWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  var selectedDateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.red,
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [_date_widget()],
      ),
    );
  }

  Widget _date_widget() {
    return InkWell(
      onTap: selectDate,
      child: Container(
          padding: EdgeInsets.all(4.0),
          child: Text(
            getDateFormat(selectedDateTime),
            style:
                TextStyle(fontWeight: FontWeight.w500, color: AppColors.white),
          )),
    );
  }

  String getDateFormat(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  void selectDate() async{
    var selected =  await showDatePicker(
      context: context,
      initialDate: selectedDateTime,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
      helpText: 'Select booking date', // Can be used as title
      cancelText: 'Not now',
      confirmText: 'Book',
    );
  }
}
