import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fitnessapp/utilities/constants.dart';

class RestAPIService {
  static Future makePostRequest(body, route, {backend = true, url = ''}) async {
    body = json.encode(body);
    if (backend == true) {
      try {
        final res = await http.post('$kBackendUrl' + route,
            headers: {"Content-Type": "application/json"}, body: body);
        return res;
      } catch (e) {
        throw Error();
      }
    } else {
      try {
        final res = await http.post(url,
            headers: {"Content-Type": "application/json"}, body: body);
        return res;
      } catch (e) {
        throw Error();
      }
    }
  }

  static Future makeGetRequset(route) async {
    try {
      final res = http.get('$kBackendUrl' + route);
      return res;
    } catch (e) {
      throw Error();
    }
  }
}
