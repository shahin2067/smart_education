import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:smart_education/model/subject_model.dart';

class SubjectController extends GetxController {

  final allSubjects = <SubjectModel>[].obs;
  var isLoading = false.obs;

  Future<void> getLessionBySubject({required String subjectName}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    try {
      isLoading.value = true;
      if (connectivityResult == ConnectivityResult.none) {
        Future.delayed(const Duration(milliseconds: 500), () {
          EasyLoading.showToast('No Internet Connection',
              duration: const Duration(seconds: 2));
        });
      } else {
        QuerySnapshot<Map<String, dynamic>> data = await FirebaseFirestore
            .instance
            .collection("Data")
            .doc(subjectName)
            .collection("subjects")
            .get();
        final subjectList = data.docs
            .map((subject) => SubjectModel.fromSnapshot(subject))
            .toList();
        allSubjects.assignAll(subjectList);
        isLoading.value = false;
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
