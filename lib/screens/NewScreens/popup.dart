import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sapaid/constants/app_assets.dart';
import 'package:sapaid/constants/app_colors.dart';
import 'package:sapaid/constants/app_libraries.dart';

extension Asd on BuildContext{
  Future<void> sdialgoure(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('Upload Successful',  style: TextStyle(color: AppColors.primaryColor,
              fontSize: 22, fontWeight: FontWeight.bold),)),
          content: Container(
            height: MediaQuery.of(context).size.height*0.28,
            child: Column(
              children: [


                 Image.asset(AppAssets.email),
                Center(
                  child: Text("Documents submitted! We'll review your application within 48 hours. Expect an approval email soon. Thanks for your patience").marginOnly(
                    top: 17
                  ),
                )
              ],
            ),
          ),
          actions: <Widget>[
            Center(child: CommonButton(width: MediaQuery.of(context).size.width*0.3,text: "oK",onPressed: (){
              Navigator.of(context).pop();
            },)),
          ],
        );
      },
    );
  }
}





extension popup2 on BuildContext{
  Future<void> popsup2(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            children: [
              CircleAvatar(radius: 60,child: Icon(Icons.person,size: 33),),
              Text("David Benjamin").marginOnly(top: 12)
            ],
          ),
          content: Container(
           // width: MediaQuery.of(context).size.width ,
            height: MediaQuery.of(context).size.height*0.23,
            child: Column(
              children: [


              CircleAvatar(
                backgroundColor: Colors.green,
                radius: 50,child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 40, child: Icon(Icons.check, color: Colors.green,size: 33),),),
                Center(
                   child: Text("Email has been sent to ", style: TextStyle(fontWeight: FontWeight.bold),).marginOnly(
                      top: 17
                  ),
                ),
                Center(
                  child: Text("Yor email @gmail.com ").marginOnly(
                      top: 17
                  ),
                )
              ],
            ),
          ),
          actions: <Widget>[
            Center(child: CommonButton(width: MediaQuery.of(context).size.width*0.3,text: "Back",onPressed: (){
              Navigator.of(context).pop();
            },)),
          ],
        );
      },
    );
  }
}
