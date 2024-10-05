
class ConsumableItemSheet {
    int id;
    String name;
    ItemSubType itemSubType;
    int grade;
    ElementalType elementalType;
    StatType statType1;
    int? statValue1;
    StatType statType2;
    int? statValue2;

    ConsumableItemSheet({
        required this.id,
        required this.name,
        required this.itemSubType,
        required this.grade,
        required this.elementalType,
        required this.statType1,
        required this.statValue1,
        required this.statType2,
        required this.statValue2,
    });

    factory ConsumableItemSheet.fromJson(Map<String, dynamic> json) => ConsumableItemSheet(
        id: json["id"],
        name: json["_name"],
        itemSubType: itemSubTypeValues.map[json["item_sub_type"]]!,
        grade: json["grade"],
        elementalType: elementalTypeValues.map[json["elemental_type"]]!,
        statType1: statTypeValues.map[json["stat_type_1"]]!,
        statValue1: json["stat_value_1"],
        statType2: statTypeValues.map[json["stat_type_2"]]!,
        statValue2: json["stat_value_2"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "_name": name,
        "item_sub_type": itemSubTypeValues.reverse[itemSubType],
        "grade": grade,
        "elemental_type": elementalTypeValues.reverse[elementalType],
        "stat_type_1": statTypeValues.reverse[statType1],
        "stat_value_1": statValue1,
        "stat_type_2": statTypeValues.reverse[statType2],
        "stat_value_2": statValue2,
    };
}

enum ElementalType {
    NORMAL
}

final elementalTypeValues = EnumValues({
    "Normal": ElementalType.NORMAL
});

enum ItemSubType {
    FOOD
}

final itemSubTypeValues = EnumValues({
    "Food": ItemSubType.FOOD
});

enum StatType {
    ATK,
    CRI,
    DEF,
    EMPTY,
    HP,
    SPD
}

final statTypeValues = EnumValues({
    "ATK": StatType.ATK,
    "CRI": StatType.CRI,
    "DEF": StatType.DEF,
    "": StatType.EMPTY,
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
