
class EquipmentItemOptionSheet {
    int id;
    Type statType;
    int? statMin;
    int? statMax;
    int? skillId;
    int? skillDamageMin;
    int? skillDamageMax;
    int? skillChanceMin;
    int? skillChanceMax;
    int? statDamageRatioMin;
    int? statDamageRatioMax;
    Type referencedStattype;

    EquipmentItemOptionSheet({
        required this.id,
        required this.statType,
        required this.statMin,
        required this.statMax,
        required this.skillId,
        required this.skillDamageMin,
        required this.skillDamageMax,
        required this.skillChanceMin,
        required this.skillChanceMax,
        required this.statDamageRatioMin,
        required this.statDamageRatioMax,
        required this.referencedStattype,
    });

    factory EquipmentItemOptionSheet.fromJson(Map<String, dynamic> json) => EquipmentItemOptionSheet(
        id: json["id"],
        statType: typeValues.map[json["stat_type"]]!,
        statMin: json["stat_min"],
        statMax: json["stat_max"],
        skillId: json["skill_id"],
        skillDamageMin: json["skill_damage_min"],
        skillDamageMax: json["skill_damage_max"],
        skillChanceMin: json["skill_chance_min"],
        skillChanceMax: json["skill_chance_max"],
        statDamageRatioMin: json["stat_damage_ratio_min"],
        statDamageRatioMax: json["stat_damage_ratio_max"],
        referencedStattype: typeValues.map[json["referenced_stattype"]]!,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "stat_type": typeValues.reverse[statType],
        "stat_min": statMin,
        "stat_max": statMax,
        "skill_id": skillId,
        "skill_damage_min": skillDamageMin,
        "skill_damage_max": skillDamageMax,
        "skill_chance_min": skillChanceMin,
        "skill_chance_max": skillChanceMax,
        "stat_damage_ratio_min": statDamageRatioMin,
        "stat_damage_ratio_max": statDamageRatioMax,
        "referenced_stattype": typeValues.reverse[referencedStattype],
    };
}

enum Type {
    ATK,
    DEF,
    EMPTY,
    HIT,
    HP,
    SPD
}

final typeValues = EnumValues({
    "ATK": Type.ATK,
    "DEF": Type.DEF,
    "": Type.EMPTY,
    "HIT": Type.HIT,
    "HP": Type.HP,
    "SPD": Type.SPD
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
