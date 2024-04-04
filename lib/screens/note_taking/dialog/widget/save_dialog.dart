
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/colors/app_colors.dart';

class SaveDialog extends StatelessWidget {
  const SaveDialog({Key? key, required this.onTap, required this.onBack}) : super(key: key);
  final VoidCallback onTap;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.c_252525,
      title: Column(
        children: [
          const Icon(Icons.info,color: Color(0xFFCFCFCF)),
        SizedBox(height: 18.h,),
        Text(
          'Save Changes?',
          style: TextStyle(color: const Color(0xFFCFCFCF), fontSize: 23.sp, fontWeight: FontWeight.w400),
        ),


      ],),
           actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(8.r),
                onTap: onBack,
                child: Container(
                  width: 90.w,
                  height: 39.w,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "No",
                        style: TextStyle(color: Colors.white, fontSize: 18.sp),
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              InkWell(
                borderRadius: BorderRadius.circular(8.r),
                onTap: onTap,
                child: Container(
                  width: 90.w,
                  height: 39.w,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "Yes",
                        style: TextStyle(color: Colors.white, fontSize: 18.sp),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
