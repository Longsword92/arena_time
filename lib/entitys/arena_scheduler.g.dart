// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'arena_scheduler.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArenaScheduler _$ArenaSchedulerFromJson(Map<String, dynamic> json) =>
    ArenaScheduler(
      const JsonStringToInt().fromJson(json['id']),
      const JsonStringToInt().fromJson(json['round']),
      json['arena_type'] as String,
      const JsonStringToInt().fromJson(json['start_block_index']),
      const JsonStringToInt().fromJson(json['end_block_index']),
      const JsonStringToInt().fromJson(json['required_medal_count']),
      const JsonStringToInt().fromJson(json['ticket_price']),
      const JsonStringToInt().fromJson(json['additional_ticket_price']),
      const JsonStringToInt().fromJson(json['max_purchase_count']),
      const JsonStringToInt()
          .fromJson(json['max_purchase_count_during_interval']),
    );

Map<String, dynamic> _$ArenaSchedulerToJson(ArenaScheduler instance) =>
    <String, dynamic>{
      'id': const JsonStringToInt().toJson(instance.id),
      'round': const JsonStringToInt().toJson(instance.round),
      'arena_type': instance.type,
      'start_block_index': const JsonStringToInt().toJson(instance.startBlock),
      'end_block_index': const JsonStringToInt().toJson(instance.endBlock),
      'required_medal_count':
          const JsonStringToInt().toJson(instance.requiredMedalCount),
      'ticket_price': const JsonStringToInt().toJson(instance.ticketPrice),
      'additional_ticket_price':
          const JsonStringToInt().toJson(instance.additionalTicketPrice),
      'max_purchase_count':
          const JsonStringToInt().toJson(instance.maxPurchaseCount),
      'max_purchase_count_during_interval': const JsonStringToInt()
          .toJson(instance.maxPurchaseCountDuringInterval),
    };
