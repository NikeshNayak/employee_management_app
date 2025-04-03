import 'package:employee_management_app/features/add_employee_details/presentation/view/pages/add_employee_details_page.dart';
import 'package:employee_management_app/features/employee_list/presentation/view/pages/employee_list_page.dart';
import 'package:employee_management_app/features/update_employee/presentation/view/pages/update_employee_details_page.dart';
import 'package:flutter/material.dart';

import '../../config/routes/routes.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.employeeList:
        return MaterialPageRoute(settings: settings, builder: (context) => const EmployeeListPage());
      case Routes.addEmployee:
        return MaterialPageRoute(settings: settings, builder: (context) => const AddEmployeeDetailsPage());
      case Routes.updateEmployee:
        return MaterialPageRoute(settings: settings, builder: (context) => const UpdateEmployeeDetailsPage());
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
