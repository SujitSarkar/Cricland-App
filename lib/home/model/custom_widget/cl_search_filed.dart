// import 'package:cricland/home/model/custom_widget/app_text_style.dart';
// import 'package:cricland/public/variables/colors.dart';
// import 'package:flutter/material.dart';
//
// class CLSearchField extends StatefulWidget {
//   const CLSearchField({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<CLSearchField> createState() => _CLSearchFieldState();
// }
//
// class _CLSearchFieldState extends State<CLSearchField> {
//   bool isSearchPressed = false;
//   FocusNode f1 = FocusNode();
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         FocusScopeNode currentFocus = FocusScope.of(context);
//
//         if (!currentFocus.hasPrimaryFocus) {
//           currentFocus.unfocus();
//         }
//       },
//       child: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               TextFormField(
//                 focusNode: f1,
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.white,
//                   hintText: "Search your destination",
//                   hintStyle: CLTextStyle.CLSubHeader,
//                   prefixIcon: const Padding(
//                     padding: EdgeInsets.only(left: 10.0),
//                     child: Icon(
//                       Icons.search,
//                       color: AllColor.primaryColor,
//                     ),
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   isDense: true,
//                 ),
//                 onTap: () {},
//                 onEditingComplete: () {},
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
