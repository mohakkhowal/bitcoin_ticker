import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/Cardd.dart';
import 'package:bitcoin_ticker/networking.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  var pricess = {'BTC': '?', 'ETH': '?', 'LTC': '?'};
  String selectedCurrency = 'AUD';
  void setData() async {
    for (String x in pricess.keys) {
      pricess[x] = '?';
    }
    try {
      var tt = await NetworkHelper().getData(selectedCurrency);
      setState(() {
        pricess = tt;
      });
    } catch (e) {
      print(e);
    }
  }

  List<Text> getPickeritems() {
    List<Text> pickeritems = [];
    for (String c in currenciesList) {
      pickeritems.add(Text(
        c,
        style: TextStyle(color: Colors.black),
      ));
    }
    return pickeritems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF151515),
      appBar: AppBar(
        backgroundColor: Color(0xFF151515),
        centerTitle: true,
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Cardd('BTC', selectedCurrency, pricess['BTC']),
            Cardd('ETH', selectedCurrency, pricess['ETH']),
            Cardd('LTC', selectedCurrency, pricess['LTC']),
          ]),
          Container(
            height: 200,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Color(0xFFf2a365),
            child: CupertinoPicker(
              children: getPickeritems(),
              itemExtent: 32,
              onSelectedItemChanged: (value) {
                setState(() {
                  selectedCurrency = currenciesList[value];
                  setData();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
