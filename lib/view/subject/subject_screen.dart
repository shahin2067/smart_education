import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_education/controller/subject_controller.dart';
import 'package:smart_education/view/pdf/pdf_view.dart';

class SubjectScreen extends StatefulWidget {
  final String? title;
  final String? subjectName;

  const SubjectScreen({super.key, this.title, this.subjectName});

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  SubjectController subjectController = Get.find();
  @override
  void initState() {
    subjectController.getLessionBySubject(
        subjectName: widget.subjectName.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title.toString()),
        ),
        body: Obx(
          () => Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
            child: ListView.separated(
              itemCount: subjectController.allSubjects.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      subjectController.allSubjects[index].subjectDescrition
                          .toString(),
                      style: TextStyle(fontSize: 18.sp, color: Colors.red),
                    ),
                    trailing: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => PdfViewScreen(
                                    pdfUrl: subjectController
                                            .allSubjects[index].pdfUrl ??
                                        "",
                                    title: subjectController
                                        .allSubjects[index].subjectDescrition
                                        .toString()))));
                      },
                      child: Container(
                        height: 25.sp,
                        width: 25.sp,
                        decoration: const BoxDecoration(
                          color: Colors.pink,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 20.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 0.h);
              },
            ),
          ),
        ));
  }
}
