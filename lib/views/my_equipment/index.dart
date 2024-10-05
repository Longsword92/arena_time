import 'package:arena_time/drawer_menu.dart';
import 'package:arena_time/models/avatar.dart';
import 'package:flutter/material.dart';

class MyEquipment extends StatefulWidget {
  const MyEquipment({super.key});

  @override
  State<MyEquipment> createState() => _MyEquipmentState();
}

const pathImage = "https://9cnice.com/uploads/9c/img/_id.png";

class _MyEquipmentState extends State<MyEquipment> {
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('My Personal Journal');

  @override
  Widget build(BuildContext context) {
    if (customIcon.icon == Icons.search) {
      customIcon = const Icon(Icons.cancel);
      customSearchBar = const ListTile(
        leading: Icon(
          Icons.search,
          color: Colors.white,
          size: 28,
        ),
        title: TextField(
          decoration: InputDecoration(
            hintText: '...',
            hintStyle: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontStyle: FontStyle.italic,
            ),
            border: InputBorder.none,
          ),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Equipment'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (customIcon.icon == Icons.search) {
                  // Perform set of instructions.
                } else {
                  customIcon = const Icon(Icons.search);
                  customSearchBar = const Text('...');
                }
              });
            },
            icon: customIcon,
          ),
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
      body: Container(
        child: loadEquipments([], []),
      ),
    );
  }

  GridView loadEquipments(
      List<Equipments> equipments, List<Costumes> costumes) {
    equipments.sort((a, b) => a.equipped ?? false ? -1 : 1);
    return GridView.count(
      crossAxisCount: 5,
      childAspectRatio: 3 / 4,
      children: loadCostumes(costumes) +
          equipments.map(
            (e) {
              return Card(
                color: e.equipped ?? false ? Colors.blue : null,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Image.network(
                              pathImage.replaceFirst('_id', '${e.id}'),
                              errorBuilder: (context, error, stackTrace) =>
                                  Image.network(pathImage.replaceFirst(
                                      '_id', '10140000')),
                            ),
                            Text('+${e.level}'),
                            Text('${e.stat}'),
                            Text('${e.statsMap}'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ).toList(),
    );
  }

  List<Card> loadCostumes(List<Costumes> costumes) {
    costumes.sort((a, b) => a.equipped ?? false ? -1 : 1);
    return costumes
        .map(
          (e) => Card(
            color: e.equipped ?? false ? Colors.blue : null,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Image.network(
                          pathImage.replaceFirst('_id', '${e.id}'),
                          errorBuilder: (context, error, stackTrace) =>
                              Image.network(
                                  pathImage.replaceFirst('_id', '10140000')),
                        ),
                      ],
                    ),
                  ),
                  if (!e.equipped!)
                    ElevatedButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith(
                          (states) {
                            return states.contains(MaterialState.pressed)
                                ? Colors.red
                                : null;
                          },
                        ),
                        backgroundColor: MaterialStateProperty.resolveWith(
                          (states) {
                            return Colors.orange;
                          },
                        ),
                      ),
                      onPressed: () {
                        // old equiped
                        var oldEquippeds = costumes.where((element) =>
                            element.itemSubType == e.itemSubType &&
                            element.equipped!);
                        setState(() {
                          for (var element in oldEquippeds) {
                            element.equipped = false;
                          }
                          e.equipped = true;
                        });
                      },
                      child: const Text('Equip'),
                    ),
                ],
              ),
            ),
          ),
        )
        .toList();
  }
}
