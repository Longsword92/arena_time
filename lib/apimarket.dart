import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'models/item_product.dart';

const String url9c = 'market.9c.gg';
const String urlHeimdall9c = 'heimdall-market.9c.gg';

class Market {
  static Future<List<ItemProduct>> products(
    int itemType, {
    int limit = 200,
    int offset = 0,
    String order = 'cp_desc',
    bool isOdin = true,
  }) async {
    try {
      final uri = Uri.https(isOdin ? url9c : urlHeimdall9c, '/Market/products/items/$itemType/', {
        'limit': "$limit",
        'offset': "$offset",
        'order': order,
      });
      final response = await http.get(uri);
      final data = jsonDecode(response.body);
      var itemProducts = data['itemProducts'];

      return (itemProducts as List).map((e) {
        print(e['itemId']);
        return ItemProduct.fromJson(e);
      }).toList();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return [];
    }
  }
}
