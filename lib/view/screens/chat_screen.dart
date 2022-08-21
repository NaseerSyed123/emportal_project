import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.grey[600],
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  width: 35,
                  height: 35,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/person_img.png'),
                ),
              ),
            ),
          )
        ],
        title: Text(
          "Admin",
          style: TextStyle(color: Colors.grey[600]),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return index % 2 == 0
                        ? Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 70, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: 200,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(5),
                                            bottomRight: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                            topLeft: Radius.circular(20),
                                          )),
                                      child: Text(
                                        'Helo Dr! Lorem Ipsum is simply dummy text of the printing and types',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Comfortaa',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '9:30 am',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Comfortaa',
                                  ),
                                )
                              ],
                            ))
                        : Padding(
                            padding: const EdgeInsets.fromLTRB(100, 10, 10, 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Color(0xfffffcef),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(5),
                                        topRight: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                      )),
                                  child: Text(
                                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Comfortaa',
                                    ),
                                  ),
                                ),
                                Text(
                                  '9 AM',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Comfortaa',
                                  ),
                                )
                              ],
                            ),
                          );
                  }),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: Color(0xffFDC500),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [

                    Flexible(
                        flex: 2,
                        child: Column(
                          children: [
                            Container(
                              height: 40,
                              child: TextField(
                                style: TextStyle(color: Colors.black87),
                                cursorColor: Colors.black87,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 7),
                                  hintText: 'Message..',
                                  hintStyle: TextStyle(color: Colors.black87),
                                  labelStyle: TextStyle(color: Colors.black87),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        )),
                   Image(image: AssetImage('assets/images/attach_icon.png')),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Image(image: AssetImage('assets/images/send_icon.png')))

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
