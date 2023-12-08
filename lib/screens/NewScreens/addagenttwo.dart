import 'package:country_code_picker/country_code_picker.dart';
import 'package:sapaid/constants/app_libraries.dart';
import 'package:sapaid/controllers/wallet/wallet_controller.dart';
import 'package:sapaid/screens/NewScreens/popup.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

class AddAgentTwo extends StatefulWidget {
  const AddAgentTwo({super.key});

  @override
  State<AddAgentTwo> createState() => _AddAgentTwoState();
}

class _AddAgentTwoState extends State<AddAgentTwo> {
  bool? value=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CommonAppBar(
      //   centertitle: false,
      //   title: 'Add Agent',
      //   leading: CommonIconButton(
      //     iconData: Icons.chevron_left,
      //     color: AppColors.blackButtoncolor,
      //
      //     isButton: true,
      //     onPressed: () {
      //       Get.back();
      //     },
      //   ),
      //   actions: [
      //
      //   ],
      // ),
      body: bodyData(context),
    );
  }

  // ------------------- MAIN WIDGET -----------------------------
  Widget bodyData(BuildContext context) {
    return GetBuilder<WalletController>(
        init: WalletController(),
        builder: (_) {
          return SafeArea(
            child: SingleChildScrollView(

              child: Container(
                // height: MediaQuery.of(context).size.height,
                // width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 11,),
                    Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(children: [
                          Text("Add Agent", style:  GoogleFonts.poppins(
                    fontSize: 33,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor),),

                          const  Text("Fill the form to add a Agent account", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),).marginOnly(left: 16, top: 22, bottom: 18),
                        ],),
                      Container(
                        height: 80,width: 200,
                        child: Image.asset(
                          AppAssets.appsecondarylogo,
                          fit: BoxFit.contain,
                        ).marginAll(12),
                      )
                    ],),
                    // const  Text("Fill the form to add a Agent account", style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),).marginOnly(left: 16, top: 22, bottom: 18),
Row(
  children: [

    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("First Name").marginOnly(left: 16),
        Container(
            height: 100,width: 200,
            child: CommonTextField(

              hintText: "First Name",
              isRequired: false,


            ).marginOnly(top: 10, left: 13, right: 13),
        ),
      ],
    ),

    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Last Name"),
        Container(
            height: 100,width: 200,
            child: CommonTextField(

              hintText: "Last Name",
              isRequired: false,


            ).marginOnly(top: 10, left: 13, right: 13),
        ),
      ],
    ),
  ],
),
                    Text("User Name").marginOnly(left: 16),
                    CommonTextField(

                      hintText: "User Name",
                      isRequired: false,


                    ).marginOnly(top: 10, left: 13, right: 13, bottom: 11),
                    Text("Enter Phone Number").marginOnly(left: 16, bottom: 11),
                    Row(children: [
                      Container(

                     color: Colors.grey.withOpacity(0.3),
                        height: 50,width: 120,child: CountryCodePicker(
                        initialSelection: 'IT',

                      ),).marginOnly(left: 11),
                      Container(
                        height: 50,width: MediaQuery.of(context).size.width*0.6,
                        child: CommonTextField(

                          hintText: "Enter email address",
                          isRequired: false,


                        ),
                      ).marginOnly(left: 11)

                    ],),

                    Text("Local Address ", ).marginOnly(left: 16, top: 22),
                    CommonTextField(

                      hintText: "Enter email address",
                      isRequired: false,


                    ).marginOnly(top: 10, left: 13, right: 13),
                    Text("Enter your  email ", ).marginOnly(left: 16, top: 22),
                    CommonTextField(

                      hintText: "Enter your  email ",
                      isRequired: false,


                    ).marginOnly(top: 10, left: 13, right: 13),
                    Text("Enter your  password ", ).marginOnly(left: 16, top: 22),
                    CommonTextField(

                      hintText: "Enter your  password",
                      isRequired: false,


                    ).marginOnly(top: 10, left: 13, right: 13),
                    Text("Enter confirm password ", ).marginOnly(left: 16, top: 22),
                    CommonTextField(

                      hintText: "Enter confirm password ",
                      isRequired: false,


                    ).marginOnly(top: 10, left: 13, right: 13),










                    Row(children: [
                      Checkbox(value: value, onChanged: (va){
                        setState(() {
                          value=va;
                        });})

                      ,
                      RichText(
                        text: TextSpan(
                          text: 'I agree with the  ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0, // Adjust the font size for the entire RichText
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Terms & conditions',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: ' and',

                            ),
                            TextSpan(
                              text: ' Policy',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),)
                    ],).marginOnly(left: 11, right: 11, top: 12, bottom: 7),
                    Center(

                        child: CommonButton(
                            height:MediaQuery.of(context).size.height*0.07 ,
                            width: MediaQuery.of(context).size.width*0.9,
                            text: 'Create Account', onPressed: (){

                          context.popsup2(context);
                        })).marginOnly(left: 10, right: 10),

                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'Do you already have account? ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0, // Adjust the font size for the entire RichText
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Login here',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                          ],
                        ),).marginOnly(top: 11, bottom: 11),
                    )
                  ],),

              ),
            ),
          );
        });
  }
}
