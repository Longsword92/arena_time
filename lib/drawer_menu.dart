import 'package:arena_time/main.dart';
import 'package:arena_time/views/market/index.dart';
import 'package:arena_time/views/my_equipment/index.dart';
import 'package:flutter/material.dart';

import 'views/rank/rank_page.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            // decoration: BoxDecoration(
            //   color: Colors.blue,
            // ),
            child: Text('Menu'),
          ),
          ListTile(
            title: const Text('Home'),
            leading: const Icon(Icons.home),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Rank'),
            leading: const Icon(Icons.leaderboard),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const RankPage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Market Odin'),
            leading: const Icon(Icons.shop),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MarketPage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Market Heimdall'),
            leading: const Icon(Icons.shop),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MarketPage(isOdin: false,),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('View Equipment'),
            leading: const Icon(Icons.shop),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MyEquipment(),
                ),
              );
            },
          ),
          
        ],
      ),
    );
  }
}
