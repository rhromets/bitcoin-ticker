import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'UAH',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

// const apiKey = "DC6910B8-6D7D-480A-8105-526B0F8F428E";
const apiKey1 = "902F66FD-86C1-4260-940B-4795E14BE810";
const coinAPI = "https://rest.coinapi.io/v1/exchangerate";

class CoinData {
  Future<dynamic> getCoinData(String selectedCurrency) async {
    String reqUrl = "$coinAPI/BTC/$selectedCurrency";
    http.Response response =
        await http.get(Uri.parse("$reqUrl?apiKey=$apiKey1"));

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      double rate = decodedData['rate'];
      return rate.toStringAsFixed(0);
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}
