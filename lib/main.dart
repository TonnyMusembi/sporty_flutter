import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart'as http;
import 'package:sport/models/matches.dart';

// import 'package:sport/widgets/LaLiga.dart';
// import 'package:sport/widgets/UEFA.dart';
// import 'package:sport/widgets/PremierLeague.dart';
//import 'package:json_annotation/json_annotation.dart';


import 'dart:async';

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
  Future <Matches> predictions() async {
    final response = await http
        .post(Uri.parse('https://www.suretips.co.ke/bettips_api//tips/all/v2'));
      print(response.body);
    Map<String, dynamic> jsonresponce;
    //check ok response & send default on failure
    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
     return Matches.fromJson(jsonDecode(response.body));
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
            title: const Text('Tips football'),
            bottom: const TabBar(
              labelColor: Colors.black,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelStyle: TextStyle(fontStyle: FontStyle.italic),
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.all(10),
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
          )
          ,
          body: FutureBuilder(
              future: predictions(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                // if (snapshot.hasError) {
                //   return const Center(
                //     child: Text('snapshot.error'),
                //   );
                // }
                if (snapshot.hasData)
                  //List<Matches> matches = snapshot.data;
                {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    padding: const EdgeInsets.all(8),
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          Container(
                            height: 250,
                            alignment: Alignment.centerLeft,
                            child: Card(
                              child: Text(
                                      snapshot.data[index]['competition_name']),
                            ),
                          ),
                          const SizedBox(width: 20,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  snapshot.data[index]["home_team"],
                                  style: const TextStyle(color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  snapshot.data[index]["away_team"],
                                  style: const TextStyle(color: Color(0xff868597)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 100,
                                  child: Text(
                                    snapshot.data[index]["odds"],
                                    style: const TextStyle(color: Color(0xff868597)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),

          // body: const Center(
          // //   //child: _widgetOptions.elementAt(_selectedIndex),
          // // ),
          // bottomNavigationBar: BottomNavigationBar(
          //   items: const <BottomNavigationBarItem>[
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.home),
          //       label: 'Yesterday',
          //       //backgroundColor: Colors.blue,
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.calendar_today),
          //       label: 'Today',
          //       //backgroundColor: Colors.green,
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.money),
          //       label: 'Tomorrow',
          //       backgroundColor: Colors.black,
          //     ),
          //   ],
          //   // currentIndex: _selectedIndex,
          //   selectedItemColor: Colors.amber[800],
          //   //onTap: _onItemTapped,
          // ),
        ));
  }
}

