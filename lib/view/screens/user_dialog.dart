import 'package:emportal_project/models/user.dart';
import 'package:emportal_project/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';


class AddUserDialog extends StatefulWidget {
  final Function(User) addUser;

  AddUserDialog(this.addUser);

  @override
  State<AddUserDialog> createState() => _AddUserDialogState();
}

class _AddUserDialogState extends State<AddUserDialog> {
  @override
  Widget build(BuildContext context) {
    Widget buildTextfield(String hint, TextEditingController controller) {
      return Container(
        color: Colors.grey[200],
        margin: EdgeInsets.all(5),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10),
              hintText: hint,
              border: InputBorder.none,
              labelStyle: TextStyle(letterSpacing: 2)),
        ),
      );
    }

    var nameController = TextEditingController();

    var phoneController = TextEditingController();

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Add User',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xffFDC500),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildTextfield('Name ', nameController),
          buildTextfield('Phone ', phoneController),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              final user = User(nameController.text, phoneController.text);

              widget.addUser(user);

              Navigator.pop(context);
            },
            child: CustomButton(
                buttonTitle: 'Add Contact',
                bgColor: Color(0xffFDC500),
                borderColor: Color(0xffFDC500),
                textColor: Colors.black),
          ),
        ],
      ),
    );
  }
}
