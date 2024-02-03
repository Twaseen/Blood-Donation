import 'package:flutter/material.dart';
//import 'chat_screen.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 30),
                  title: Text(
                    'Dashboard',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: Colors.white),
                  ),
                  trailing: CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                ),
              ),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  itemDashboard(
                    'Search',
                    Icons.search,
                    Colors.deepOrange,
                  ),
                  itemDashboard(
                    'Post',
                    Icons.post_add,
                    Colors.deepOrange,
                  ),
                  itemDashboard(
                    'Donor',
                    Icons.people,
                    Colors.deepOrange,
                  ),
                  itemDashboard(
                    'Foundation',
                    Icons.account_balance,
                    Colors.deepOrange,
                  ),
                  itemDashboard(
                    'Bank',
                    Icons.business,
                    Colors.deepOrange,
                  ),
                  itemDashboard(
                    'Chat',
                    Icons.chat,
                    Colors.deepOrange,
                    // onTap: () {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => ChatScreen()),
                    //   );
                    // },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget itemDashboard(
      String title,
      IconData iconData,
      Color background, {
        VoidCallback? onTap,
      }) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 5),
                color: Theme.of(context).primaryColor.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 5,
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: background,
                  shape: BoxShape.circle,
                ),
                child: Icon(iconData, color: Colors.white),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.subtitle1,
              )
            ],
          ),
        ),
      );
}