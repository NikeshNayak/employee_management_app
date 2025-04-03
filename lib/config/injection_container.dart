import 'package:employee_management_app/features/add_employee_details/data/data_sources/local/add_employee_detail_local_service.dart';
import 'package:employee_management_app/features/add_employee_details/data/repository/add_employee_details_repository_impl.dart';
import 'package:employee_management_app/features/add_employee_details/domain/repository/add_employee_details_repository.dart';
import 'package:employee_management_app/features/add_employee_details/domain/usecases/add_employee_details_usecase.dart';
import 'package:employee_management_app/features/add_employee_details/presentation/bloc/add_employee_details/add_employee_details_bloc.dart';
import 'package:employee_management_app/features/employee_list/data/data_sources/local/employee_list_local_service.dart';
import 'package:employee_management_app/features/employee_list/data/repository/employee_list_repository_impl.dart';
import 'package:employee_management_app/features/employee_list/domain/repository/employee_list_repository.dart';
import 'package:employee_management_app/features/employee_list/domain/usecases/employee_list_usecase.dart';
import 'package:employee_management_app/features/employee_list/presentation/bloc/get_employee_list/get_employee_list_bloc.dart';
import 'package:employee_management_app/features/update_employee/domain/repository/update_employee_details_repository.dart';
import 'package:employee_management_app/features/update_employee/domain/usecases/update_employee_details_usecase.dart';
import 'package:employee_management_app/features/update_employee/presentation/bloc/update_employee_details/update_employee_details_bloc.dart';
import 'package:get_it/get_it.dart';

import '../core/database/database_manager.dart';
import '../features/update_employee/data/data_sources/local/update_employee_detail_local_service.dart';
import '../features/update_employee/data/repository/update_employee_details_repository_impl.dart';

GetIt sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Initialize Database
  await DatabaseManager.init();
  //Dependencies
  sl.registerSingleton<AddEmployeeDetailsLocalService>(AddEmployeeDetailsLocalService());
  sl.registerSingleton<UpdateEmployeeDetailsLocalService>(UpdateEmployeeDetailsLocalService());
  sl.registerSingleton<EmployeeListLocalService>(EmployeeListLocalService());

  //Repositories
  sl.registerSingleton<AddEmployeeDetailsRepository>(AddEmployeeDetailsRepositoryImpl(sl()));
  sl.registerSingleton<UpdateEmployeeDetailsRepository>(UpdateEmployeeDetailsRepositoryImpl(sl()));
  sl.registerSingleton<EmployeeListRepository>(EmployeeListRepositoryImpl(sl()));

  //UseCases
  sl.registerSingleton<AddEmployeeDetailsUseCase>(AddEmployeeDetailsUseCase(sl()));
  sl.registerSingleton<UpdateEmployeeDetailsUseCase>(UpdateEmployeeDetailsUseCase(sl()));
  sl.registerSingleton<EmployeeListUseCase>(EmployeeListUseCase(sl()));

  //BLoCs
  sl.registerFactory(() => AddEmployeeDetailsBloc(sl()));
  sl.registerFactory(() => UpdateEmployeeDetailsBloc(sl()));
  sl.registerFactory(() => GetEmployeeListBloc(sl()));
}
