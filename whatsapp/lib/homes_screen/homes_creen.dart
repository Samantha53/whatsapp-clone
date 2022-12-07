
import 'package:flutter/material.dart';
import 'package:whatsapp/Camera_screen/Camera_page.dart';
import 'package:whatsapp/call_screen/call_screen.dart';
import 'package:whatsapp/chat_screen/chat_screen.dart';
import 'package:whatsapp/status_screen/status_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('whatsapp'),
          actions: [
            Icon(Icons.search),
            PopupMenuButton(itemBuilder: (context) {
              return [
                PopupMenuItem(child: Text('New group')),
                PopupMenuItem(child: Text('New broadcast')),
                PopupMenuItem(child: Text('Linked devices')),
                PopupMenuItem(child: Text('Starred messages')),
                PopupMenuItem(child: Text('Payments')),
                PopupMenuItem(child: Text('Settings'))
              ];
            },)
          ],
          bottom: TabBar(
            tabs: [
              Icon(Icons.camera_alt),
              Text('CHATS'),
              Text('STATUS'),
              Text('CALLS')
          ]),
        ),
        body: TabBarView(children: [
          Camera_screen(),
          ChatScreen(),

          Status_screen(),

          Call_screen(),

        ]),
      ),
    );
  }
}