import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:noteapp/screens/home.dart';
import 'package:noteapp/screens/login_screen.dart';
import 'package:provider/provider.dart';

import 'models/user_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MyApp(),
    ),
  );
}
// void main(){
//   runApp(const MyApp());
// }

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? login = false;
  helper() async {
    await Provider.of<UserProvider>(context, listen: false)
        .getDetailsFromDevice();
    var x = Provider.of<UserProvider>(context, listen: false).isLoggedIn;
    if (x != null) {
      setState(() {
        login = x;
      });
    }
  }

  @override
  void didChangeDependencies() async {
    await helper();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Note Making App',
      home: login == true ? const Home() : const Loginscreen(),
    );
  }
}
