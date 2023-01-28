class PackageModel {
  String? id;
  String? packageName;
  double? packagePrice;
  int? packageDuration;
  double? discountAmount;
  String? colorCode;
  int? timeStamp;

  PackageModel(
      {this.id,
      this.packageName,
      this.packagePrice,
      this.packageDuration,
      this.discountAmount,
      this.colorCode,
      this.timeStamp});
}
