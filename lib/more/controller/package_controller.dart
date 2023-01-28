import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cricland/more/model/package_model.dart';
import 'package:cricland/public/variables/app_string.dart';
import 'package:cricland/public/variables/variable.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class PackageController extends GetxController {
  late RxBool loading;
  late RxList<PackageModel> packageList;

  @override
  void onInit() {
    super.onInit();

    loading = false.obs;
    packageList = <PackageModel>[].obs;
    getPackage();
  }

  Future<void> getPackage() async {
    try {
      loading(true);
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection(AppString.packageCollection)
          .orderBy('package_price', descending: true)
          .get();
      packageList.clear();
      for (var element in snapshot.docChanges) {
        PackageModel model = PackageModel(
          id: element.doc['id'],
          packageName: element.doc['package_name'],
          packagePrice: double.parse(element.doc['package_price'].toString()),
          packageDuration: element.doc['package_duration'],
          discountAmount: element.doc['discount_amount'] != null
              ? double.parse(element.doc['discount_amount'].toString())
              : null,
          colorCode: element.doc['color_code'],
          timeStamp: element.doc['timestamp'],
        );
        packageList.add(model);
      }
      loading(false);
      if (kDebugMode) {
        print('Package Total: ${packageList.length}');
      }
    } on SocketException {
      loading(false);
      showToast(AppString.noInternet);
    } catch (error) {
      loading(false);
      showToast(error.toString());
    }
  }
}
