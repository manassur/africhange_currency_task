
import 'dart:convert';

import 'package:africhange_currency_task/models/rate_response.dart';
import 'package:http/http.dart' as http;

class Webservice {

  Future<RateResponse> fetchRates() async {

    final url = "http://data.fixer.io/api/latest?access_key=e018cb5d2178e9f5d517a4a9eb46ab53&symbols=USD,AUD,CAD,PLN,MXN&format=1";
    final response = await http.get(Uri.parse(url));
    print('response'+response.body);
    if(response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return RateResponse.fromJson(body);

    } else {
      throw Exception("Unable to perform request!");
    }
  }
}