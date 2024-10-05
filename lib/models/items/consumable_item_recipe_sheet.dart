
class ConsumableItemRecipeSheet {
    int id;
    int requiredBlockIndex;
    int requiredAp;
    int requiredGold;
    int materialItemId1;
    int materialItemCount1;
    int? materialItemId2;
    int? materialItemCount2;
    int? materialItemId3;
    int? materialItemCount3;
    int? materialItemId4;
    int? materialItemCount4;
    String resultConsumableItemId;

    ConsumableItemRecipeSheet({
        required this.id,
        required this.requiredBlockIndex,
        required this.requiredAp,
        required this.requiredGold,
        required this.materialItemId1,
        required this.materialItemCount1,
        required this.materialItemId2,
        required this.materialItemCount2,
        required this.materialItemId3,
        required this.materialItemCount3,
        required this.materialItemId4,
        required this.materialItemCount4,
        required this.resultConsumableItemId,
    });

    factory ConsumableItemRecipeSheet.fromJson(Map<String, dynamic> json) => ConsumableItemRecipeSheet(
        id: json["id"],
        requiredBlockIndex: json["required_block_index"],
        requiredAp: json["required_ap"],
        requiredGold: json["required_gold"],
        materialItemId1: json["material_item_id_1"],
        materialItemCount1: json["material_item_count_1"],
        materialItemId2: json["material_item_id_2"],
        materialItemCount2: json["material_item_count_2"],
        materialItemId3: json["material_item_id_3"],
        materialItemCount3: json["material_item_count_3"],
        materialItemId4: json["material_item_id_4"],
        materialItemCount4: json["material_item_count_4"],
        resultConsumableItemId: json["result_consumable_item_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "required_block_index": requiredBlockIndex,
        "required_ap": requiredAp,
        "required_gold": requiredGold,
        "material_item_id_1": materialItemId1,
        "material_item_count_1": materialItemCount1,
        "material_item_id_2": materialItemId2,
        "material_item_count_2": materialItemCount2,
        "material_item_id_3": materialItemId3,
        "material_item_count_3": materialItemCount3,
        "material_item_id_4": materialItemId4,
        "material_item_count_4": materialItemCount4,
        "result_consumable_item_id": resultConsumableItemId,
    };
}
