import 'package:emportal_project/models/messageModel.dart';
import 'package:emportal_project/view/screens/chat_screen.dart';
import 'package:flutter/material.dart';


class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Inbox',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: ListView.builder(
              itemCount: dummyMessageList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatScreen()));
                      },
                      child: messageContainer(
                          nameText: dummyMessageList[index].nameTxt,
                          messageText: dummyMessageList[index].msgTxt,
                          imagetype: dummyMessageList[index].imgType,
                          timeText: dummyMessageList[index].timeTxt,
                          countingText: dummyMessageList[index].countTxt,
                           color: dummyMessageList[index].col
                      )
                  ),
                );
              }),
        ));
  }

  Widget messageContainer(
      {required String nameText,
      required String messageText,
      required String imagetype,
      required String timeText,
      required String countingText,
       required Color color
      }) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(

             backgroundColor: color,
            backgroundImage: AssetImage(imagetype),
          ),
          title: Text(
            nameText,
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          subtitle: Text(messageText),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(timeText),
              Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffFDC500),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  child: Text(countingText))
            ],
          ),
        ),
        Divider()
      ],
    );
  }
}
