import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_education/controller/class_controller.dart';
import 'package:smart_education/view/subject/subject_screen.dart';

class ClassPage extends StatelessWidget {
  const ClassPage({super.key});

  @override
  Widget build(BuildContext context) {
    ClassController classController = Get.find();

    return Scaffold(
        appBar: AppBar(
          title: const Text("ক্লাস সমূহ"),
        ),
        body: Obx(
          () => Container(
            margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15.sp),
                topLeft: Radius.circular(15.sp),
              ),
            ),
            child: Column(
              children: [
                classController.isLoading.value
                    ? const CircularProgressIndicator(
                        color: Colors.blue,
                      )
                    : Expanded(
                        child: GridView(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 5.w / 2.h,
                                  crossAxisSpacing: 2.w,
                                  mainAxisSpacing: 1.h),
                          children: List.generate(
                            classController.allClasses.length,
                            (index) => InkWell(
                              onTap: () async {
                                // selectedIndex.value = index;

                                // await classController.getLessionBySubject(

                                //     subjectName:
                                //         publishedSubjects[selectedIndex.value]
                                //             .subjectName
                                //             .toString());
                                // // ignore: use_build_context_synchronously
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SubjectScreen(
                                              title: classController
                                                  .allClasses[index]
                                                  .classDescription
                                                  .toString(),
                                              subjectName: classController
                                                  .allClasses[index].className
                                                  .toString(),
                                            )));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12.sp),
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            "assets/images/image1.png"),
                                        fit: BoxFit.fill),
                                    border: Border.all(
                                        width: 1,
                                        color: const Color(0xffededed))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 1.5.w),
                                      child: Text(
                                        classController.allClasses[index]
                                                .classDescription ??
                                            "",
                                        textAlign: TextAlign.center,

                                        // "বাংলা",
                                        style: TextStyle(
                                            fontSize: 19.sp,
                                            fontWeight: FontWeight.bold
                                            // color: const Color(0xff7e7e7e)
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ));
  }
}
