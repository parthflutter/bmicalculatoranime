import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../controller/controller_bmi.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}
Homecontroller homecontroller = Get.put(Homecontroller());
class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation? sizeTween;
  Animation? leftOffsetTween;
  Animation? rightOffsetTween;
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    sizeTween =
        Tween<double>(begin: 90, end: 200).animate(animationController!);
    leftOffsetTween = Tween<Offset>(begin: Offset(-200, 0), end: Offset(0, 0))
        .animate(animationController!);
    rightOffsetTween = Tween<Offset>(begin: Offset(200, 0), end: Offset(0, 0))
        .animate(animationController!);
    animationController!.forward();
    animationController!.addListener(() {
      setState(() {});
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.deepPurple,
          title: Text("BMI CALCULATE",
              style: GoogleFonts.poppins(color: Color(0xffC9D6DF))),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  homecontroller.bmiResult.value = 0.0;
                  homecontroller.weightValue.value = 0;
                  homecontroller.ageValue.value = 0;
                },
                child: Icon(
                  Icons.refresh,
                  color: Color(
                    0xffC9D6DF,
                  ),
                  size: 28,
                ),
              ),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      homecontroller.maleFemaleChange();
                    },
                    child: maleContainer()),
                InkWell(
                    onTap: () {
                      homecontroller.maleFemaleChange();
                    },
                    child: femaleContainer()),
              ],
            ),
            InkWell(
                onTap: () {
                  homecontroller.maleFemaleChange();
                },
                child: heightContainer()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                weightContainer(),
                ageContainer(),
              ],
            ),
            InkWell(
                onTap: () {
                  homecontroller.bmiResultCalculation();
                  Get.toNamed('/Resultscreen');
                },
                child: bottomClickButton()),
          ],
        ),
      ),
    );
  }
  Obx maleContainer() {
    return Obx(
      () => Transform.translate(
        offset: leftOffsetTween!.value,
        child: Container(
          margin: EdgeInsets.all(10),
          height: 18.h,
          width: 40.w,
          decoration: BoxDecoration(
            color:
                homecontroller.isMale.isTrue ? Colors.black38 : Colors.white12,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.male,
                color: Color(0xffC9D6DF),
                size: 60.sp,
              ),
              Text(
                "MALE",
                style: GoogleFonts.poppins(
                  letterSpacing: 1,
                  color: Color(0xffC9D6DF),
                  fontSize: 15.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Obx femaleContainer() {
    return Obx(
      () => Transform.translate(
        offset: rightOffsetTween!.value,
        child: Container(
          margin: EdgeInsets.all(10),
          height: 18.h,
          width: 40.w,
          decoration: BoxDecoration(
            color:
                homecontroller.isMale.isTrue ? Colors.white12 : Colors.black38,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.female,
                color: Color(0xffC9D6DF),
                size: 60.sp,
              ),
              Text("FEMALE",
                  style: GoogleFonts.poppins(
                      letterSpacing: 1,
                      color: Color(0xffC9D6DF),
                      fontSize: 15.sp)),
            ],
          ),
        ),
      ),
    );
  }
  Transform heightContainer() {
    return Transform.translate(
      offset: leftOffsetTween!.value,
      child: Container(
        margin: EdgeInsets.all(20),
        height: 20.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(15),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'HEIGHT',
              style: GoogleFonts.poppins(
                  fontSize: 12.sp, color: Color(0xffC9D6DF), letterSpacing: 1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => Text(
                    "${homecontroller.sliderValue.toInt()}",
                    style: GoogleFonts.poppins(
                      color: Color(0xffF0F5F9),
                      fontSize: 35.sp,
                    ),
                  ),
                ),
                Text(
                  ' cm',
                  style: GoogleFonts.poppins(
                    fontSize: 18.sp,
                    color: Color(0xffC9D6DF),
                  ),
                ),
              ],
            ),
            Obx(
              () => Slider(
                max: 300,
                min: 50,
                activeColor: Colors.black38,
                inactiveColor: Color(0xffC9D6DF),
                value: homecontroller.sliderValue.value,
                onChanged: (value) {
                  homecontroller.sliderValueOnChanged(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  Transform ageContainer() {
    return Transform.translate(
      offset: rightOffsetTween!.value,
      child: Container(
        margin: EdgeInsets.all(10),
        height: 21.h,
        width: 42.w,
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(15),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("AGE",
                style: GoogleFonts.poppins(
                    color: Color(0xffC9D6DF),
                    letterSpacing: 1,
                    fontSize: 10.sp)),
            Obx(() => Text("${homecontroller.ageValue}",
                style: GoogleFonts.poppins(
                    color: Color(0xffF0F5F9),
                    letterSpacing: 1,
                    fontSize: 35.sp,
                    fontWeight: FontWeight.w500))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    homecontroller.ageValueIncreament();
                  },
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      homecontroller.ageValueDecreament();
                    },
                    icon: Icon(
                      Icons.minimize,
                      color: Colors.white,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
  Transform weightContainer() {
    return Transform.translate(
      offset: leftOffsetTween!.value,
      child: Container(
        margin: EdgeInsets.all(10),
        height: 21.h,
        width: 42.w,
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(15),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("WEIGHT",
                style: GoogleFonts.poppins(
                    color: Color(0xffC9D6DF),
                    letterSpacing: 1,
                    fontSize: 10.sp)),
            Obx(() => Text('${homecontroller.weightValue.value}',
                style: GoogleFonts.poppins(
                    color: Color(0xffF0F5F9),
                    letterSpacing: 1,
                    fontSize: 35.sp,
                    fontWeight: FontWeight.w500))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    homecontroller.weightValueIncreament();
                  },
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      homecontroller.weightValueDecreament();
                    },
                    icon: Icon(
                      Icons.minimize,
                      color: Colors.white,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
  Container bottomClickButton() {
    return Container(
      height: 8.h,
      width: MediaQuery.of(context).size.width,
      color: Colors.black38,
      alignment: Alignment.center,
      child: Text('CALCULATE',
          style: GoogleFonts.poppins(
              color: Color(0xffF0F5F9),
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              letterSpacing: 1),
      ),
    );
  }
}
