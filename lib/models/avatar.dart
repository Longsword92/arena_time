class Avatar {
  final double gold;
  final double crystal;

  Avatar(this.gold, this.crystal);
}

class AgentData {
  Data? data;

  AgentData({this.data});

  AgentData.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  StateQuery? stateQuery;

  Data({this.stateQuery});

  Data.fromJson(Map<String, dynamic> json) {
    stateQuery = json['stateQuery'] != null
        ? StateQuery.fromJson(json['stateQuery'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (stateQuery != null) {
      data['stateQuery'] = stateQuery!.toJson();
    }
    return data;
  }
}

class StateQuery {
  Agent? agent;

  StateQuery({this.agent});

  StateQuery.fromJson(Map<String, dynamic> json) {
    agent = json['agent'] != null ? Agent.fromJson(json['agent']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (agent != null) {
      data['agent'] = agent!.toJson();
    }
    return data;
  }
}

class Agent {
  late String address;
  String? gold;
  String? crystal;
  List<AvatarStates>? avatarStates;

  Agent({required this.address, this.gold, this.crystal, this.avatarStates});

  Agent.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    gold = json['gold'];
    crystal = json['crystal'];
    if (json['avatarStates'] != null) {
      avatarStates = <AvatarStates>[];
      json['avatarStates'].forEach((v) {
        avatarStates!.add(AvatarStates.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['gold'] = gold;
    data['crystal'] = crystal;
    if (avatarStates != null) {
      data['avatarStates'] = avatarStates!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AvatarStates {
  int? dailyRewardReceivedIndex;
  String? name;
  int? level;
  int? actionPoint;
  String? address;
  StageMap? stageMap;
  EventMap? eventMap;
  Inventory? inventory;
  List<Runes>? runes;
  List<CombinationSlot>? combinationSlots;

  AvatarStates({
    this.dailyRewardReceivedIndex,
    this.name,
    this.level,
    this.actionPoint = 0,
    this.address,
    this.stageMap,
    this.eventMap,
    this.inventory,
    this.runes = const [],
    this.combinationSlots = const [],
  });

  AvatarStates.fromJson(Map<String, dynamic> json) {
    dailyRewardReceivedIndex = json['dailyRewardReceivedIndex'];
    name = json['name'];
    level = json['level'];
    actionPoint = json['actionPoint'];
    address = json['address'];
    stageMap =
        json['stageMap'] != null ? StageMap.fromJson(json['stageMap']) : null;
    eventMap =
        json['eventMap'] != null ? EventMap.fromJson(json['eventMap']) : null;
    inventory = json['inventory'] != null
        ? Inventory.fromJson(json['inventory'])
        : null;

    if (json['runes'] != null) {
      runes = <Runes>[];
      json['runes'].forEach((v) {
        runes!.add(Runes.fromJson(v));
      });
    }

    if (json['combinationSlots'] != null) {
      combinationSlots = <CombinationSlot>[];
      json['combinationSlots'].forEach((v) {
        combinationSlots!.add(CombinationSlot.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dailyRewardReceivedIndex'] = dailyRewardReceivedIndex;
    data['name'] = name;
    data['level'] = level;
    data['actionPoint'] = actionPoint;
    data['address'] = address;
    if (stageMap != null) {
      data['stageMap'] = stageMap!.toJson();
    }
    if (eventMap != null) {
      data['eventMap'] = eventMap!.toJson();
    }
    if (inventory != null) {
      data['inventory'] = inventory!.toJson();
    }

    if (runes != null) {
      data['runes'] = runes!.map((v) => v.toJson()).toList();
    }

    if (combinationSlots != null) {
      data['combinationSlots'] =
          combinationSlots!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  bool validate(AvatarStates oldAvatarStates) {
    if (address != oldAvatarStates.address) return true;

    if (actionPoint != oldAvatarStates.actionPoint ||
        stageMap?.count != oldAvatarStates.stageMap?.count) return true;

    return false;
  }
}

class StageMap {
  int? count;

  StageMap({this.count});

  StageMap.fromJson(Map<String, dynamic> json) {
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    return data;
  }
}

class EventMap {
  int? count;

  EventMap({this.count});

  EventMap.fromJson(Map<String, dynamic> json) {
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    return data;
  }
}

class CombinationSlot {
  int? unlockBlockIndex;
  int? unlockStage;
  int? petId;
  int? startBlockIndex;
  String? address;

  CombinationSlot({
    this.unlockBlockIndex,
    this.unlockStage,
    this.petId,
    this.startBlockIndex,
    this.address,
  });

  CombinationSlot.fromJson(Map<String, dynamic> json) {
    unlockBlockIndex = json['unlockBlockIndex'];
    unlockStage = json['unlockStage'];
    petId = json['petId'];
    startBlockIndex = json['startBlockIndex'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['unlockBlockIndex'] = unlockBlockIndex;
    data['unlockStage'] = unlockStage;
    data['petId'] = petId;
    data['startBlockIndex'] = startBlockIndex;
    data['address'] = address;
    return data;
  }
}

class Inventory {
  List<Equipments>? equipments;
  List<Costumes>? costumes;

  Inventory({this.equipments, this.costumes});

  Inventory.fromJson(Map<String, dynamic> json) {
    if (json['equipments'] != null) {
      equipments = <Equipments>[];
      json['equipments'].forEach((v) {
        equipments!.add(Equipments.fromJson(v));
      });
    }
    if (json['costumes'] != null) {
      costumes = <Costumes>[];
      json['costumes'].forEach((v) {
        costumes!.add(Costumes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (equipments != null) {
      data['equipments'] = equipments!.map((v) => v.toJson()).toList();
    }
    if (costumes != null) {
      data['costumes'] = costumes!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  List<String> get equippedEquipmentIds {
    return (equipments ?? [])
        .where((e) => e.equipped ?? false)
        .map((e) => e.itemId!)
        .toList();
  }

  List<String> get equippedCostumeIds {
    return (costumes ?? [])
        .where((e) => e.equipped ?? false)
        .map((e) => e.itemId!)
        .toList();
  }
}

class Equipments {
  int? id;
  String? itemId;
  int? grade;
  String? itemType;
  String? itemSubType;
  String? elementalType;
  int? level;
  Stat? stat;
  StatsMap? statsMap;
  bool? equipped;
  List<Skills>? skills;
  int? lastUpdate;

  Equipments({
    this.id,
    this.itemId,
    this.grade,
    this.itemType,
    this.itemSubType,
    this.elementalType,
    this.level,
    this.stat,
    this.statsMap,
    this.equipped,
    this.skills,
    this.lastUpdate = 0,
  });

  Equipments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    itemId = json['itemId'];
    grade = json['grade'];
    itemType = json['itemType'];
    itemSubType = json['itemSubType'];
    elementalType = json['elementalType'];
    level = json['level'];
    stat = json['stat'] != null ? Stat.fromJson(json['stat']) : null;
    statsMap =
        json['statsMap'] != null ? StatsMap.fromJson(json['statsMap']) : null;
    equipped = json['equipped'];
    if (json['skills'] != null) {
      skills = <Skills>[];
      json['skills'].forEach((v) {
        skills!.add(Skills.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['itemId'] = itemId;
    data['grade'] = grade;
    data['itemType'] = itemType;
    data['itemSubType'] = itemSubType;
    data['elementalType'] = elementalType;
    data['level'] = level;
    if (stat != null) {
      data['stat'] = stat!.toJson();
    }
    if (statsMap != null) {
      data['statsMap'] = statsMap!.toJson();
    }
    data['equipped'] = equipped;
    if (skills != null) {
      data['skills'] = skills!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Stat {
  String? statType;
  int? baseValue;
  int? additionalValue;
  int? totalValue;

  Stat({this.statType, this.baseValue});

  Stat.fromJson(Map<String, dynamic> json) {
    statType = json['statType'];
    baseValue = json['baseValue'];
    additionalValue = json['additionalValue'];
    totalValue = json['totalValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statType'] = statType;
    data['baseValue'] = baseValue;
    data['additionalValue'] = additionalValue;
    data['totalValue'] = totalValue;
    return data;
  }

  @override
  String toString() {
    return "$statType - $baseValue";
  }
}

class StatsMap {
  int? hP;
  int? aTK;
  int? dEF;
  int? cRI;
  int? hIT;
  int? sPD;

  StatsMap({this.hP, this.aTK, this.dEF, this.cRI, this.hIT, this.sPD});

  StatsMap.fromJson(Map<String, dynamic> json) {
    hP = json['hP'];
    aTK = json['aTK'];
    dEF = json['dEF'];
    cRI = json['cRI'];
    hIT = json['hIT'];
    sPD = json['sPD'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hP'] = hP;
    data['aTK'] = aTK;
    data['dEF'] = dEF;
    data['cRI'] = cRI;
    data['hIT'] = hIT;
    data['sPD'] = sPD;
    return data;
  }

  @override
  String toString() {
    if ((hP ?? 0) > 0) {
      return "HP $hP";
    } else if ((aTK ?? 0) > 0) {
      return "ATK $aTK";
    } else if ((dEF ?? 0) > 0) {
      return "DEF $dEF";
    } else if ((cRI ?? 0) > 0) {
      return "CRI $cRI";
    } else if ((hIT ?? 0) > 0) {
      return "HIT $hIT";
    } else if ((sPD ?? 0) > 0) {
      return "SPD $sPD";
    }
    return "${hP ?? aTK ?? dEF ?? cRI ?? hIT ?? sPD}";
  }

  Map<String, int> get avaiableValues {
    Map<String, int> rs = {};
    if ((hP ?? 0) > 0) {
      rs['HP'] = hP!;
    }
    if ((aTK ?? 0) > 0) {
      rs['aTK'] = aTK!;
    }
    if ((dEF ?? 0) > 0) {
      rs['dEF'] = dEF!;
    }
    if ((cRI ?? 0) > 0) {
      rs['cRI'] = cRI!;
    }
    if ((hIT ?? 0) > 0) {
      rs['hIT'] = hIT!;
    }
    if ((sPD ?? 0) > 0) {
      rs['sPD'] = sPD!;
    }
    return rs;
  }
}

class Skills {
  String? elementalType;
  int? power;
  int? chance;

  Skills({this.elementalType, this.power, this.chance});

  Skills.fromJson(Map<String, dynamic> json) {
    elementalType = json['elementalType'];
    power = json['power'];
    chance = json['chance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['elementalType'] = elementalType;
    data['power'] = power;
    data['chance'] = chance;
    return data;
  }
}

class Runes {
  int? runeId;
  int? level;

  Runes({this.runeId, this.level});

  Runes.fromJson(Map<String, dynamic> json) {
    runeId = json['runeId'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['runeId'] = runeId;
    data['level'] = level;
    return data;
  }
}

class Costumes {
  int? id;
  String? itemId;
  int? grade;
  String? itemType;
  String? itemSubType;
  String? elementalType;
  bool? equipped;

  Costumes({
    this.id,
    this.itemId,
    this.grade,
    this.itemType,
    this.itemSubType,
    this.elementalType,
    this.equipped,
  });

  Costumes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    itemId = json['itemId'];
    grade = json['grade'];
    itemType = json['itemType'];
    itemSubType = json['itemSubType'];
    elementalType = json['elementalType'];
    equipped = json['equipped'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['itemId'] = itemId;
    data['grade'] = grade;
    data['itemType'] = itemType;
    data['itemSubType'] = itemSubType;
    data['elementalType'] = elementalType;
    data['equipped'] = equipped;
    return data;
  }
}
