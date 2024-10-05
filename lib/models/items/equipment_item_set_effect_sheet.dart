
class EquipmentItemSetEffectSheet {
    int id;
    int count;
    StatType statType;
    ModifyType modifyType;
    int modifyValue;

    EquipmentItemSetEffectSheet({
        required this.id,
        required this.count,
        required this.statType,
        required this.modifyType,
        required this.modifyValue,
    });

    factory EquipmentItemSetEffectSheet.fromJson(Map<String, dynamic> json) => EquipmentItemSetEffectSheet(
        id: json["id"],
        count: json["count"],
        statType: statTypeValues.map[json["stat_type"]]!,
        modifyType: modifyTypeValues.map[json["modify_type"]]!,
        modifyValue: json["modify_value"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "count": count,
        "stat_type": statTypeValues.reverse[statType],
        "modify_type": modifyTypeValues.reverse[modifyType],
        "modify_value": modifyValue,
    };
}

enum ModifyType {
    ADD
}

final modifyTypeValues = EnumValues({
    "Add": ModifyType.ADD
});

enum StatType {
    HP
}

final statTypeValues = EnumValues({
    "HP": StatType.HP
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
