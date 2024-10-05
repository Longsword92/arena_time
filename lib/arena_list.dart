import 'package:intl/intl.dart';
import 'package:collection/collection.dart';

import 'entitys/arena_scheduler.dart';

class ArenaSeason {
  final int roundOnSeason;
  final int roundOnSeasonEndBlock;
  final int roundOnSeasonRemainBlock;
  final int totalRound;

  ArenaSeason(
    this.roundOnSeason,
    this.roundOnSeasonEndBlock,
    this.roundOnSeasonRemainBlock,
    this.totalRound,
  );

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  String blockToTimeString(double agvBlockTime) {
    int time = (roundOnSeasonRemainBlock * agvBlockTime).round(); // seconds
    return _printDuration(Duration(seconds: time));
  }

  String blockToTime2String(double agvBlockTime) {
    int time = (roundOnSeasonRemainBlock * agvBlockTime).round(); // seconds
    return DateFormat('HH:mm:ss')
        .format(DateTime.now().add(Duration(seconds: time)));
  }
}

class ArenaMaster {
  static ArenaScheduler? getCurrentArena(
      int currentBlock, List<ArenaScheduler> arenaList) {
    // currenr rank
    ArenaScheduler? currentArenaInfo = arenaList.firstWhereOrNull(
        (x) => x.startBlock <= currentBlock && currentBlock <= x.endBlock);

    return currentArenaInfo;
  }
}
