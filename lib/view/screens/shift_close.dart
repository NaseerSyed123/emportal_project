import 'package:emportal_project/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';


class ShiftClose extends StatefulWidget {
  const ShiftClose({Key? key}) : super(key: key);

  @override
  State<ShiftClose> createState() => _ShiftCloseState();
}

class _ShiftCloseState extends State<ShiftClose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shift Close',
          style: TextStyle(color: Colors.grey[600]),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.grey[600],
          ),
          onPressed: () {
             Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Image(image: AssetImage('assets/images/shift_close_img.png')),
            SizedBox(
              height: 20,
            ),
            shiftButton(titleText: 'Time', icon: Icons.watch_later_outlined),
            SizedBox(
              height: 10,
            ),
            shiftButton(titleText: 'Date', icon: Icons.calendar_month),
            SizedBox(
              height: 10,
            ),
            shiftButton(titleText: 'Damage of Truck', icon: Icons.keyboard_arrow_down),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: (){
                 Navigator.pop(context);
              },
              child: CustomButton(
                  buttonTitle: 'Shift close',
                  bgColor: Color(0xffFDC500),
                  borderColor: Color(0xffFDC500),
                  textColor: Colors.black),
            ),
            SizedBox(
              height: 20,
            ),
            Center(child: Text('Terms & conditions', style: TextStyle(color: Colors.grey),))
          ],
        ),
      ),
    );
  }

  Widget shiftButton({required String titleText, required IconData icon}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.grey[200],
          border: Border.all(color: Colors.grey)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(titleText),
          Icon(
            icon,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
