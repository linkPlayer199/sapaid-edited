import 'package:sapaid/constants/app_libraries.dart';
import 'package:sapaid/controllers/wallet/wallet_controller.dart';
import 'package:sapaid/screens/NewScreens/popup.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

class AddAgent extends StatefulWidget {
  const AddAgent({super.key});

  @override
  State<AddAgent> createState() => _AddAgentState();
}

class _AddAgentState extends State<AddAgent> {
  bool? value=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        centertitle: false,
        title: 'Add Agent',
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
              // height: MediaQuery.of(context).size.height,
              // width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 CommonTextField(
                hintText: 'Search Agent',
             prefixIcon: Icons.search,
                    isRequired: false,


                  ).marginOnly(top: 10, left: 13, right: 13),
                  Text("Your Agent ", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold ),).marginOnly(left: 16, top: 22),
                 Container(

                   height: MediaQuery.of(context).size.height *0.65,
                   child: ListView.builder(
                       itemCount: 4,
                       itemBuilder: (context, index){
                     return    Container(
                       decoration: BoxDecoration(

                           border: Border.all(width: 1), borderRadius: BorderRadius.circular(15)),
                       height: MediaQuery.of(context).size.height*0.12,
                       child: ListTile(
                         trailing: Container(


                           child: Column(
                           //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [

                               // Text("Balance  \$340").marginOnly(bottom: 13),
                               RichText(
                                 text: TextSpan(
                                   text: 'Balance ',
                                   style: TextStyle(
                                     color: Colors.black,
                                     fontSize: 16.0, // Adjust the font size for the entire RichText
                                   ),
                                   children: <TextSpan>[
                                     TextSpan(
                                       text: ' \$340',
                                       style: TextStyle(
                                         color: Colors.green,
                                         fontWeight: FontWeight.bold,
                                       ),
                                     ),


                                   ],
                                 ),).marginOnly(bottom: 10),
                               //SizedBox(height: 0,),
                               Container(
                                 height: 27,
                                 child:ElevatedButton(
                                   onPressed: () {
                                     // Add your button's onPressed logic here
                                   },
                                   child: Text('View'),
                                   style: ElevatedButton.styleFrom(
                                     shape: RoundedRectangleBorder(
                                       borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                                     ),
                                   ),
                                 ),

                               ),
                             ],
                           ),
                         ),
                         leading:CircleAvatar(radius: 25,),
                         title: Container(

                           height: MediaQuery.of(context).size.height*0.05,
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text("Online", style: TextStyle( color:Colors.green,fontSize: 11),).marginOnly(bottom: 5),

                               Text("Joseph Anthony", style: TextStyle(fontWeight: FontWeight.bold)),
                             ],
                           ),
                         ),

                         subtitle: Container(
                           width: 100,
                           child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("Agent").marginOnly(bottom: 3),
                             // SizedBox(height: 11,),
                             Text("Your Business"),


                           ],),
                         ),),
                       width:MediaQuery.of(context).size.width ,)

                         .marginOnly(left: 16,right: 26, top: 32);
                   }),
                 ),
     Row(mainAxisAlignment: MainAxisAlignment.end,children: [
Container(height: 50,width: 60,
  child: Center(child: Column(
    children: [
      Icon(Icons.add),
      Text("Add Agent", style: TextStyle(fontSize: 12),)
    ],
  ),),
).marginOnly(right: 22)
       
     ],),
      Center(child: CommonButton(text: 'Transfer', onPressed: (){}))
                ],),

            ),
          );
        });
  }
}
