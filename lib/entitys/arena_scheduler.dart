import 'package:json_annotation/json_annotation.dart';

import '../arena_list.dart';
import '../json/json_string_to_int.dart';

part 'arena_scheduler.g.dart';

enum ServerName {
  Odin,
  Heimdall,
}

@JsonSerializable()
@JsonStringToInt()
class ArenaScheduler {
  final int id;
  final int round;
  @JsonKey(name: "arena_type")
  final String type;
  @JsonKey(name: "start_block_index")
  final int startBlock;

  @JsonKey(name: "end_block_index")
  final int endBlock;
  @JsonKey(name: "required_medal_count")
  final int requiredMedalCount;
  @JsonKey(name: "ticket_price")
  final int ticketPrice;
  @JsonKey(name: "additional_ticket_price")
  final int additionalTicketPrice;
  @JsonKey(name: "max_purchase_count")
  final int maxPurchaseCount;
  @JsonKey(name: "max_purchase_count_during_interval")
  final int maxPurchaseCountDuringInterval;

  ServerName serverName;

  factory ArenaScheduler.fromJson(Map<String, dynamic> json) =>
      _$ArenaSchedulerFromJson(json);

  ArenaScheduler(
    this.id,
    this.round,
    this.type,
    this.startBlock,
    this.endBlock,
    this.requiredMedalCount,
    this.ticketPrice,
    this.additionalTicketPrice,
    this.maxPurchaseCount,
    this.maxPurchaseCountDuringInterval, {
    this.serverName = ServerName.Odin,
  });

  Map<String, dynamic> toJson() => _$ArenaSchedulerToJson(this);

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'round': round,
        'type': type,
        'startBlock': startBlock,
        'endBlock': endBlock,
        'requiredMedalCount': requiredMedalCount,
        'ticketPrice': ticketPrice,
        'additionalTicketPrice': additionalTicketPrice,
        'maxPurchaseCount': maxPurchaseCount,
        'maxPurchaseCountDuringInterval': maxPurchaseCountDuringInterval,
        'serverName': serverName.name,
      };

  factory ArenaScheduler.createInstance(json) => ArenaScheduler(
        json['id'] as int,
        json['round'] as int,
        json['type'] as String,
        json['startBlock'] as int,
        json['endBlock'] as int,
        json['requiredMedalCount'] as int,
        json['ticketPrice'] as int,
        json['additionalTicketPrice'] as int,
        json['maxPurchaseCount'] as int,
        json['maxPurchaseCountDuringInterval'] as int,
        serverName: ServerName.values.byName(json['serverName']),
      );

  void setServerName(ServerName serverName) {
    this.serverName = serverName;
  }

  ArenaSeason getRoundOnSeason(int blockIndex) {
    const int dailyArenaInterval = 7560;
    int roundOnSeason = ((blockIndex - startBlock) / dailyArenaInterval).ceil();
    int totalRound =
        (((endBlock - startBlock) + 1) / dailyArenaInterval).ceil();

    int roundOnSeasonEndBlock =
        startBlock + (roundOnSeason * dailyArenaInterval);
    int roundOnSeasonRemainBlock = roundOnSeasonEndBlock - blockIndex;
    return ArenaSeason(
      roundOnSeason,
      roundOnSeasonEndBlock,
      roundOnSeasonRemainBlock,
      totalRound,
    );
  }
}
