// import 'package:default_project/screens/add/add_screen.dart';
// import 'package:default_project/utils/app_text_style.dart';
// import 'package:default_project/utils/appcolors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../utils/app_images.dart';
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return AnnotatedRegion(
//       value: const SystemUiOverlayStyle(
//           statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.light),
//       child: Scaffold(
//         backgroundColor: Color(0xFF252525),
//         body: Padding(
//           padding: EdgeInsets.only(
//             left: 24.w,
//             top: 47.h,
//             right: 24.w,
//           ),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Text(
//                     "Notes",
//                     style: AppTextStyle.robotoMedium.copyWith(
//                         color: Colors.white, fontSize: 43.sp, fontWeight: FontWeight.w600),
//                   ),
//                   const Spacer(),
//                   InkWell(
//                     onTap: () {},
//                     borderRadius: BorderRadius.circular(15.r),
//                     child: Container(
//                       width: 40.w,
//                       height: 40.h,
//                       decoration: BoxDecoration(
//                           color: Color(0xFF3B3B3B), borderRadius: BorderRadius.circular(15.r)),
//                       child: Center(
//                         child: Icon(
//                           Icons.search,
//                           size: 24.sp,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 21.w,
//                   ),
//                   InkWell(
//                     onTap: () {},
//                     borderRadius: BorderRadius.circular(15.r),
//                     child: Container(
//                       width: 40.w,
//                       height: 40.h,
//                       decoration: BoxDecoration(
//                           color: Color(0xFF3B3B3B), borderRadius: BorderRadius.circular(15.r)),
//                       child: Center(
//                         child: Icon(
//                           Icons.info_outline,
//                           size: 24.sp,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 117.h,
//               ),
//               Center(
//                 child: Column(
//                   children: [
//                     Image.asset(AppImages.note),
//                     Text(
//                       "Create your first note !",
//                       style: AppTextStyle.robotoRegular.copyWith(
//                           color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18.sp),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
//         floatingActionButton: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: SizedBox(
//             width: 60.w,
//             height: 60.h,
//             child: FloatingActionButton(
//               materialTapTargetSize: MaterialTapTargetSize.padded,
//               backgroundColor: const Color(0xFF252525),
//               elevation: 20,
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>const  AddScreen()));
//               },
//               child: const Icon(
//                 Icons.add,
//                 size: 40,
//                 weight: 800,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }