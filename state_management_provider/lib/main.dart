import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/home_page_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider<HomePageProvider>(
        create: (context) {
          return HomePageProvider();
        },
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
      ),
      body: Consumer<HomePageProvider>(
        builder: (context, homePageProvider, child) {
          return IndexedStack(
            index: homePageProvider.currentIndex,
            children: [
              Center(
                child: Image.network(
                    "https://images.pexels.com/photos/1125136/pexels-photo-1125136.jpeg"),
              ),
              Center(
                child: Image.network(
                    "https://images.pexels.com/photos/4820815/pexels-photo-4820815.jpeg"),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (context, homePageProvider, child) {
        return BottomNavigationBar(
          currentIndex: homePageProvider.currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text("Factory"),
            ),
          ],
          onTap: (value) {
            homePageProvider.currentIndex = value;
          },
        );
      },
    );
  }
}
