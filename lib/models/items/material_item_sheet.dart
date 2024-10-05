
class MaterialItemSheet {
    int id;
    String name;
    ItemSubType itemSubType;
    int grade;
    ElementalType elementalType;

    MaterialItemSheet({
        required this.id,
        required this.name,
        required this.itemSubType,
        required this.grade,
        required this.elementalType,
    });

    factory MaterialItemSheet.fromJson(Map<String, dynamic> json) => MaterialItemSheet(
        id: json["id"],
        name: json["_name"],
        itemSubType: itemSubTypeValues.map[json["item_sub_type"]]!,
        grade: json["grade"],
        elementalType: elementalTypeValues.map[json["elemental_type"]]!,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "_name": name,
        "item_sub_type": itemSubTypeValues.reverse[itemSubType],
        "grade": grade,
        "elemental_type": elementalTypeValues.reverse[elementalType],
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
    AP_STONE,
    EQUIPMENT_MATERIAL,
    FOOD_MATERIAL,
    HOURGLASS,
    MONSTER_PART,
    NORMAL_MATERIAL
}

final itemSubTypeValues = EnumValues({
    "ApStone": ItemSubType.AP_STONE,
    "EquipmentMaterial": ItemSubType.EQUIPMENT_MATERIAL,
    "FoodMaterial": ItemSubType.FOOD_MATERIAL,
    "Hourglass": ItemSubType.HOURGLASS,
    "MonsterPart": ItemSubType.MONSTER_PART,
    "NormalMaterial": ItemSubType.NORMAL_MATERIAL
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
