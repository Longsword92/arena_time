import 'package:json_annotation/json_annotation.dart';

import 'skill_model.dart';
import 'stat_model.dart';
part 'item_product.g.dart';

@JsonSerializable()
class ItemProduct {
  String? productId;
  String? sellerAgentAddress;
  String? sellerAvatarAddress;
  double? price;
  int? quantity;
  int? registeredBlockIndex;
  bool? exist;
  bool? legacy;
  int? itemId;
  int? grade;
  int? itemType;
  int? itemSubType;
  int? elementalType;
  String? tradableId;
  int? setId;
  int? combatPoint;
  int? level;
  List<SkillModel>? skillModels;
  List<StatModel>? statModels;
  int? optionCountFromCombination;
  double? unitPrice;
  double? crystal;
  double? crystalPerPrice;

  ItemProduct({
    this.productId,
    this.sellerAgentAddress,
    this.sellerAvatarAddress,
    this.price,
    this.quantity,
    this.registeredBlockIndex,
    this.exist,
    this.legacy,
    this.itemId,
    this.grade,
    this.itemType,
    this.itemSubType,
    this.elementalType,
    this.tradableId,
    this.setId,
    this.combatPoint,
    this.level,
    this.skillModels,
    this.statModels,
    this.optionCountFromCombination,
    this.unitPrice,
    this.crystal,
    this.crystalPerPrice,
  });

  factory ItemProduct.fromJson(Map<String, dynamic> json) =>
      _$ItemProductFromJson(json);
  Map<String, dynamic> toJson() => _$ItemProductToJson(this);

  StatModel get mainStat {
    StatModel main = statModels!.firstWhere((e) => !e.additional!);
    int value = statModels!
        .where((e) => e.additional! && main.type == e.type)
        .toList()
        .fold(0, (a, b) => a + b.value!);
    return StatModel(
        additional: main.additional,
        type: main.type,
        value: value + main.value!);
  }

  List<StatModel> get additionalStat {
    return statModels!.where((e) => e.additional!).toList();
  }

  String get elementalTypeDisplay {
    var types = [
      'Normal',
      'Fire',
      'Water',
      'Land',
      'Wind',
    ];
    return types[elementalType!];
  }

  bool get isEquiment {
    return itemSubType! > 5 && itemSubType! < 11;
  }
}
