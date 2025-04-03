import 'package:employee_management_app/features/add_employee_details/presentation/bloc/add_employee_details/add_employee_details_bloc.dart';
import 'package:employee_management_app/features/employee_list/presentation/bloc/get_employee_list/get_employee_list_bloc.dart';
import 'package:employee_management_app/features/update_employee/presentation/bloc/update_employee_details/update_employee_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/bloc_observer.dart';
import 'config/injection_container.dart';
import 'config/routes/app_router.dart';
import 'config/theme/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await initializeDependencies();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AddEmployeeDetailsBloc>(create: (context) => sl()),
        BlocProvider<UpdateEmployeeDetailsBloc>(create: (context) => sl()),
        BlocProvider<GetEmployeeListBloc>(create: (context) => sl()),
      ],
      child: ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(428, 926),
        child: MaterialApp(
          title: 'Employee App',
          debugShowCheckedModeBanner: false,
          theme: theme(),
          onGenerateRoute: _appRouter.onGenerateRoute,
        ),
      ),
    );
  }
}
