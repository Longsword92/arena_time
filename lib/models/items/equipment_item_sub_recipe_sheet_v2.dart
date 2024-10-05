
class EquipmentItemSubRecipeSheetV2 {
    int id;
    int requiredActionPoint;
    int requiredGold;
    int requiredBlockIndex;
    int? materialId;
    int? materialCount;
    int? material2Id;
    int? material2Count;
    int? material3Id;
    int? material3Count;
    int optionId;
    int optionRatio;
    int option1RequiredBlockIndex;
    int? option2Id;
    int? option2Ratio;
    int? option2RequiredBlockIndex;
    int? option3Id;
    int? option3Ratio;
    int? option3RequiredBlockIndex;
    int? option4Id;
    int? option4Ratio;
    int? option4RequiredBlockIndex;
    bool isMimisbrunnrSubRecipe;
    int rewardHammerPoint;

    EquipmentItemSubRecipeSheetV2({
        required this.id,
        required this.requiredActionPoint,
        required this.requiredGold,
        required this.requiredBlockIndex,
        required this.materialId,
        required this.materialCount,
        required this.material2Id,
        required this.material2Count,
        required this.material3Id,
        required this.material3Count,
        required this.optionId,
        required this.optionRatio,
        required this.option1RequiredBlockIndex,
        required this.option2Id,
        required this.option2Ratio,
        required this.option2RequiredBlockIndex,
        required this.option3Id,
        required this.option3Ratio,
        required this.option3RequiredBlockIndex,
        required this.option4Id,
        required this.option4Ratio,
        required this.option4RequiredBlockIndex,
        required this.isMimisbrunnrSubRecipe,
        required this.rewardHammerPoint,
    });

    factory EquipmentItemSubRecipeSheetV2.fromJson(Map<String, dynamic> json) => EquipmentItemSubRecipeSheetV2(
        id: json["ID"],
        requiredActionPoint: json["required_action_point"],
        requiredGold: json["required_gold"],
        requiredBlockIndex: json["required_block_index"],
        materialId: json["material_id"],
        materialCount: json["material_count"],
        material2Id: json["material_2_id"],
        material2Count: json["material_2_count"],
        material3Id: json["material_3_id"],
        material3Count: json["material_3_count"],
        optionId: json["option_id"],
        optionRatio: json["option_ratio"],
        option1RequiredBlockIndex: json["option_1_required_block_index"],
        option2Id: json["option_2_id"],
        option2Ratio: json["option_2_ratio"],
        option2RequiredBlockIndex: json["option_2_required_block_index"],
        option3Id: json["option_3_id"],
        option3Ratio: json["option_3_ratio"],
        option3RequiredBlockIndex: json["option_3_required_block_index"],
        option4Id: json["option_4_id"],
        option4Ratio: json["option_4_ratio"],
        option4RequiredBlockIndex: json["option_4_required_block_index"],
        isMimisbrunnrSubRecipe: json["is_mimisbrunnr_sub_recipe"],
        rewardHammerPoint: json["reward_hammer_point"],
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "required_action_point": requiredActionPoint,
        "required_gold": requiredGold,
        "required_block_index": requiredBlockIndex,
        "material_id": materialId,
        "material_count": materialCount,
        "material_2_id": material2Id,
        "material_2_count": material2Count,
        "material_3_id": material3Id,
        "material_3_count": material3Count,
        "option_id": optionId,
        "option_ratio": optionRatio,
        "option_1_required_block_index": option1RequiredBlockIndex,
        "option_2_id": option2Id,
        "option_2_ratio": option2Ratio,
        "option_2_required_block_index": option2RequiredBlockIndex,
        "option_3_id": option3Id,
        "option_3_ratio": option3Ratio,
        "option_3_required_block_index": option3RequiredBlockIndex,
        "option_4_id": option4Id,
        "option_4_ratio": option4Ratio,
        "option_4_required_block_index": option4RequiredBlockIndex,
        "is_mimisbrunnr_sub_recipe": isMimisbrunnrSubRecipe,
        "reward_hammer_point": rewardHammerPoint,
    };
}
