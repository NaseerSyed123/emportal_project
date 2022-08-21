import 'package:flutter/material.dart';


import '../../models/user.dart';
import 'user_dialog.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  TextEditingController _textController = TextEditingController();
  List<User> userlist = [];
  String text = "";
  String phoneText = '';
  int a = 0;

  @override
  Widget build(BuildContext context) {
    void addUserdata(User user) {
      setState(() {
        userlist.add(user);
      });
    }

    void showUserDialog() {
      showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              content: AddUserDialog(addUserdata),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            );
          });
    }

    // List<User> newDataList1 = List.from(userlist);
    // List<User> newDataListOriginal =List.from(userlist);

    // onItemChanged(String value) {
    //
    //   if(value == "" && a!=0) {
    //     print("last a is $a");
    //     userlist.clear;
    //     userlist = List.from(newDataListOriginal);
    //   }
    //   if(a == 0){
    //     a++;
    //     print("orignal list length ${newDataListOriginal.length}");
    //     // userlist.clear();
    //     print("first a is $a");
    //     newDataListOriginal = List.from(userlist);
    //   }
    //   print("Value is $value");
    //   setState(() {
    //     newDataList1 = userlist
    //         .where(
    //             (user) => user.name.toLowerCase().contains(value.toLowerCase()))
    //         .toList();
    //   });
    //  //  userlist.clear();
    //   userlist = List.from(newDataList1);
    // }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffFDC500),
        onPressed: showUserDialog,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Emergency Contact',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          children: [
            // TextField(
            //   controller: _textController,
            //   decoration: InputDecoration(
            //     hintText: 'Search Here...',
            //   ),
            //   onChanged: onItemChanged,
            // ),
            Expanded(
              child: ListView.builder(
                  itemCount: userlist.length,
                  itemBuilder: (context, index) {
                    return Card(
                        elevation: 2,
                        child: ListTile(
                            leading: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.call),
                            ),
                            title: Text(
                              userlist[index].name,
                              style: TextStyle(fontSize: 20),
                            ),
                            subtitle: Text(userlist[index].phoneNo),
                            trailing: PopupMenuButton(
                                icon: Icon(Icons.more_vert),
                                itemBuilder: (context) => [
                                      PopupMenuItem(
                                        child: ListTile(
                                          title: Text('Edit'),
                                          leading: IconButton(
                                            onPressed: () {
                                              // showDialog(
                                              //     context: context,
                                              //     builder: (context) =>
                                              //         SimpleDialog(
                                              //           children: [
                                              //             TextField(
                                              //               onChanged: (value) {
                                              //                 setState(() {
                                              //                   text = value;
                                              //                 });
                                              //               },
                                              //             ),
                                              //
                                              //             ElevatedButton(
                                              //                 onPressed: () {
                                              //                   setState(() {
                                              //                     userlist[index]
                                              //                             .name =
                                              //                         text;
                                              //                     userlist[index].phoneNo = text;
                                              //                   });
                                              //                   Navigator.pop(
                                              //                       context);
                                              //                 },
                                              //                 child: Text(
                                              //                     'Update'))
                                              //           ],
                                              //         )
                                              // );
                                            },
                                            icon: Icon(Icons.edit),
                                          ),
                                        ),
                                        value: 1,
                                      ),
                                      PopupMenuItem(
                                        child: ListTile(
                                          title: Text('Delete'),
                                          leading: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                userlist.removeAt(index);
                                                Navigator.pop(context);
                                              });
                                            },
                                            icon: Icon(Icons.delete),
                                          ),
                                        ),
                                        value: 2,
                                      )
                                    ]))
                        // Padding(
                        //   padding: const EdgeInsets.all(10.0),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Column(
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: [
                        //           Row(
                        //             children: [
                        //               Icon(
                        //                 Icons.call,
                        //                 color: Colors.grey,
                        //               ),
                        //               SizedBox(
                        //                 width: 10,
                        //               ),
                        //               Column(
                        //                 children: [
                        //                   Text(userlist[index].name),
                        //                   Text(userlist[index].phoneNo),
                        //                 ],
                        //               ),
                        //             ],
                        //           ),
                        //         ],
                        //       ),
                        //       Column(
                        //         children: [
                        //           Icon(
                        //             Icons.more_vert,
                        //             color: Colors.grey,
                        //           ),
                        //         ],
                        //       )
                        //     ],
                        //   ),
                        // ),
                        );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
