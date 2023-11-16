import 'package:flutter/material.dart';

class GeneralInfo extends StatelessWidget {
  final String type;
  final String val;
  const GeneralInfo(this.type, this.val, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "$type : ",
          style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Flexible(
          child: Text(val, overflow: TextOverflow.fade),),
        
      ],
    ))
    ;
  }
}
