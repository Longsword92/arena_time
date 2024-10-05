import 'dart:async';
import 'dart:convert';

import 'package:arena_time/api9c.dart';
import 'package:arena_time/arena_list.dart';
import 'package:arena_time/file_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'database_helper.dart';
import 'drawer_menu.dart';
import 'entitys/arena_scheduler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await DatabaseMG().openConnection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nine Chronicles',
      theme: ThemeData.dark(),
      home: const HomePage(),
      builder: EasyLoading.init(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer? _periodic;
  double _avgBlockTime = 0;
  String _round = "";
  String _remainTime = "";
  String _remainTime2 = "";
  int _endBlock = 0;
  int _currentBlock = 0;
  int _remaingBlock = 0;

  double _heimdallAvgBlockTime = 0;
  String _heimdallRound = "";
  String _heimdallRemainTime = "";
  String _heimdallRemainTime2 = "";
  int _heimdallEndBlock = 0;
  int _heimdallCurrentBlock = 0;
  int _heimdallRemaingBlock = 0;

  bool isHeimdallLoading = true;
  bool isOdinLoading = true;
  static DatabaseHelper? _databaseHelper;
  List<ArenaScheduler> _odinArenaSchedulers = [];
  List<ArenaScheduler> _heimdallArenaSchedulers = [];

  @override
  void initState() {
    super.initState();
    fetch();
    _periodic = Timer.periodic(const Duration(seconds: 12), (timer) {
      updateAvgTimeBlock();
      updateHeimdallAvgTimeBlock();
    });
  }

  void fetch() async {
    // first time
    _databaseHelper = DatabaseHelper();
    var arenaSchedulers = await _databaseHelper?.arenaSchedulers() ?? [];
    _odinArenaSchedulers =
        arenaSchedulers.where((x) => x.serverName == ServerName.Odin).toList();
    _heimdallArenaSchedulers = arenaSchedulers
        .where((x) => x.serverName == ServerName.Heimdall)
        .toList();

    updateAvgTimeBlock();
    updateHeimdallAvgTimeBlock();
  }

  @override
  void dispose() {
    _periodic?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arena time'),
        actions: [
          IconButton(
            iconSize: 30.0,
            padding: const EdgeInsets.only(right: 15.0),
            icon: Row(
              children: [
                const Icon(Icons.import_export),
                Text(ServerName.Heimdall.name),
              ],
            ),
            onPressed: () => importSchedule(serverName: ServerName.Heimdall),
          ),
          IconButton(
            iconSize: 30.0,
            padding: const EdgeInsets.only(right: 15.0),
            icon: Row(
              children: [
                const Icon(Icons.import_export),
                Text(ServerName.Odin.name),
              ],
            ),
            onPressed: () => importSchedule(),
          )
        ],
      ),
      drawer: const DrawerMenu(),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'Avg block time',
                          ),
                          Text(
                            "$_avgBlockTime",
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'Round',
                          ),
                          Text(
                            _round,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Remaning block',
                      ),
                      Text(
                        "$_remaingBlock",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'Remaing',
                          ),
                          Text(
                            _remainTime,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'End time',
                          ),
                          Text(
                            _remainTime2,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'Avg block time',
                          ),
                          Text(
                            "$_heimdallAvgBlockTime",
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'Round',
                          ),
                          Text(
                            _heimdallRound,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Remaning block',
                      ),
                      Text(
                        "$_heimdallRemaingBlock",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'Remaing',
                          ),
                          Text(
                            _heimdallRemainTime,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'End time',
                          ),
                          Text(
                            _heimdallRemainTime2,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: refresh,
        child: Ink(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.blueGrey,
          ),
          child: Icon(
              isOdinLoading & isHeimdallLoading ? Icons.refresh : Icons.block),
        ),
      ),
    );
  }

  void refresh() {
    updateAvgTimeBlock();
    updateHeimdallAvgTimeBlock();
  }

  void importSchedule({ServerName serverName = ServerName.Odin}) {
    EasyLoading.show(
      status: "Importing for $serverName",
      dismissOnTap: true,
    );

    FileUtils.pickFile().then((content) async {
      if (content != null) {
        try {
          var objs = jsonDecode(content);
          List<ArenaScheduler> datas =
              (objs as List).map((e) => ArenaScheduler.fromJson(e)).toList();
          if (datas.isNotEmpty) {
            await _databaseHelper?.deleteAllArenaScheduler(serverName);
            for (var x in datas) {
              x.setServerName(serverName);
            }
            await _databaseHelper?.insertArenaSchedulers(datas);
            setState(() {
              if (serverName == ServerName.Heimdall) {
                _heimdallArenaSchedulers = datas;
              } else if (serverName == ServerName.Odin) {
                _odinArenaSchedulers = datas;
              }
            });
          }
          EasyLoading.dismiss();
        } catch (e) {
          EasyLoading.show(
            status: "Fail",
            dismissOnTap: true,
          );
        }
      } else {
        EasyLoading.show(
          status: "File is invalid",
          dismissOnTap: true,
        );
      }
    });
  }

  void updateAvgTimeBlock() async {
    setState(() {
      isOdinLoading = true;
    });
    API9c.getBlocks(isOdin: true).then((blocks) {
      int totalTerm = 0;
      for (var i = 0; i < blocks.length - 2; i++) {
        var date = DateTime.parse(blocks[i].timestamp!);
        var nextDate = DateTime.parse(blocks[i + 1].timestamp!);
        int term = date.difference(nextDate).inSeconds;
        totalTerm += term;
      }

      // max block
      _currentBlock = blocks[0].index!;
      debugPrint("$_currentBlock");
      // currenr rank
      ArenaScheduler? currentArenaInfo =
          ArenaMaster.getCurrentArena(_currentBlock, _odinArenaSchedulers);

      ArenaSeason? arenaSeason =
          currentArenaInfo?.getRoundOnSeason(_currentBlock);

      setState(() {
        if (arenaSeason != null) {
          _round = "${arenaSeason.roundOnSeason}/${arenaSeason.totalRound}";
          _avgBlockTime = double.parse(
              (totalTerm / (blocks.length - 1)).toStringAsFixed(2));
          _remainTime = arenaSeason.blockToTimeString(_avgBlockTime);
          _remainTime2 = arenaSeason.blockToTime2String(_avgBlockTime);
          _endBlock = arenaSeason.roundOnSeasonEndBlock;
          _remaingBlock = _endBlock - _currentBlock;
        }
        isOdinLoading = false;
      });
    });
  }

  void updateHeimdallAvgTimeBlock() async {
    setState(() {
      isHeimdallLoading = true;
    });
    API9c.getBlocks(isOdin: false).then((blocks) {
      int totalTerm = 0;
      for (var i = 0; i < blocks.length - 2; i++) {
        var date = DateTime.parse(blocks[i].timestamp!);
        var nextDate = DateTime.parse(blocks[i + 1].timestamp!);
        int term = date.difference(nextDate).inSeconds;
        totalTerm += term;
      }

      // max block
      _heimdallCurrentBlock = blocks[0].index!;
      debugPrint("$_heimdallCurrentBlock");
      // currenr rank
      ArenaScheduler? currentArenaInfo =
          ArenaMaster.getCurrentArena(_heimdallCurrentBlock, _heimdallArenaSchedulers);

      ArenaSeason? arenaSeason =
          currentArenaInfo?.getRoundOnSeason(_heimdallCurrentBlock);

      setState(() {
        if (arenaSeason != null) {
          _heimdallRound =
              "${arenaSeason.roundOnSeason}/${arenaSeason.totalRound}";
          _heimdallAvgBlockTime = double.parse(
              (totalTerm / (blocks.length - 1)).toStringAsFixed(2));
          _heimdallRemainTime =
              arenaSeason.blockToTimeString(_heimdallAvgBlockTime);
          _heimdallRemainTime2 =
              arenaSeason.blockToTime2String(_heimdallAvgBlockTime);
          _heimdallEndBlock = arenaSeason.roundOnSeasonEndBlock;
          _heimdallRemaingBlock = _heimdallEndBlock - _heimdallCurrentBlock;
        }

        isHeimdallLoading = false;
      });
    });
  }
}
