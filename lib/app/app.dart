import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../blocs/calculator/calculator_cubit.dart';
import '../blocs/cards/card_bloc.dart';
import '../blocs/currency/currency_bloc.dart';
import '../blocs/currency/currency_event.dart';
import '../blocs/note_bloc/notes_bloc.dart';
import '../blocs/note_bloc/notes_event.dart';
import '../data/repositories/currency_repository.dart';
import '../screens/card/card_screen.dart';
import '../screens/note_taking/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => CurrencyRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<NotesBloc>(
            create: (context) => NotesBloc()..add(GetAllNotesEvent()),
          ),
        ],
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, child) {
        ScreenUtil.init(context);
        return MaterialApp(
          // initialRoute: RouteNames.helloScreen,

          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: false),
          home: child,
        );
      },
      child: const HomeScreen(),
    );
  }
}
