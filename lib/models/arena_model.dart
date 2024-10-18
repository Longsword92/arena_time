class BattleArenaRankingResponse {
  List<BattleArenaRanking>? battleArenaRanking;

  BattleArenaRankingResponse({this.battleArenaRanking});

  BattleArenaRankingResponse.fromJson(Map<String, dynamic> json) {
    if (json['battleArenaRanking'] != null) {
      battleArenaRanking = <BattleArenaRanking>[];
      json['battleArenaRanking'].forEach((v) {
        battleArenaRanking!.add(BattleArenaRanking.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (battleArenaRanking != null) {
      data['battleArenaRanking'] =
          battleArenaRanking!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BattleArenaRanking {
  int? ranking;
  String? name;
  int? avatarLevel;
  int? cp;
  int? score;
  int? winCount;
  int? lossCount;
  int? ticket;
  int? purchasedTicketCount;
  int? ticketResetCount;

  BattleArenaRanking(
      {this.ranking,
      this.name,
      this.avatarLevel,
      this.cp,
      this.score,
      this.winCount,
      this.lossCount,
      this.ticket,
      this.purchasedTicketCount,
      this.ticketResetCount});

  BattleArenaRanking.fromJson(Map<String, dynamic> json) {
    ranking = json['ranking'];
    name = json['name'];
    avatarLevel = json['avatarLevel'];
    cp = json['cp'];
    score = json['score'];
    winCount = json['winCount'];
    lossCount = json['lossCount'];
    ticket = json['ticket'];
    purchasedTicketCount = json['purchasedTicketCount'];
    ticketResetCount = json['ticketResetCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ranking'] = ranking;
    data['name'] = name;
    data['avatarLevel'] = avatarLevel;
    data['cp'] = cp;
    data['score'] = score;
    data['winCount'] = winCount;
    data['lossCount'] = lossCount;
    data['ticket'] = ticket;
    data['purchasedTicketCount'] = purchasedTicketCount;
    data['ticketResetCount'] = ticketResetCount;
    return data;
  }
}
