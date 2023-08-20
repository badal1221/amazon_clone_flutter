//import 'dart:js';
import 'package:js/js.dart';
import 'package:amazon_clone_f/common/widgets/bottom_bar.dart';
import 'package:amazon_clone_f/constants/global_variables.dart';
import 'package:amazon_clone_f/features/auth/services/auth_service.dart';
import 'package:amazon_clone_f/providers/user_provider.dart';
import 'package:amazon_clone_f/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/admin/screens/admin_screen.dart';
import 'features/auth/screens/auth_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context)=>UserProvider(),)
    ],child: const MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final AuthService authService=AuthService();
  @override
  void initState(){
    super.initState();
    authService.getUserData(context as BuildContext);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor
        ),
        appBarTheme:const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings)=>generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty?
      Provider.of<UserProvider>(context).user.type=='user'? const BottomBar():const AdminScreen():
      const AuthScreen()
    );
  }
}

