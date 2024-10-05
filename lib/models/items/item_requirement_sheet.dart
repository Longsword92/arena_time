
class ItemRequirementSheet {
    int itemId;
    int level;
    int mimislevel;

    ItemRequirementSheet({
        required this.itemId,
        required this.level,
        required this.mimislevel,
    });

    factory ItemRequirementSheet.fromJson(Map<String, dynamic> json) => ItemRequirementSheet(
        itemId: json["item_id"],
        level: json["level"],
        mimislevel: json["mimislevel"],
    );

    Map<String, dynamic> toJson() => {
        "item_id": itemId,
        "level": level,
        "mimislevel": mimislevel,
    };
}
