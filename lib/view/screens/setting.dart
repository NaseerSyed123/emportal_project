import 'package:emportal_project/view/screens/change_password_scvreen.dart';
import 'package:emportal_project/view/screens/get_holigays_form.dart';
import 'package:flutter/material.dart';


class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.grey[600]),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: ListView(
            children: [
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xfff5f5f5),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: ListTile(
                      title: Text('Ahsan Iqbal'),
                      subtitle: Text('AbX-2356'),
                      trailing: Text(
                        'Edit',
                        style: TextStyle(
                          color: Color(0xffFDC500),
                        ),
                      ),
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/person_img.png'),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 3.0, vertical: 0),
                        ),
                      ),
                    )),
              ),
              Card(
                  color: Color(0xfff5f5f5),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: ListTile(
                    leading: Icon(Icons.notifications),
                    title: Text('Notification setting'),
                    trailing: Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                          print(isSwitched);
                        });
                      },
                      activeTrackColor: Color(0xffFDC500),
                      activeColor: Color(0xffFDC500),
                    ),
                  )),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GetHoldaysForm()));
                },
                child: settingWidget(
                    titleText: 'Get Holigays', iconData: Icons.business_center),
              ),

              InkWell(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChangepasswordScreen()));
                  },
                  child: settingWidget(titleText: 'Change Password', iconData: Icons.lock)),
              settingWidget(
                  titleText: 'Report setting', iconData: Icons.report),
              settingWidget(titleText: 'Message setting', iconData: Icons.mail),
              settingWidget(
                  titleText: 'Term & conditions', iconData: Icons.content_copy),
              settingWidget(
                  titleText: 'Sign out', iconData: Icons.power_settings_new),
            ],
          )),
    );
  }

  Widget settingWidget(
      {required String titleText, required IconData iconData}) {
    return Card(
      color: Color(0xfff5f5f5),
      elevation: 3,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: ListTile(
        leading: Icon(
          iconData,
        ),
        title: Text(titleText),
      ),
    );
  }
}
