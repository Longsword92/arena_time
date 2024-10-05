
class EquipmentItemRecipeSheet {
    int id;
    int resultEquipmentId;
    int materialId;
    int materialCount;
    int requiredActionPoint;
    int requiredGold;
    int requiredBlockIndex;
    int unlockStage;
    int subRecipeId;
    int? subRecipeId2;
    int? subRecipeId3;
    int requiredCrystal;
    ItemSubType itemSubType;

    EquipmentItemRecipeSheet({
        required this.id,
        required this.resultEquipmentId,
        required this.materialId,
        required this.materialCount,
        required this.requiredActionPoint,
        required this.requiredGold,
        required this.requiredBlockIndex,
        required this.unlockStage,
        required this.subRecipeId,
        required this.subRecipeId2,
        required this.subRecipeId3,
        required this.requiredCrystal,
        required this.itemSubType,
    });

    factory EquipmentItemRecipeSheet.fromJson(Map<String, dynamic> json) => EquipmentItemRecipeSheet(
        id: json["id"],
        resultEquipmentId: json["result_equipment_id"],
        materialId: json["material_id"],
        materialCount: json["material_count"],
        requiredActionPoint: json["required_action_point"],
        requiredGold: json["required_gold"],
        requiredBlockIndex: json["required_block_index"],
        unlockStage: json["unlock_stage"],
        subRecipeId: json["sub_recipe_id"],
        subRecipeId2: json["sub_recipe_id_2"],
        subRecipeId3: json["sub_recipe_id_3"],
        requiredCrystal: json["required_crystal"],
        itemSubType: itemSubTypeValues.map[json["item_sub_type"]]!,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "result_equipment_id": resultEquipmentId,
        "material_id": materialId,
        "material_count": materialCount,
        "required_action_point": requiredActionPoint,
        "required_gold": requiredGold,
        "required_block_index": requiredBlockIndex,
        "unlock_stage": unlockStage,
        "sub_recipe_id": subRecipeId,
        "sub_recipe_id_2": subRecipeId2,
        "sub_recipe_id_3": subRecipeId3,
        "required_crystal": requiredCrystal,
        "item_sub_type": itemSubTypeValues.reverse[itemSubType],
    };
}

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

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
