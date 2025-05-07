import 'dart:convert';
import 'package:http/http.dart' as http;

class MyHttpClient {
  static const request = "https://api.hgbrasil.com/finance?key=f6d2ba51";

  Future<Map> getData() async {
    http.Response response = await http.get(Uri.parse(request));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Erro ao carregar dados: ${response.statusCode}');
    }
  }
}
