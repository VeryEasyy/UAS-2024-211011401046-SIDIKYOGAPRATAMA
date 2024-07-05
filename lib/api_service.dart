import 'dart:convert';
import 'package:http/http.dart' as http;
import 'crypto.dart';

class ApiService {
  final String apiUrl = "https://api.coinlore.net/api/tickers/";

  Future<List<Crypto>> fetchCryptos() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body)['data'];
      List<Crypto> cryptos = body.map((dynamic item) => Crypto.fromJson(item)).toList();
      return cryptos;
    } else {
      throw Exception('Failed to load cryptos');
    }
  }
}
