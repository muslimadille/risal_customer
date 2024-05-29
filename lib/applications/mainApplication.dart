
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:risal_customer/features/auth/controllers/login_provider.dart';


class MainApplication{
  static final List<SingleChildWidget> applicationList = [

    ChangeNotifierProvider<LoginProvider>(
        create: (context) => LoginProvider()),




  ];
}

