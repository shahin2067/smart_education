import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:smart_education/model/class_model.dart';

class ClassController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getAllClasses();
  }

  final allClasses = <CalssModel>[].obs;
  var isLoading = false.obs;

  Future<void> getAllClasses() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    try {
      isLoading.value = true;
      if (connectivityResult == ConnectivityResult.none) {
        Future.delayed(const Duration(milliseconds: 500), () {
          EasyLoading.showToast('No Internet Connection',
              duration: const Duration(seconds: 2));
        });
      } else {
        QuerySnapshot<Map<String, dynamic>> data =
            await FirebaseFirestore.instance.collection("Data").get();
        final classList = data.docs
            .map((className) => CalssModel.fromSnapshot(className))
            .toList();
        allClasses.assignAll(classList);
      }

      isLoading.value = false;
    } catch (e) {
      print("Error: $e");
    }
  }
}
