import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LimitPopup extends StatefulWidget {
  final int currentLimit;

  LimitPopup({required this.currentLimit});

  @override
  _LimitPopupState createState() => _LimitPopupState();
}

class _LimitPopupState extends State<LimitPopup> {
  late int _newLimit;

  @override
  void initState() {
    super.initState();
    _newLimit = widget.currentLimit;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Set Limit', style: TextStyle(color: Colors.pink[200])),
      content: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(hintText: 'Enter new limit', hintStyle: TextStyle(color: Colors.pink[200])),
        onChanged: (value) {
          _newLimit = int.tryParse(value) ?? widget.currentLimit;
        },
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(_newLimit);
          },
          child: Text('Set' , style: TextStyle(color: Colors.pink[200])),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel' , style: TextStyle(color: Colors.pink[200])),
        ),
      ],
    );
  }
}
