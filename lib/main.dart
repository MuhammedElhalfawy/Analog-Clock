import 'package:clock_app/modules/home_screen.dart';
import 'package:clock_app/shared/cubit/cubit.dart';
import 'package:clock_app/shared/cubit/observer.dart';
import 'package:clock_app/shared/cubit/states.dart';
import 'package:clock_app/shared/network/local/cache_helper.dart';
import 'package:clock_app/shared/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
    () async {

      await CacheHelper.init();

      bool? isDark = CacheHelper.getData(key: 'isDark');

      runApp(MyApp(isDark!));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final bool isDark;
  const MyApp(this.isDark, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..changeAppMode(
        fromShared: isDark,
      ),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeData(context),
            darkTheme: darkThemeData(context),
            themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
