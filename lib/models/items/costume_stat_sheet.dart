
class CostumeStatSheet {
    int id;
    int costumeId;
    StatType statType;
    int stat;

    CostumeStatSheet({
        required this.id,
        required this.costumeId,
        required this.statType,
        required this.stat,
    });

    factory CostumeStatSheet.fromJson(Map<String, dynamic> json) => CostumeStatSheet(
        id: json["id"],
        costumeId: json["costume_id"],
        statType: statTypeValues.map[json["stat_type"]]!,
        stat: json["stat"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "costume_id": costumeId,
        "stat_type": statTypeValues.reverse[statType],
        "stat": stat,
    };
}

enum StatType {
    ATK,
    DEF,
    HIT,
    HP,
    SPD
}

final statTypeValues = EnumValues({
    "ATK": StatType.ATK,
    "DEF": StatType.DEF,
    "HIT": StatType.HIT,
    "HP": StatType.HP,
    "SPD": StatType.SPD
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
