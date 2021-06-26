import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Cardd extends StatefulWidget {
  String coinname;
  String currency;
  var value = '?';
  Cardd(this.coinname,this.currency,this.value);

  @override
  _CarddState createState() => _CarddState();
}

class _CarddState extends State<Cardd> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Color(0xFFf2a365),
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 ${widget.coinname} =  ${widget.value} ${widget.currency}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
