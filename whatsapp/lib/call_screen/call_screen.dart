import 'package:flutter/material.dart';
import 'package:whatsapp/models/call_model.dart';

class Call_screen extends StatelessWidget {
   Call_screen({super.key});

  List<CallDetails> calls = [
    CallDetails(
      image: "https://images.indianexpress.com/2022/02/blackpink1200.jpg",
        name: "Rose",
        isIncoming: true,
        updateAt: "December 2,2:00 pm",
        isVoice: false,
        isGroup: false
    ),
    CallDetails(
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaBbBzSHfpyd_LTCAk-dj_eWY_s5kfmb2tmQ&usqp=CAU",
        name: "Jennie",
        isIncoming: false,
        updateAt: "November 30,9:00 am",
        isVoice: false,
        isGroup: false
    ),
    CallDetails(
      image: "",
        name: "abc",
        isIncoming: true,
        updateAt: "November 27,3:00 pm",
        isVoice: true,
        isGroup: true
    ),
    CallDetails(
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtWp3s1bZPf8pw2deIU-h2kb7byE700DEhXg&usqp=CAU",
        name: "HM",
        isIncoming: null,
        updateAt: "November 20,6:00 pm",
        isVoice: false,
        isGroup: false
    ),
    CallDetails(
      image: "https://www.pinkvilla.com/imageresize/when-blackpinks-jisoo-shared-advice-for-young-girls.jpg?width=752&t=pvorg",
        name: "Jisoo",
        isIncoming: true,
        updateAt: "November 19 ,4:00 pm",
        isVoice: false,
        isGroup: false
    ),
    

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: ListView.builder(
        itemCount: calls.length,
        itemBuilder: (context, index) {
        return ListTile( 
          // onTap:() => Navigator.push(context,MaterialPageRoute(builder:(context) => CallDetails(data: calls[index]),)) ,
          leading: CircleAvatar(
            backgroundImage:
            (calls[index].image!="")?
            NetworkImage(calls[index].image!):

            NetworkImage( (!calls[index].isGroup!)?"https://thumbs.dreamstime.com/b/default-avatar-profile-icon-social-media-user-vector-default-avatar-profile-icon-social-media-user-vector-portrait-176194876.jpg":
            "https://cdn6.aptoide.com/imgs/1/2/2/1221bc0bdd2354b42b293317ff2adbcf_icon.png"
          ),
          ),
          title: Text(calls[index].name!),
          subtitle: Row(
            children: [
              Icon(Icons.call_received_sharp),
              Text(calls[index].updateAt!),
            ],
          ),
          trailing: Icon(Icons.call),
          );
      },)
    
    );
  }
}