import 'package:get/get.dart';

double dSize(double size){
  return Get.size.width>=500?Get.size.height*size:Get.size.width*size;
}