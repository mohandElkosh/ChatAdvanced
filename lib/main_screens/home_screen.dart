import 'package:chat_pro/main_screens/chat_list_screen.dart';
import 'package:chat_pro/main_screens/group_screen.dart';
import 'package:chat_pro/main_screens/people_screen.dart';
import 'package:chat_pro/utilities/assets_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final PageController pageController = PageController(initialPage: 0);
  final List<Widget> pages = [
    const ChatListScreen(),
    const GroupScreen(),
    const PeopleScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen'), actions: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 20,
            backgroundImage: AssetImage(AssetsManager.userImage),
          ),
        ),
      ]),
      body: PageView(
        controller: pageController,
        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        children: [
          pages[currentIndex],
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_2), label: "Chats"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.group), label: "Group"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.globe), label: "People"),
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          pageController.animateToPage(index,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut);
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
