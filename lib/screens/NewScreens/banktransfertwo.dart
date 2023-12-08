import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:sapaid/constants/app_libraries.dart';
import 'package:sapaid/controllers/wallet/wallet_controller.dart';
import 'package:sapaid/screens/NewScreens/popup.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

class BankTransferTwo extends StatefulWidget {
  const BankTransferTwo({super.key});

  @override
  State<BankTransferTwo> createState() => _BankTransferTwoState();
}

class _BankTransferTwoState extends State<BankTransferTwo> {
  bool? value=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyData(context),
    );
  }

  // ------------------- MAIN WIDGET -----------------------------
  Widget bodyData(BuildContext context) {
    return GetBuilder<WalletController>(
        init: WalletController(),
        builder: (_) {
          return SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 11,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      Icon(Icons.chevron_left, size: 35,color: AppColors.primaryColor,),
                      Text("Add Beneficiary", style:  GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor),),
                      Spacer(),
                      Container(
                        height: 65,width: 120,
                        child: Image.asset(
                          AppAssets.appsecondarylogo,
                          fit: BoxFit.contain,
                        ).marginAll(12),
                      )
                    ],),
                  const  Text("Sent to", style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),).marginOnly(left: 16, top: 22, bottom: 18),
                  Container(
                    height: 150,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 15,
                        itemBuilder: (context, index){return Column(
                          children: [
                            CircleAvatar(radius: 30,
                              child: Icon(Icons.person_outlined,size: 32),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("jojo001",style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ).marginAll(11)
                        ;}),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric( horizontal: 18.0),
                    child: Divider(
                      height: 2,
                      color: Colors.black,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text("Add Beneficary",style: TextStyle(fontWeight: FontWeight.bold)),),
                  Text(" Bank", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold ),).marginOnly(left: 16, top: 22),
                  // CommonTextField(
                  //   readOnly: true,
                  //   hintText: "Select Bank",
                  //   isRequired: false,
                  // ).marginOnly(top: 10, left: 13, right: 13),
                  CustomDropdown(
                    // expandedFillColor: Colors.blue,
                    closedFillColor: Colors.grey.withOpacity(0.2),
                    items: ['FirstBank ','First Bank'], hintText: 'Select Bank',).marginOnly(top: 10),
                  // Text(" Account Number", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold ),).marginOnly(left: 16, top: 22),
                  // CommonTextField(
                  //
                  //   hintText: "Enter  Account Number ",
                  //   isRequired: false,
                  //
                  //
                  // ).marginOnly(top: 10, left: 13, right: 13),
                  // Text(" Amount", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold ),).marginOnly(left: 16, top: 22),
                  // CommonTextField(
                  //
                  //   hintText: "Enter Amount",
                  //   isRequired: false,
                  //
                  //
                  // ).marginOnly(top: 10, left: 13, right: 13),
                  //
                  // Text(" Other", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold ),).marginOnly(left: 16, top: 22),
                  // CommonTextField(
                  //
                  //   hintText: "Other",
                  //   isRequired: false,
                  //
                  //
                  // ).marginOnly(top: 10, left: 13, right: 13),
                  Spacer()


                  ,  Center(

                      child: CommonButton(
                          height:MediaQuery.of(context).size.height*0.07 ,
                          width: MediaQuery.of(context).size.width*0.9,
                          text: 'Next', onPressed: (){


                      })).marginOnly(left: 10, right: 10, bottom: 22),


                ],),

            ),
          );
        });
  }
}
