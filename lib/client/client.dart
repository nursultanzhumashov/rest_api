import 'package:http/http.dart' as http;

const String baseUrl = 'https://jsonplaceholder.typicode.com';

class MyClient {
  var client = http.Client();
  Future<String?> get(String api) async {
    var url = Uri.parse(baseUrl + api);
    var _headers = {
      'Authorizion': 'Bearer sfie412432423=',
      'api_key': 'fsdfdsfdsfds',
    };
    var responce = await client.get(url, headers: _headers);
    if (responce.statusCode == 200) {
      return responce.body;
    } else {}

    return null;
  }

  Future<dynamic> post(String api) async {}

  Future<dynamic> put(String api) async {}

  Future<dynamic> delete(String api) async {}
}
