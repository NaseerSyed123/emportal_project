import 'package:flutter/material.dart';

class DocumentsList extends StatelessWidget {
  const DocumentsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
            child: Column(
              children: [
                ListTile(
                  title: Text('Basics of Driving'),
                  leading: Image(
                    image: AssetImage('assets/images/vehicle_img.png'),
                  ),
                  subtitle: Row(
                    children: [
                      Image(image: AssetImage('assets/images/file_icon.png')),
                      Text('200 KB')
                    ],
                  ),
                  trailing: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
                Divider(
                  height: 2,
                )
              ],
            ),
          );
        });
  }
}
