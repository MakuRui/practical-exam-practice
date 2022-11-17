import 'package:flutter/material.dart';
import 'package:student_attendance/tabs/attendance_tab.dart';
import 'package:student_attendance/tabs/profile_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin{

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const Text('Student List',
          style: TextStyle(fontSize: 25),
        ),
        bottom: TabBar(
          controller: tabController,
            tabs: const [
              Tab(
                icon: Icon(Icons.account_circle),
                text: 'Student Profile',
              ),
              Tab(
                icon: Icon(Icons.check),
                text: 'Student Attendance',
              ),
            ]
        ),
      ),
      body: TabBarView(
        controller: tabController,
          children: const [
            ProfileTab(),
            AttendanceTab(),
          ]
      ),
    );
  }
}

