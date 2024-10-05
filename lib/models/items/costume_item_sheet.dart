
class CostumeItemSheet {
    int the40100000;
    String empty;
    FullCostume fullCostume;
    int the4;
    Normal normal;
    String field6;

    CostumeItemSheet({
        required this.the40100000,
        required this.empty,
        required this.fullCostume,
        required this.the4,
        required this.normal,
        required this.field6,
    });

    factory CostumeItemSheet.fromJson(Map<String, dynamic> json) => CostumeItemSheet(
        the40100000: json["40100000"],
        empty: json["발키리"],
        fullCostume: fullCostumeValues.map[json["FullCostume"]]!,
        the4: json["4"],
        normal: normalValues.map[json["Normal"]]!,
        field6: json["FIELD6"],
    );

    Map<String, dynamic> toJson() => {
        "40100000": the40100000,
        "발키리": empty,
        "FullCostume": fullCostumeValues.reverse[fullCostume],
        "4": the4,
        "Normal": normalValues.reverse[normal],
        "FIELD6": field6,
    };
}

enum FullCostume {
    EAR_COSTUME,
    EYE_COSTUME,
    FULL_COSTUME,
    HAIR_COSTUME,
    TAIL_COSTUME,
    TITLE
}

final fullCostumeValues = EnumValues({
    "EarCostume": FullCostume.EAR_COSTUME,
    "EyeCostume": FullCostume.EYE_COSTUME,
    "FullCostume": FullCostume.FULL_COSTUME,
    "HairCostume": FullCostume.HAIR_COSTUME,
    "TailCostume": FullCostume.TAIL_COSTUME,
    "Title": FullCostume.TITLE
});

enum Normal {
    NORMAL
}

final normalValues = EnumValues({
    "Normal": Normal.NORMAL
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
