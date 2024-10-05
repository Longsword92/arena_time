import 'package:arena_time/apigg.dart';
import 'package:arena_time/models/arena_model.dart';
import 'package:expandable_datatable/expandable_datatable.dart';
import 'package:flutter/material.dart';

import '../../drawer_menu.dart';

class RankPage extends StatefulWidget {
  const RankPage({super.key});

  @override
  State<RankPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<RankPage> {
  BattleArenaRankingResponse? battle;
  late List<ExpandableColumn<dynamic>> headers;
  late List<ExpandableRow> rows;

  bool _isLoading = true;

  void setLoading() {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetch();
  }

  void fetch() async {
    battle = await APIGG.battleArenaRanking(5, 2);
    createDataSource();
    setLoading();
  }

  void createDataSource() {
    headers = [
      ExpandableColumn<int>(columnTitle: "Rank", columnFlex: 1),
      ExpandableColumn<String>(columnTitle: "name", columnFlex: 2),
      ExpandableColumn<int>(columnTitle: "score", columnFlex: 2),
      ExpandableColumn<int>(columnTitle: "winCount", columnFlex: 1),
      ExpandableColumn<int>(columnTitle: "lossCount", columnFlex: 1),
      ExpandableColumn<int>(columnTitle: "purchased", columnFlex: 1),
      ExpandableColumn<int>(columnTitle: "ticket", columnFlex: 1),
    ];

    rows = (battle?.battleArenaRanking ?? []).map<ExpandableRow>((e) {
      return ExpandableRow(cells: [
        ExpandableCell<int>(columnTitle: "Rank", value: e.ranking),
        ExpandableCell<String>(columnTitle: "name", value: e.name),
        ExpandableCell<int>(columnTitle: "score", value: e.score),
        ExpandableCell<int>(columnTitle: "winCount", value: e.winCount),
        ExpandableCell<int>(columnTitle: "lossCount", value: e.lossCount),
        ExpandableCell<int>(
            columnTitle: "purchased", value: e.purchasedTicketCount),
        ExpandableCell<int>(columnTitle: "ticket", value: e.ticket),
      ]);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Ranking"),
      ),
      drawer: const DrawerMenu(),
      body: SafeArea(
        child: !_isLoading
            ? LayoutBuilder(builder: (context, constraints) {
                int visibleCount = 3;
                if (constraints.maxWidth < 600) {
                  visibleCount = 3;
                } else if (constraints.maxWidth < 800) {
                  visibleCount = 4;
                } else if (constraints.maxWidth < 1000) {
                  visibleCount = 5;
                } else {
                  visibleCount = 6;
                }

                return ExpandableTheme(
                  data: ExpandableThemeData(
                    context,
                    contentPadding: const EdgeInsets.all(20),
                    expandedBorderColor: Colors.transparent,
                    paginationSize: 48,
                    headerHeight: 56,
                    headerColor: Colors.amber[400],
                    headerBorder: const BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                    evenRowColor: const Color(0xFFFFFFFF),
                    oddRowColor: Colors.amber[200],
                    rowBorder: const BorderSide(
                      color: Colors.black,
                      width: 0.3,
                    ),
                    rowColor: Colors.green,
                    headerTextMaxLines: 4,
                    headerSortIconColor: const Color(0xFF6c59cf),
                    paginationSelectedFillColor: const Color(0xFF6c59cf),
                    paginationSelectedTextColor: Colors.white,
                  ),
                  child: ExpandableDataTable(
                    headers: headers,
                    rows: rows,
                    multipleExpansion: false,
                    isEditable: false,
                    onRowChanged: (newRow) {
                      print(newRow.cells[01].value);
                    },
                    onPageChanged: (page) {
                      print(page);
                    },
                    renderEditDialog: (row, onSuccess) =>
                        _buildEditDialog(row, onSuccess),
                    visibleColumnCount: visibleCount,
                  ),
                );
              })
            : const Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetch,
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ),
    );
  }

  Widget _buildEditDialog(
      ExpandableRow row, Function(ExpandableRow) onSuccess) {
    return AlertDialog(
      title: SizedBox(
        height: 300,
        child: TextButton(
          child: const Text("Change name"),
          onPressed: () {
            row.cells[1].value = "x3";
            onSuccess(row);
          },
        ),
      ),
    );
  }
}
