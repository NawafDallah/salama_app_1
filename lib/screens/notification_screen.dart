import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salama_app/constant.dart';
import 'components/new_candidat.dart';
import 'components/old_candidate.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with TickerProviderStateMixin {
  TabController? mycontroller;
  int selected = 0;

  @override
  void initState() {
    mycontroller = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    mycontroller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 211, 175, 65),
        foregroundColor: backgroundColorDark,
        centerTitle: true,
        leading: const SizedBox(),
        title: const Text(
          "Notification",
          style: TextStyle(fontFamily: 'Poppins'),
        ),
        bottom: TabBar(
            indicatorColor: backgroundColorDark,
            labelColor: backgroundColorDark,
            controller: mycontroller,
            isScrollable: true,
            tabs: const [
              Tab(
                text: "new candidate",
              ),
              Tab(
                text: "old candidate",
              ),
            ]),
      ),
      body: TabBarView(
        controller: mycontroller,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          NewCandidate(),
          OldCandidate(),
        ],
      ),
    );
  }
}




