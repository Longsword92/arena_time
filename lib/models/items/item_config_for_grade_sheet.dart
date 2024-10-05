
class ItemConfigForGradeSheet {
    int id;
    int monsterPartsCountForCombination;
    int monsterPartsCountForCombinationWithNcg;
    int randomBuffSkillMinCountForCombination;
    int randomBuffSkillMaxCountForCombination;
    int enhancementLimit;

    ItemConfigForGradeSheet({
        required this.id,
        required this.monsterPartsCountForCombination,
        required this.monsterPartsCountForCombinationWithNcg,
        required this.randomBuffSkillMinCountForCombination,
        required this.randomBuffSkillMaxCountForCombination,
        required this.enhancementLimit,
    });

    factory ItemConfigForGradeSheet.fromJson(Map<String, dynamic> json) => ItemConfigForGradeSheet(
        id: json["id"],
        monsterPartsCountForCombination: json["monster_parts_count_for_combination"],
        monsterPartsCountForCombinationWithNcg: json["monster_parts_count_for_combination_with_ncg"],
        randomBuffSkillMinCountForCombination: json["random_buff_skill_min_count_for_combination"],
        randomBuffSkillMaxCountForCombination: json["random_buff_skill_max_count_for_combination"],
        enhancementLimit: json["enhancement_limit"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "monster_parts_count_for_combination": monsterPartsCountForCombination,
        "monster_parts_count_for_combination_with_ncg": monsterPartsCountForCombinationWithNcg,
        "random_buff_skill_min_count_for_combination": randomBuffSkillMinCountForCombination,
        "random_buff_skill_max_count_for_combination": randomBuffSkillMaxCountForCombination,
        "enhancement_limit": enhancementLimit,
    };
}
