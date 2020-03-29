import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;


class ServiceUtil {
  get(String url) async {
    var response = await http.get(url);
    return jsonDecode(response.body);
  }

  post(String url, dynamic data) {
    Completer completer = new Completer();
    http.post(url, body: data).then((response) => completer.complete(jsonDecode(response.body)))
                 .catchError((onError) => throw Exception('Error to call service'));
  }

  put(String url, dynamic data) {
    Completer completer = new Completer();
    http.put(url, body: data).then((response) => completer.complete(jsonDecode(response.body)))
                 .catchError((onError) => throw Exception('Error to call service'));
  }

  delete(String url) {
    Completer completer = new Completer();
    http.delete(url).then((response) => completer.complete(jsonDecode(response.body)))
                 .catchError((onError) => throw Exception('Error to call service'));
  }
}