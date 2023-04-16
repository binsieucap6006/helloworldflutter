import 'package:flutter/material.dart';
import 'package:helloworldflutter/main.dart';
import 'package:helloworldflutter/screens/HomePage.dart';

class MenuItem extends StatefulWidget {
  const MenuItem({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Home'),
    const Tab(text: 'Trending'),
    const Tab(text: 'Bookmark'),
  ];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          title: const Text(MyApp.title),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            PopupMenuButton(
              icon: const Icon(Icons.menu),
              itemBuilder: (context) => [
                // const PopupMenuItem(
                //   child: Text("Log in"),
                // ),
                // const PopupMenuItem(
                //   child: Text("Register"),
                // ),
                const PopupMenuItem(
                  child: ListTile(
                    leading: Icon(
                      Icons.login,
                    ),
                    title: Text("Log in"),
                  ),
                ),

                const PopupMenuItem(
                  child: ListTile(
                    leading: Icon(
                      Icons.app_registration,
                    ),
                    title: Text("Register"),
                  ),
                ),
              ],
            )
          ],
          //backgroundColor: Colors.purple,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.red],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
          ),
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            indicatorColor: Colors.white,
            indicatorWeight: 5,
            tabs: const [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.star), text: 'Trending'),
              Tab(icon: Icon(Icons.book), text: 'Bookmark'),
            ],
          ),

          elevation: 20,
          titleSpacing: 20,
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            const HomePage(),
            buildPage('Trending Page'),
            buildPage('Bookmark Page'),
          ],
        ),
      ),
    );
  }

  Widget buildPage(String text) => Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 28),
        ),
      );
}
