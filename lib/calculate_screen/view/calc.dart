// import 'package:bmicalculatoranime/screen/controller/controller_bmi.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sizer/sizer.dart';
//
// class calc_screen extends StatefulWidget {
//   const calc_screen({Key? key}) : super(key: key);
//
//   @override
//   State<calc_screen> createState() => _calc_screenState();
// }
// Bmi_controller bmi = Get.put(bmi);
// class _calc_screenState extends State<calc_screen> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(child: Scaffold(
//       backgroundColor: Color(0xff1E2022),
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Color(0xff1E2022),
//         title: Text(
//           "BMI CALCULATE",
//           style: TextStyle(fontWeight:FontWeight.bold,
//             color: Color(0xffC9D6DF),
//           ),
//         ),
//         centerTitle: false,
//       ),
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text('Calc WEIGHT', style: TextStyle(fontWeight: FontWeight.bold,
//               letterSpacing: 1,
//               color: Colors.green,
//               fontSize: 20.sp,),),
//             Obx(() =>
//                 Text('${bmi.bmiResult.value.toStringAsPrecision(3)}',
//                     style: TextStyle(fontWeight: FontWeight.w500,
//                         letterSpacing: 1,
//                         color: Color(0xffF0F5F9),
//                         fontSize: 50.sp,
//                        ),
//                 ),
//             ),
//             Text('You have a normal body weight Good Job', style: TextStyle(
//               fontWeight: FontWeight.bold,
//               letterSpacing: 1,
//               color: Color(0xffC9D6DF),
//               fontSize: 18.sp,), textAlign: TextAlign.center),
//             InkWell(onTap: () {
//               Get.back();
//             }, child: reCalculateButton(),),
//           ],
//         ),
//       ),
//     ),
//     );
//   }
//   Container reCalculateButton() {
//     return Container(
//       height: 8.h,
//       width: MediaQuery.of(context).size.width,
//       color: Colors.redAccent,
//       alignment: Alignment.center,
//       child: Text('RE-CALCULATE', style: TextStyle(fontWeight: FontWeight.w500,
//           color: Color(0xffF0F5F9),
//           fontSize: 18.sp,
//           letterSpacing: 1),
//       ),
//     );
//   }
// }
//


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../screen/controller/controller_bmi.dart';

class Resultscreen extends StatefulWidget {
  const Resultscreen({Key? key}) : super(key: key);

  @override
  State<Resultscreen> createState() => _ResultscreenState();
}

class _ResultscreenState extends State<Resultscreen> {

  Homecontroller homecontroller = Get.put(Homecontroller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff1E2022),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff1E2022),
          title: Text(
            "BMI CALCULATE",
            style: GoogleFonts.poppins(
              color: Color(0xffC9D6DF),
            ),
          ),
          centerTitle: false,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('CALCULATE WEIGHT',style: GoogleFonts.poppins(letterSpacing: 1,color: Colors.white,fontSize: 17.sp,),),
              Obx(() =>  Text('${homecontroller.bmiResult.value.toStringAsPrecision(3)}',style: GoogleFonts.poppins(letterSpacing: 1,color: Color(0xffF0F5F9),fontSize: 50.sp,fontWeight: FontWeight.w500))),
              Text('You have a normal body weight Good Job',style: GoogleFonts.poppins(letterSpacing: 1,color: Color(0xffC9D6DF),fontSize: 18.sp,),textAlign: TextAlign.center),
              InkWell(onTap: () {
                Get.back();
              },child: reCalculateButton(),),
            ],
          ),
        ),
      ),
    );
  }
  Container reCalculateButton()
  {
    return Container(
      height: 8.h,
      width: MediaQuery.of(context).size.width,
      color: Colors.black38,
      alignment: Alignment.center,
      child: Text('RE-CALCULATE',style: GoogleFonts.poppins(color: Color(0xffF0F5F9),fontSize: 13.sp,fontWeight: FontWeight.w500,letterSpacing: 1)),
    );
  }
}

