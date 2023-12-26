import 'package:get/get.dart';
import 'package:smart_education/controller/class_controller.dart';
import 'package:smart_education/controller/subject_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ClassController());
    Get.put(SubjectController());
  }
}
