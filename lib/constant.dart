import 'models/node.dart';

class Constant {
  static List<Node> odinNodes = <Node>[
    Node("2", "https://9c-main-rpc-2.nine-chronicles.com/graphql"),
    Node("3", "https://9c-main-rpc-3.nine-chronicles.com/graphql"),
    Node("1", "https://9c-main-rpc-1.nine-chronicles.com/graphql"),
    // Node("sgp-nc-1", "http://sgp-nc-1.ninodes.com/graphql"),
    // Node("sgp-nc-2", "http://sgp-nc-2.ninodes.com/graphql"),
    // Node("ash-nc-1", "http://ash-nc-1.ninodes.com/graphql"),
    // Node("phx-nc-1", "http://phx-nc-1.ninodes.com/graphql"),
    // Node("nld-nc-1", "http://nld-nc-1.ninodes.com/graphql"),
    // Node("4", "https://9c-main-rpc-4.nine-chronicles.com/graphql"),
    // Node("5", "https://9c-main-rpc-5.nine-chronicles.com/graphql"),
    // Node("fra", "https://fra-nc-1.ninodes.com/graphql"),
    // Node("sgp", "https://sgp-nc-1.ninodes.com/graphql"),
    // Node("ln", "https://la-nc-1.ninodes.com/graphql"),
    // Node("internal", "https://9c-main-rpc-5.nine-chronicles.com/graphql"),
  ];

  static List<Node> heimdallNodes = <Node>[
    Node("rpc-1", "https://heimdall-rpc-1.nine-chronicles.com/graphql"),
    Node("rpc-2", "https://heimdall-rpc-2.nine-chronicles.com/graphql"),
    Node("rpc-3", "https://heimdall-rpc-3.nine-chronicles.com/graphql"),
    Node("rpc-4", "https://heimdall-rpc-4.nine-chronicles.com/graphql"),
    Node("rpc-5", "https://heimdall-rpc-5.nine-chronicles.com/graphql"),
  ];

  static List<Node> nodes({String? server}) {
    if (server == "odin") {
      return odinNodes;
    }
    return heimdallNodes;
  }

  static String planetId({String? server}) {
    if (server == "odin") {
      return "0x000000000000";
    }
    return "0x000000000001";
  }

  static String blockHash({String? server}) {
    if (server == "odin") {
      return "4582250d0da33b06779a8475d283d5dd210c683b9b999d74d03fac4f58fa6bce";
    }
    return "729fa26958648a35b53e8e3905d11ec53b1b4929bf5f499884aed7df616f5913";
  }

  static String marketUrl({String? server}) {
    if (server == "odin") {
      return "market.9c.gg";
    }
    return "heimdall-market.9c.gg";
  }


  static String applicationFolder = "9c";

  static Map<int, int> unlockWorldSheet = {
    50: 500,
    100: 2500,
    150: 50000,
    200: 100000,
    250: 1000000,
    300: 1000000,
  };
}

enum ActionType {
  combinationEquipment15("combination_equipment15"),
  dailyReward6("daily_reward6");

  const ActionType(this.value);
  final String value;
}

enum TxStatus {
  invalid("INVALID"),
  staging("STAGING"),
  success("SUCCESS"),
  failure("FAILURE"),
  wait("WAIT"),
  reqFail("REQ FAIL"),
  request("REQUEST");

  const TxStatus(this.value);
  final String value;
}

enum FormatTimeString {
  f1WithTz("yyyy-MM-ddTHH:mm:ssZ");

  const FormatTimeString(this.value);
  final String value;
}

enum ServerType {
  odin,
  heimdall,
}


enum SkillCategory {
  NormalAttack,
  BlowAttack,
  DoubleAttack, // Attack enemy two times
  AreaAttack,
  BuffRemovalAttack,
  ShatterStrike, // Damage based on enemy's full HP

  Heal,

  // todo: 코드상에서 버프와 디버프를 버프로 함께 구분하고 있는데, 고도화 될 수록 디버프를 구분해주게 될 것으로 보임.
  HPBuff,
  AttackBuff,
  DefenseBuff,
  CriticalBuff,
  HitBuff,
  SpeedBuff,
  DamageReductionBuff,
  CriticalDamageBuff,
  Buff,
  Debuff,
  TickDamage,
  Focus, // Always hit enemy.
  Dispel, // Remove/defence debuffs
}
