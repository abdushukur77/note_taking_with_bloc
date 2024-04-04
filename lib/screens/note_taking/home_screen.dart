import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_taking_with_bloc/blocs/note_bloc/notes_bloc.dart';
import 'package:note_taking_with_bloc/blocs/note_bloc/notes_event.dart';
import 'package:note_taking_with_bloc/blocs/note_bloc/notes_state.dart';
import 'package:note_taking_with_bloc/screens/note_taking/add_screen.dart';

import '../../data/note_model.dart';
import '../../utils/images/app_images.dart';
import '../../utils/styles/app_text_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //context.read<CurrencyRepository>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Color(0xFF252525), title: const Text("Notes")),
      body: Column(
        children: [
          BlocBuilder<NotesBloc, NotesState>(
            buildWhen: (previous, current) {
              return true;
            },
            builder: (context, state) {
              if (state is NotesLoadingState) {
                return CircularProgressIndicator();
              }
              if (state is NotesErrorState) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.message),
                  ],
                );
              } else if (state is NotesLoadedState) {
                return Expanded(
                  child: ListView(
                    children: List.generate(state.notes.length, (index) {
                      Note noteModel = state.notes[index];
                      return ListTile(
                        onTap: () {


                        },
                        title:
                            Text("${noteModel.title} "),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(noteModel.description.toString()),
                            Text(noteModel.time.toString()),
                          ],
                        ),

                        trailing: IconButton(
                          onPressed: () {
                            context
                                .read<NotesBloc>()
                                .add(DeleteNoteEvent(noteModel.id!));
                          },
                          icon: Icon(Icons.delete),
                        ),
                      );
                    }),
                  ),
                );
              } else if (state is NotesLoadedState) {
                if (state.notes.isEmpty) {
                  Column(
                    children: [
                      Image.asset(AppImages.note),
                      Text(
                        "Create your first note !",
                        style: AppTextStyle.interRegular.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 18.sp),
                      ),
                    ],
                  );
                }
              }
              return const SizedBox();
            },
          ),
          // Container(
          //   height: 300,
          //   color: Colors.red,
          //   width: double.infinity,
          // ),
          BlocListener<NotesBloc, NotesState>(
              listener: (context, state) {
                if (state is NotesLoadedState) {
                  if (state.notes.isEmpty) {}
                }

                if (state is DeleteNoteState) {
                  Future.microtask(
                    () => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        duration: Duration(seconds: 1),
                        content: Text("DELETED"),
                      ),
                    ),
                  );
                }
              },
              child: SizedBox())
        ],
      ),
      floatingActionButton: FloatingActionButton(
        materialTapTargetSize: MaterialTapTargetSize.padded,
        backgroundColor: const Color(0xFF252525),
        elevation: 20,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddScreen(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          size: 40,
          weight: 800,
        ),
      ),
    );
  }
}
