import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp/models/chat_model.dart';
import 'package:whatsapp/models/message_model.dart';

import 'chat_bubble.dart';

class ChatDetail extends StatefulWidget {
  ChatDetail({super.key, required this.data});

  UserDetails data;

  @override
  State<ChatDetail> createState() => _ChatDetailState();
}

class _ChatDetailState extends State<ChatDetail> {
  TextEditingController messageController = TextEditingController(); 
 bool ShowSend = false;
 bool showEmoji = true;
 
   List<Messages> messages = [
    Messages(isSend: true,isReaded: true,message: "Hi",sendAt:"2 pm"),
    Messages(isSend: false,isReaded: true,message: "Hlo",sendAt:"5 am"),
    Messages(isSend: true,isReaded: true,message: "Hey",sendAt:"8 am"),
    Messages(isSend: false,isReaded: true,message: "Hiii",sendAt:"2 pm"),
    Messages(isSend: false,isReaded: false,message: "Heyyy",sendAt:"4 pm"),
    Messages(isSend: true,isReaded: false,message: "helloo",sendAt:"6 pm"),
   ];
   ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 75,
        titleSpacing: 5,
        leading: Row(
          children: [
            InkWell(
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 3),
                child: Icon(Icons.arrow_back),
              ),
              onTap: () => Navigator.pop(context),
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(widget.data.image!),
            ),
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.data.name!),
            Text(
              'online',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        actions: [
          Icon(Icons.video_call),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.call),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text((widget.data.isGroup!) ? "Group info" : 'View contact'),
                ),
                PopupMenuItem(
                  child: Text(
                      (widget.data.isGroup!) ? "Group media" : 'Media,links and docs'),
                ),
                PopupMenuItem(
                  child: Text('Search'),
                ),
                PopupMenuItem(
                  child: Text('Mute notifications'),
                ),
                PopupMenuItem(
                  child: Text('Disappearing messages'),
                ),
                PopupMenuItem(
                  child: Text('Wallpaper'),
                ),
                PopupMenuItem(
                  child: Text('More'),
                ),
              ];
            },
          )
        ],
      ),
      body: Container(
        child: Stack(children: [
          Image.asset(
            "assets/images/whatsapp_bg.jfif",
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          ListView.builder(
            controller: _scrollController,
            itemCount: messages.length,
            itemBuilder: (context, index) {
              return ChatBubble(
                message: messages[index],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 60,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextField(
                          controller:messageController ,
                          onTap: (){
                            setState(() {
                              showEmoji = true;
                            },);
                          },
                          onChanged: (value) {
                          if(value.length > 0){
                            setState(() {
                              ShowSend = true;
                            });
                          }else{
                            setState(() {
                              ShowSend= false;
                            });
                          }
                          },
                          decoration: InputDecoration(
                              hintText: "Message",
                              prefixIcon: IconButton(onPressed: () {
                                if(showEmoji){
                                  FocusScope.of(context).unfocus();
                                }
                                setState(() {
                                  showEmoji = !showEmoji;
                                });
                              }, icon: Icon((showEmoji)?Icons.emoji_emotions_outlined: Icons.keyboard),) ,
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (builder) => Menu(context),
                                        );
                                      },
                                      icon: Icon(Icons.attach_file)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(Icons.camera_alt),
                                  SizedBox(
                                    width: 20,
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        final time = DateFormat("hh:mm: a").format(DateTime.now());
                        print(time);
                        print(messageController.text);
                        setState(() {
                          messages.add(Messages(
                            isReaded: false,
                            isSend: true,
                            message: messageController.text,
                            sendAt: time
                          ),);
                        });
                        messageController.clear();
                      },
                      child: Icon((ShowSend)?Icons.send: Icons.mic),
                    ),
                  ],
                ),
                Offstage(offstage:showEmoji,
                child:SizedBox(
                  height: 250,
                  child: EmojiPicker(
                    textEditingController:messageController ,
                  ),),
                  ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Container Menu(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconWidget(
                  text: "Document",
                  icon: Icon(Icons.insert_drive_file),
                  color: Colors.purple,
                ),
                IconWidget(
                  text: "Camera",
                  color: Colors.red,
                  icon: Icon(
                    Icons.camera_alt,
                  ),
                ),
                IconWidget(
                  text: "Gallery",
                  icon: Icon(Icons.insert_photo),
                  color: Colors.deepPurple,
                ),
              ],
            ),
            SizedBox(
              width: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: IconWidget(
                    text: "Audio",
                    icon: Icon(Icons.headphones),
                    color: Colors.orange,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: IconWidget(
                    text: "Location",
                    icon: Icon(Icons.location_pin),
                    color: Colors.green,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: IconWidget(
                    text: "Contact",
                    icon: Icon(Icons.contact_phone),
                    color: Colors.blue,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Column IconWidget({String? text, Icon? icon, Color? color}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          child: icon,
          backgroundColor: color!,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          text!,
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}

