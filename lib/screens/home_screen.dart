import 'package:flutter/material.dart';
import 'package:flutternews/screens/general_screen.dart';
import 'package:flutternews/screens/headlines_screen.dart';
import 'package:flutternews/screens/health_screen.dart';
import 'package:flutternews/screens/science_screen.dart';
import 'package:flutternews/screens/sports_screen.dart';
import 'package:flutternews/screens/technology_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text(
              "News App",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            bottom: TabBar(
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: const Color.fromARGB(255, 226, 223, 223)),
              isScrollable: true,
              tabs: const[
                Tab(text: "General"),
                Tab(text: "Health"),
                Tab(text: "Technology"),
                Tab(text: "Science"),
                Tab(text: "Sports"),
                Tab(text: "Top headlines"),
              ],
            ),
          ),
        body: const TabBarView(
            children: [
              GeneralScreen(),
              HealthScreen(),
              TechnologyScreen(),
              ScienceScreen(),
              SportsScreen(),
              TopHeadlines()
            ]
        ),
      ),
    );
  }
}
