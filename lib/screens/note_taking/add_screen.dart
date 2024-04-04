import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_taking_with_bloc/screens/note_taking/home_screen.dart';
import '../../blocs/note_bloc/notes_bloc.dart';
import '../../blocs/note_bloc/notes_event.dart';
import '../../data/note_model.dart';
import '../../utils/colors/app_colors.dart';
import 'dialog/widget/save_dialog.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController subTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF252525),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 47.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    borderRadius: BorderRadius.circular(15.r),
                    child: Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                          color: Color(0xFF3B3B3B),
                          borderRadius: BorderRadius.circular(15.r)),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_ios_sharp,
                          size: 24.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(15.r),
                    child: Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                          color: Color(0xFF3B3B3B),
                          borderRadius: BorderRadius.circular(15.r)),
                      child: Center(
                        child: Icon(
                          Icons.remove_red_eye_outlined,
                          size: 24.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 21.w,
                  ),
                  InkWell(
                    onTap: () {
                      if (titleController.text.isNotEmpty &&
                          subTitleController.text.isNotEmpty) {
                        context.read<NotesBloc>().add(
                              CreateNoteEvent(
                                Note(
                                  title: titleController.text,
                                  description: subTitleController.text,
                                  time: DateTime.now(),
                                ),
                              ),
                            );
                      }
                      // context.read<NotesBloc>().add(GetAllNotesEvent());
                      Navigator.pop(context);
                      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                      //   return HomeScreen();
                      // }));
                    },
                    borderRadius: BorderRadius.circular(15.r),
                    child: Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                          color: const Color(0xFF3B3B3B),
                          borderRadius: BorderRadius.circular(15.r)),
                      child: Center(
                        child: Icon(
                          Icons.save_outlined,
                          size: 24.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              TextField(
                textInputAction: TextInputAction.next,
                controller: titleController,
                maxLength: null,
                maxLines: null,
                onChanged: (v) {},
                cursorColor: AppColors.c_CCCCCC,
                style: TextStyle(
                  color: AppColors.c_FFFFFF,
                  fontSize: 35.sp,
                  fontWeight: FontWeight.w600,
                ),
                decoration: InputDecoration(
                    hintText: "Title",
                    hintStyle: TextStyle(
                      color: AppColors.c_9A9A9A,
                      fontSize: 48.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: BorderSide(color: AppColors.c_252525)),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: BorderSide(color: AppColors.c_252525))),
              ),
              TextField(
                textInputAction: TextInputAction.done,
                controller: subTitleController,
                maxLength: null,
                maxLines: null,
                cursorColor: AppColors.c_CCCCCC,
                style: TextStyle(
                  color: AppColors.c_FFFFFF,
                  fontSize: 23.sp,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                    hintText: "Type something...",
                    hintStyle: TextStyle(
                      color: AppColors.c_9A9A9A,
                      fontSize: 23.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: BorderSide(color: AppColors.c_252525)),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: BorderSide(color: AppColors.c_252525))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
