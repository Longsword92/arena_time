import 'package:flutter/foundation.dart';

import 'entitys/arena_scheduler.dart';
import 'models/avatar.dart';
import 'my_request.dart';

class RPC9c {
  

  static Future<AgentData?> loadAvatarInfo(
    String address, {
    String? node,
  }) async {
    const getAvatarStates = '''
          query (\$address: Address!) {
              stateQuery {
                  agent(address: \$address) {
                      address
                      gold
                      crystal
                      avatarStates {
                        dailyRewardReceivedIndex
                        name
                        level
                        actionPoint
                        address
                        runes {
                          runeId
                          level
                        }
                        stageMap {
                          count
                        }
                        eventMap {
                          count
                        }
                        inventory {
                            equipments {
                              id
                              itemId
                              grade
                              itemType
                              itemSubType
                              elementalType
                              level
                              stat {
                                statType
                                baseValue
                                additionalValue
                                totalValue
                              }
                              statsMap {
                                  hP
                                  aTK
                                  dEF
                                  cRI
                                  hIT
                                  sPD
                              }
                              equipped
                              skills {
                                  elementalType
                                  power
                                  chance
                              }
                              buffSkills {
                                  elementalType
                                  power
                                  chance
                              }
                            }
                            costumes {
                              id
                              itemId
                              grade
                              itemType
                              itemSubType
                              elementalType
                              equipped
                            }
                        }
                      
                      	combinationSlotAddresses
                        combinationSlots {
                          unlockBlockIndex
                          unlockStage
                          petId
                          startBlockIndex
                          address
                        }
                    }
                  }
              }
          }
      ''';

    try {
      var json = await MyRequest.fetchNode(getAvatarStates, node, variables: {
        "address": address,
      });

      AgentData data = AgentData.fromJson(json);
      return data;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  static Future<AgentData?> loadAvatarStates(String address,
      {String? node = '3'}) async {
    const getAvatarStates = '''
          query (\$address: Address!) {
              stateQuery {
                  agent(address: \$address) {
                      address
                      avatarStates {
                          dailyRewardReceivedIndex
                          name
                          level
                          actionPoint
                          address
                          runes {
                            runeId
                            level
                          }
                      }
                  }
              }
          }
      ''';

    try {
      var json = await MyRequest.fetchNode(getAvatarStates, node, variables: {
        "address": address,
      });

      AgentData data = AgentData.fromJson(json);
      return data;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  Future<List<ArenaScheduler>> getArenaScheduler(ServerName server) async {
    const query = '''
          query {
              sheet(sheetName: "ArenaSheet") {
                  csv
              }
          }
      ''';
    try {
      var s = server == ServerName.Odin ? 'odin' : 'heimdall';
      var url = "https://mimir.nine-chronicles.dev/$s/graphql";
      var data = await MyRequest.postRequest(query, url);
      var csv = data['data']['sheet']['csv'];

      var csvs = csv.split("\n");
      List<ArenaScheduler> rs = [];
      for (var i = 0; i < csvs.length; i++) {
        if (i> 0) {
          var row = csvs[i].split(",");
          var id = int.tryParse(row[0]) ?? 0;
          var round = int.tryParse(row[1]) ?? 0;
          var arenaType = row[2];
          var startBlockIndex = int.tryParse(row[3]) ?? 0;
          var endBlockIndex = int.tryParse(row[4]) ?? 0;
          var requiredMedalCount = int.tryParse(row[5]) ?? 0;
          var entranceFee = int.tryParse(row[6]) ?? 0;
          var ticketPrice = int.tryParse(row[7]) ?? 0;
          var additionalTicketPrice = int.tryParse(row[8]) ?? 0;
          var maxPurchaseCount = int.tryParse(row[9]) ?? 0;
          var maxPurchaseCountDuringInterval = int.tryParse(row[10]) ?? 0;
          rs.add(ArenaScheduler(
            id,
            round,
            arenaType,
            startBlockIndex,
            endBlockIndex,
            requiredMedalCount,
            ticketPrice,
            additionalTicketPrice,
            maxPurchaseCount,
            maxPurchaseCountDuringInterval,
            serverName: server,
          ));
        }
      }
      return rs;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return [];
    }
  }

}
