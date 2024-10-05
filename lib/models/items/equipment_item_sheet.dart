
class EquipmentItemSheet {
    int id;
    String name;
    ItemSubType itemSubType;
    int grade;
    ElementalType elementalType;
    int setId;
    StatType statType;
    int statValue;
    int attackRange;
    String spineResourcePath;
    int exp;

    EquipmentItemSheet({
        required this.id,
        required this.name,
        required this.itemSubType,
        required this.grade,
        required this.elementalType,
        required this.setId,
        required this.statType,
        required this.statValue,
        required this.attackRange,
        required this.spineResourcePath,
        required this.exp,
    });

    factory EquipmentItemSheet.fromJson(Map<String, dynamic> json) => EquipmentItemSheet(
        id: json["id"],
        name: json["_name"],
        itemSubType: itemSubTypeValues.map[json["item_sub_type"]]!,
        grade: json["grade"],
        elementalType: elementalTypeValues.map[json["elemental_type"]]!,
        setId: json["set_id"],
        statType: statTypeValues.map[json["stat_type"]]!,
        statValue: json["stat_value"],
        attackRange: json["attack_range"],
        spineResourcePath: json["spine_resource_path"],
        exp: json["exp"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "_name": name,
        "item_sub_type": itemSubTypeValues.reverse[itemSubType],
        "grade": grade,
        "elemental_type": elementalTypeValues.reverse[elementalType],
        "set_id": setId,
        "stat_type": statTypeValues.reverse[statType],
        "stat_value": statValue,
        "attack_range": attackRange,
        "spine_resource_path": spineResourcePath,
        "exp": exp,
    };
}

enum ElementalType {
    FIRE,
    LAND,
    NORMAL,
    WATER,
    WIND
}

final elementalTypeValues = EnumValues({
    "Fire": ElementalType.FIRE,
    "Land": ElementalType.LAND,
    "Normal": ElementalType.NORMAL,
    "Water": ElementalType.WATER,
    "Wind": ElementalType.WIND
});

enum ItemSubType {
    ARMOR,
    AURA,
    BELT,
    NECKLACE,
    RING,
    WEAPON
}

final itemSubTypeValues = EnumValues({
    "Armor": ItemSubType.ARMOR,
    "Aura": ItemSubType.AURA,
    "Belt": ItemSubType.BELT,
    "Necklace": ItemSubType.NECKLACE,
    "Ring": ItemSubType.RING,
    "Weapon": ItemSubType.WEAPON
});

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
