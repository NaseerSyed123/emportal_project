import 'package:flutter/material.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.grey[600],
          ),
        ),
        centerTitle: true,
        title: TextField(

          cursorColor: Colors.grey,
          textAlign: TextAlign.center,
          // The style of the input field
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 15),
            hintText: 'Notification',

            border: InputBorder.none,
            suffixIcon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            // The style of the hint text
            hintStyle: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          // The controller of the input box
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 3),
        child: Expanded(
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
            return Padding(

              padding: const EdgeInsets.only(bottom: 5),
              child: Column(
                children: [
                  ListTile(

                    leading: Container(
                      color: Color(0xfffff0af),
                      padding: EdgeInsets.all(5),
                      child: Icon(Icons.mail, size: 30,),
                    ),
                    title: Text('Admin sent you a message'),
                    subtitle: Text('15 minutes ago'),
                    trailing: Icon(
                      Icons.cancel_outlined
                    ),
                  ),
                  Divider()
                ],
              )

            );
          }),
        ),
      ),
    );
  }
}
