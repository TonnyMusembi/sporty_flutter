import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart'as http;

import 'package:sport/widgets/LaLiga.dart';
import 'package:sport/widgets/UEFA.dart';
import 'package:sport/widgets/PremierLeague.dart';


import 'dart:convert' as convert;

import 'dart:ui';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
       debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  Future predictions () async {
    final response = await http
        .get(Uri.parse('http://35.240.46.135:8888/v1/endpoint?predictions=1'));
    Map<String, dynamic> json;
    // check ok response & send default on failure
    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      //return predictions.fromJson(json.decode(response.body));
    }
    else {
      // If the server did not return a 200 OK response,
      //then throw an exception.
      throw Exception('Failed to load predictions');
    }
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('Sporty Tips'),
          bottom: const TabBar(
            labelColor: Colors.black,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle:  TextStyle(fontStyle: FontStyle.italic),
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding:  EdgeInsets.all(10),
            physics: BouncingScrollPhysics(),
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.date_range),
                text: "Monday",
              ),
              Tab(
               icon: Icon(Icons.date_range),
                //
                 text: ('Tuesday'),),
               Tab(
                icon: Icon(Icons.date_range),
                 text: ('Wednesday'),),
               Tab(
               icon: Icon(Icons.date_range),
               text: ('Thursday'),),
              Tab(
                icon: Icon(Icons.date_range),
                text: ('Friday'),),
            Tab(
               icon: Icon(Icons.date_range),
                text: ('Sartuday'),),
               Tab(
                icon: Icon(Icons.date_range),
                text: ('Sunday'),),
            ],
          ),
        ),
        body:SingleChildScrollView(
          child: SizedBox(
            height: 2000,
            child: TabBarView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 13.0, right: 13.0, bottom: 13.0, top: 25),
                  child: Column(
                    children: [
                      PremierLeague(),
                      LaLiga(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 13.0, right: 13.0, bottom: 13.0, top: 25),
                  child: Column(
                    children: [
                      PremierLeague(),
                      LaLiga(),],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 13.0, right: 13.0, bottom: 13.0, top: 25),
                  child: Column(
                    children: [
                      PremierLeague(),
                      LaLiga(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 13.0, right: 13.0, bottom: 13.0, top: 25),
                  child: Column(
                    children: [
                      PremierLeague(),
                      LaLiga(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 13.0, right: 13.0, bottom: 13.0, top: 25),
                  child: Column(
                    children: [
                      PremierLeague(),
                      LaLiga(),
                      UEFA(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 13.0, right: 13.0, bottom: 13.0, top: 25),
                  child: Column(
                    children: [
                      PremierLeague(),
                      LaLiga(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 13.0, right: 13.0, bottom: 13.0, top: 25),
                  child: Column(
                    children: [
                      PremierLeague(),
                      LaLiga(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // body: const Center(
         //child: _widgetOptions.elementAt(_selectedIndex),
        // ),
    bottomNavigationBar: BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Today',
    //backgroundColor: Colors.blue,
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.calendar_today),
    label:'Tomorrow',
    //backgroundColor: Colors.green,
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.money),
    label: 'Yesterday',
      //backgroundColor: Colors.purple,
    ),

    ],
     //currentIndex: _selectedIndex,
    selectedItemColor: Colors.amber[800],
     //onTap: _onItemTapped,
    ),
    ));
  }
  }















