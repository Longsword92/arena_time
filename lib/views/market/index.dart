import 'package:arena_time/apimarket.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import '../../drawer_menu.dart';
import '../../models/item_product.dart';
import '../../models/stat_model.dart';

part 'item_product_widget.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({super.key, this.isOdin = true});

  final bool isOdin;

  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage>
    with SingleTickerProviderStateMixin {
  List<ItemProduct> _products = [];
  bool _isLoading = true;
  bool _cpDesc = true;
  late TabController _tabController;
  String _selectedOrderOption = "ATK";
  bool _isAsc = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      fetchProducts(tabs[_tabController.index]['itemType'] as int);
    });
    // get init
    fetchProducts(tabs[_tabController.index]['itemType'] as int); //weapon
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Market'),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: "Back",
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      drawer: const DrawerMenu(),
      body: Padding(
          padding: const EdgeInsets.all(5),
          child: Stack(
            children: [
              Column(
                children: [
                  TabBar(
                      controller: _tabController,
                      tabs: tabs
                          .map(
                            (e) => Tab(
                              icon: Image(
                                width: 30,
                                image: AssetImage(
                                    "assets/images/Item/${e['imageId']}.png"),
                              ),
                            ),
                          )
                          .toList()),
                  Expanded(
                    child: GridView.builder(
                      itemCount: _products.length,
                      itemBuilder: (BuildContext ctx, index) {
                        if (index > _products.length) return Container();
                        return ItemProductWidget(product: _products[index]);
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.4),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 5,
                right: 0,
                child: Row(children: [
                  DropdownButton<String>(
                    value: _selectedOrderOption,
                    icon: const Icon(Icons.select_all_rounded),
                    elevation: 16,
                    style: const TextStyle(color: Colors.redAccent),
                    underline: Container(
                      height: 2,
                      color: Colors.redAccent,
                    ),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        _selectedOrderOption = value!;
                        reSort(isOption: true);
                      });
                    },
                    items: orderOptions
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isAsc = !_isAsc;
                        reSort(isOption: true);
                      });
                    },
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Icon(
                              _isAsc
                                  ? Icons.arrow_upward
                                  : Icons.arrow_downward,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _cpDesc = !_cpDesc;
                        reSort();
                      });
                    },
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(_cpDesc ? "CP" : "Block"),
                            const Icon(
                              Icons.arrow_downward,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              if (_isLoading) const Center(child: CircularProgressIndicator()),
            ],
          )),
    );
  }

  reSort({bool isOption = false}) {
    setState(() {
      if (!isOption) {
        _products.sort((a, b) => _cpDesc
            ? b.combatPoint! - a.combatPoint!
            : b.registeredBlockIndex! - a.registeredBlockIndex!);
      } else {
        _products.sort((a, b) {
          StatModel? statModel1 = a.statModels?.firstWhereOrNull(
              (element) => element.typeDisplay == _selectedOrderOption && (element.additional ?? false));
          StatModel? statModel2 = b.statModels?.firstWhereOrNull(
              (element) => element.typeDisplay == _selectedOrderOption && (element.additional ?? false));
          return _isAsc
              ? (statModel1?.value ?? 0) - (statModel2?.value ?? 0)
              : (statModel2?.value ?? 0) - (statModel1?.value ?? 0);
        });
      }
    });
  }

  void fetchProducts(int itemType) {
    setState(() {
      _isLoading = true;
    });
    String order = itemType == 16 ? 'unit_price' : 'cp_desc';
    Market.products(itemType, order: order, isOdin: widget.isOdin)
        .then((products) {
      setState(() {
        _products = products;
        reSort();
        _isLoading = false;
      });
    });
  }
}

var tabs = [
  {
    'imageId': '10153000',
    'itemType': 6,
  },
  {
    'imageId': '10254001',
    'itemType': 7,
  },
  {
    'imageId': '10353001',
    'itemType': 8,
  },
  {
    'imageId': '10453001',
    'itemType': 9,
  },
  {
    'imageId': '10551000',
    'itemType': 10,
  },
  {
    'imageId': '500000',
    'itemType': 16,
  }
];

var orderTypes = [
  'cp',
  'cp_desc',
  'price',
  'price_desc',
  'grade',
  'grade_desc',
  'crystal',
  'crystal_desc',
  'crystal_per_price',
  'crystal_per_price_desc',
  'level',
  'level_desc',
  'opt_count',
  'opt_count_desc',
  'unit_price',
  'unit_price_desc',
];

var orderOptions = [
  "ATK",
  "SPD",
  "DEF",
  "HP",
  "HIT",
];
