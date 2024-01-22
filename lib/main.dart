
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled4/UI/LogIn.dart';
import 'package:untitled4/UI/home.dart';
import 'package:untitled4/UI/onBoarding.dart';
import 'package:untitled4/firebase_options.dart';
import 'package:untitled4/local/locale.dart';
import 'local/locale_controller.dart';
import 'model/food_api_model.dart';
late SharedPreferences sharedPref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref=await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    LocaleController controller=Get.put(LocaleController());
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      locale:controller.intialLang,
      translations: MyLocale(),
      home: UserLogin(),
    );
  }
}

class UserLogin extends StatefulWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  @override
  void initState() {
    super.initState();

    loadData();
    setState(() {});
  }

  Future<void> loadData() async {
    await fetchProducts();
    await fetchMegaSale();
    setState(() {});
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _checkUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return snapshot.data ?? OnBoarding();
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Future<Widget> _checkUser() async {
    SharedPreferences shared = await SharedPreferences.getInstance();

    String? user = shared.getString('uId');

    if (user == null) {
      return OnBoarding();
    } else if (user == '') {
      return LogIn();
    } else {
      return Home();
    }
  }
}
