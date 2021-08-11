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
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const apiKey = "DC6910B8-6D7D-480A-8105-526B0F8F428E";
const String asset_id_base = "BTC";
const String asset_id_quote = "USD";
const coinAPI =
    "https://rest.coinapi.io/v1/exchangerate/$asset_id_base/$asset_id_quote";

class CoinData {
  Future<dynamic> getCoinData() async {
    http.Response response =
        await http.get(Uri.parse("$coinAPI?apiKey=$apiKey"));

    if (response.statusCode == 200) {
      String data = response.body;
      var resSideBase = jsonDecode(response.body)['src_side_base'];
      for (var currency in resSideBase) {
        if (currency['asset'] == 'USD') {
          int usdCurrency = currency['rate'].toInt();
          return usdCurrency.toString();
        }
      }

      // return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
