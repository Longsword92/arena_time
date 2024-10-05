import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'models/block.dart';
import 'models/transaction.dart';

const String url9c = 'api.9cscan.com';
const String urlHeimdall9c = 'api-heimdall.9cscan.com';

class API9c {
  static Future<int> getMaxBlock({bool isOdin = true}) async {
    try {
      final uri =
          Uri.https(isOdin ? url9c : urlHeimdall9c, '/blocks', {'limit': '1'});
      final response = await http.get(uri);
      final data = jsonDecode(response.body);
      return data['blocks'][0]['index'];
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return 0;
    }
  }

  static Future<List<Block>> getBlocks({isOdin = true}) async {
    try {
      final uri = Uri.https(
          isOdin ? url9c : urlHeimdall9c, '/blocks', {'limit': '100'});
      final response = await http.get(uri);
      final data = jsonDecode(response.body);
      var blocks = data != null ? data['blocks'] ?? [] : [];
      return (blocks as List).map((e) => Block.fromJson(e)).toList();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return [];
    }
  }

  static Future<dynamic> getAccountTransactions(
    address,
    action, {
    limit = 10,
    isOdin = true,
  }) async {
    try {
      final uri = Uri.https(
          isOdin ? url9c : urlHeimdall9c, '/accounts/$address/transactions', {
        'limit': '$limit',
        'action': action,
      });
      final response = await http.get(uri);
      final data = jsonDecode(response.body);
      return data['transactions'];
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return [];
    }
  }

  static Future<dynamic> getTransaction(txId, {isOdin = true}) async {
    try {
      final uri =
          Uri.https(isOdin ? url9c : urlHeimdall9c, '/transactions/$txId');
      final response = await http.get(uri);
      final data = jsonDecode(response.body);
      return data;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return {};
    }
  }

  static Future<List<Transaction>> getTransactions({isOdin = true}) async {
    try {
      final uri = Uri.https(
          isOdin ? url9c : urlHeimdall9c, '/transactions', {'limit': '100'});
      final response = await http.get(uri);
      final data = jsonDecode(response.body);

      var transactions = data != null ? data['transactions'] ?? [] : [];
      return (transactions as List)
          .map((e) => Transaction.fromJson(e))
          .toList();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return [];
    }
  }

  static Future<dynamic> getTransactionStatus(txId, {isOdin = true}) async {
    try {
      final uri = Uri.https(
          isOdin ? url9c : urlHeimdall9c, '/transactions/$txId/status');
      final response = await http.get(uri);
      final data = jsonDecode(response.body);
      return data['status'];
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }
}
