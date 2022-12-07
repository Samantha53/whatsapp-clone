import 'package:flutter/material.dart';
import 'package:whatsapp/models/status_model.dart';

class Status_screen extends StatelessWidget {
   Status_screen({super.key});

  List<StatusDetails> status = [
    StatusDetails(
       image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUt-GGFYBSn4_XMf5hG2yCwsHRAPUSw6ugGw&usqp=CAU",
        name: "Arya",
        updateAt: "30 minutes ago",
        isStatus: true,
    ),
     StatusDetails(
       image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQduayRG8mJ85myfKSekDLVHN0ssTnpPAXFg&usqp=CAU",
        name: "aaa",
        updateAt: "Today,9:50 am",
        isStatus: true,
    ),
     StatusDetails(
       image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRHyK4sJ-9lsYzszahONDb6vL5gnliy1kN9Q&usqp=CAU",
        name: "Arun",
        updateAt: "Today,9:00 am",
        isStatus: true,
    ),
     StatusDetails(
       image: "https://images.unsplash.com/photo-1605895370326-e96b9d52e3f5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Zmxvd2VyJTIwZ2FyZGVufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
        name: "Megha",
        updateAt: "Today,8:40 am",
        isStatus: true,
    ),
     StatusDetails(
       image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEaVStBqq5sOfpLIBHSPSls2acNwDvD35Axw&usqp=CAU",
        name: "Sam",
        updateAt: "Yesterday,7:00 pm",
        isStatus: true,
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children:<Widget> [
            ListTile(
              leading: CircleAvatar(backgroundColor: Colors.teal,radius: 30),
              title: Text("My Status Page"),
              subtitle: Text("Tap to add status update"),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: status.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(backgroundImage:  NetworkImage(status[index].image!)),
              title: Text(status[index].name!),
              subtitle: Text(status[index].updateAt!),
                  
            );
              },
            )
          ],
        ),
      ) ,
    );
  }
}