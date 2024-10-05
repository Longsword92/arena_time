import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'models/arena_model.dart';

const String url9c = 'https://api.9c.gg/graphql';

class APIGG {
  static Future<BattleArenaRankingResponse?> battleArenaRanking(
    int championshipId,
    int round,
  ) async {
    const query = '''
          query(\$championshipId: Int!, \$round: Int!) {
            battleArenaRanking(
              championshipId: \$championshipId,
              round: \$round,
              limit: 200,
            ){
              ranking
              name
              avatarLevel
              cp
              score
              winCount
              lossCount
              ticket
              purchasedTicketCount
              ticketResetCount
            }
          }
      ''';

    try {
      var json = await Request.fetchNode(query, variables: {
        'championshipId': championshipId,
        'round': round,
      });

      BattleArenaRankingResponse data =
          BattleArenaRankingResponse.fromJson(json['data']);
      return data;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }
}

class Request {
  static dynamic fetchNode(query, {variables}) async {
    String urlNode = url9c;
    try {
      var body = {"query": query};
      if (variables != null) {
        body['variables'] = json.encode(variables);
      }
      final response = await http.post(Uri.parse(urlNode), body: body);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        if (kDebugMode) {
          print(response.body);
        }
        throw Exception('Failed to load api');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw Exception('Failed to load album');
    }
  }
}
