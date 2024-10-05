import 'package:arena_time/constant.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class MyRequest {
  static dynamic fetchNode(query, node, {variables}) async {
    String urlNode =
        Constant.nodes().firstWhere((element) => element.name == node).url;
    return fetch(query, urlNode, variables: variables);
  }

  static dynamic fetch(query, urlNode, {variables}) async {
    try {
      var body = {"query": query};
      if (variables != null) {
        body['variables'] = json.encode(variables);
      }
      final response = await http.post(Uri.parse(urlNode), body: body);
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        return jsonDecode(response.body);
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        if (kDebugMode) {
          print(response.body);
        }
        throw Exception('Failed to load album');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw Exception('Failed to load album');
    }
  }

  static dynamic postRequest(query, urlNode, {variables}) async {
    try {
      var body = {"query": query};
      if (variables != null) {
        body['variables'] = json.encode(variables);
      }
      final response = await http.post(
        Uri.parse(urlNode),
        body: json.encode(body),
        headers: {"Content-Type": "application/json"},
      );
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        return jsonDecode(response.body);
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        if (kDebugMode) {
          print(response.body);
        }
        throw Exception('Failed to load album');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw Exception('Failed to load album');
    }
  }
}
