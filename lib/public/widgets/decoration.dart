import 'package:flutter/material.dart';

import '../variables/config.dart';

class StDecoration{
  static BoxDecoration loginRegDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(dSize(.8)),
          bottomRight: Radius.circular(dSize(.8))
      ),
      boxShadow:[
        BoxShadow(color: Colors.grey.shade200,offset:const Offset(2,3),blurRadius: 10)
      ]
  );
}