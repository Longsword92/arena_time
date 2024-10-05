import 'package:flutter/foundation.dart';

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

}
