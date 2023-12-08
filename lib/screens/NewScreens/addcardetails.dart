import 'package:sapaid/constants/app_libraries.dart';
import 'package:sapaid/controllers/wallet/wallet_controller.dart';
import 'package:sapaid/screens/NewScreens/popup.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

class AddcardDetails extends StatefulWidget {
  const AddcardDetails({super.key});

  @override
  State<AddcardDetails> createState() => _AddcardDetailsState();
}

class _AddcardDetailsState extends State<AddcardDetails> {
  bool? value=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        centertitle: false,
        title: 'Add Details',
        leading: CommonIconButton(
          iconData: Icons.chevron_left,
          color: AppColors.blackButtoncolor,

          isButton: true,
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          Image.asset(
            AppAssets.appsecondarylogo,
            fit: BoxFit.contain,
          ).marginAll(12)
        ],
      ),
      body: bodyData(context),
    );
  }

  // ------------------- MAIN WIDGET -----------------------------
  Widget bodyData(BuildContext context) {
    return GetBuilder<WalletController>(
         init: WalletController(),
        builder: (_) {
        return SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const  Text("Add your Business Details", style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),).marginOnly(left: 16, top: 22),

             const   Text("Fill the form to create a account as individual User", style:
                TextStyle(fontSize: 15,fontWeight: FontWeight.w400,  fontFamily: 'Poppins',
                    color: AppColors.textColor,),).marginOnly(left: 16, top: 22)
                ,Text(" Business Name", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold ),).marginOnly(left: 16, top: 22),
                CommonTextField(

                  hintText: "Businees Name",
                  isRequired: false,


                ).marginOnly(top: 10, left: 13, right: 13),
                Text("Number of Location ", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold ),).marginOnly(left: 16, top: 22),
                CommonTextField(

                  hintText: "Location 1",
                  isRequired: false,


                ).marginOnly(top: 10, left: 13, right: 13),
                Text("Upload File ", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold ),).marginOnly(left: 16, top: 22),
                  Container(
                       child: Center(child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Icon(Icons.image),
                           Text("Select File")
                         ],
                       ),),
                    height: MediaQuery.of(context).size.height*0.20,width:MediaQuery.of(context).size.width ,
                  decoration: BoxDecoration(
                    border: Border.all(width: 3, color: AppColors.primaryColor ),
                      borderRadius: BorderRadius.circular(27)),
                  ).marginOnly(left: 16,right: 16, top: 12)
           , Container(
                  decoration: BoxDecoration(border: Border.all(width: 1), borderRadius: BorderRadius.circular(15)),
                  height: MediaQuery.of(context).size.height*0.09,
                   child: ListTile(
                     trailing: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Icon(Icons.check, color: Colors.green,),

                         Text("100 %")
                       ],
                     ),
                     leading: Icon(Icons.file_copy),
                     title: Text("proquirment_tc.mp3").marginOnly(bottom: 6),subtitle: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                     Text("500kb"),
                 SizedBox(height: 11,),
                     ProgressBar(value: 2.3,
                       backgroundColor: Colors.black,
                       gradient: LinearGradient(

                       begin: Alignment.topLeft,
                       end: Alignment.bottomRight,
                       colors: [Colors.green, Colors.greenAccent ],
                     ),
                     ),


                   ],),),
                  width:MediaQuery.of(context).size.width ,)

                    .marginOnly(left: 16,right: 26, top: 12),
                Container(
                  decoration: BoxDecoration(border: Border.all(width: 1), borderRadius: BorderRadius.circular(15)),
                  height: MediaQuery.of(context).size.height*0.09,
                  child: ListTile(
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.delete,),

                        Text("100 %")
                      ],
                    ),
                    leading: Icon(Icons.file_copy),
                    title: Text("proquirment_tc.mp3").marginOnly(bottom: 6),subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("500kb"),
                      SizedBox(height: 11,),
                      ProgressBar(

                        value: 10,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.green, Colors.greenAccent ],
                        ),
                      ),


                    ],),),
                  width:MediaQuery.of(context).size.width ,)

                    .marginOnly(left: 16,right: 26, top: 12),


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
                        text: 'Submit', onPressed: (){

                        context.sdialgoure(context);
                    })).marginOnly(left: 10, right: 10)
              ],),

          ),
        );
        });
  }
}
