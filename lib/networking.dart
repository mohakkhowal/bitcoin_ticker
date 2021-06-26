import 'dart:convert';
import 'package:http/http.dart' as http;
class NetworkHelper{
  var prices = {'BTC':'?','ETH':'?','LTC':'?'};
  Future getData(String curr) async{
    for(String x in prices.keys){
        var url = 'https://api.coinbase.com/v2/prices/$x-$curr/spot';
        var temp = Uri.parse(url);
        prices[x] = '?';
        http.Response response = await http.get(temp);
        if(response.statusCode==200){
          var data = jsonDecode(response.body);
          var dd = double.parse(data['data']['amount']);
          prices[x] = dd.toStringAsFixed(2);
        }
        else{
          print(response.statusCode);
        }
    }
    return prices;
  }
}