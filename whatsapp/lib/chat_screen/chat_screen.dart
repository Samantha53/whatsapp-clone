import 'package:flutter/material.dart';
import 'package:whatsapp/chat_screen/chat_detailscreen.dart';
import 'package:whatsapp/models/chat_model.dart';

class ChatScreen extends StatelessWidget {
 ChatScreen({super.key});

  List<UserDetails> users = [
    UserDetails(
      image: "",
      name: "Lisa",
      message: "hi",
      updateAt: "8.00 am",
      isGroup: true,

    ),

    UserDetails(
      image: "https://therealchamps.com/wp-content/uploads/getty-images/2017/07/1243838725.jpeg",
      name: "Hazard",
      message: "hlo",
      updateAt: "9.00 am",
      isGroup: true,

    ),

    UserDetails(
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjed2ZUBzcxu1gNgXJcYwoyKF7x8R2vqA_qw&usqp=CAU",
      name: "Vernon",
      message: "hello",
      updateAt: "7.00 am",
      isGroup: false,

    ),

    UserDetails(
      image: "https://www.sheknows.com/wp-content/uploads/2022/08/lily-rose-depp.jpg",
      name: "Lily",
      message: "hii",
      updateAt: "5.00 am",
      isGroup: true,

    ),

    UserDetails(
      image: "",
      name: "Zendaya",
      message: "hllo",
      updateAt: "3.00 am",
      isGroup: false,

    ),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
        return ListTile( 
          onTap:() => Navigator.push(context,MaterialPageRoute(builder:(context) => ChatDetail(data: users[index]),)) ,
          leading: CircleAvatar(
            backgroundImage:
            (users[index].image!="")?
            NetworkImage(users[index].image!):

            NetworkImage( (!users[index].isGroup!)?"https://thumbs.dreamstime.com/b/default-avatar-profile-icon-social-media-user-vector-default-avatar-profile-icon-social-media-user-vector-portrait-176194876.jpg":
            "https://cdn6.aptoide.com/imgs/1/2/2/1221bc0bdd2354b42b293317ff2adbcf_icon.png"
          ),
          ),
          title: Text(users[index].name!),
          subtitle: Text(users[index].message!),
          trailing: Text(users[index].updateAt!)
          );
      },)
    );
  }
}