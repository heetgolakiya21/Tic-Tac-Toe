import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tictactoe/mycolors.dart';
import 'home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    dataLoad();
  }

  Future<void> dataLoad() async {
    await Future.delayed(const Duration(milliseconds: 1500)).then((value) =>
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text("Welcome",
                style: TextStyle(color: Colors.black, fontSize: 15.0)),
            duration: const Duration(milliseconds: 1500),
            backgroundColor: MyColors.grey,
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            margin: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 60.0),
            behavior: SnackBarBehavior.floating,
            dismissDirection: DismissDirection.horizontal)));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const HomePage();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      // Set status bar without any AppBar.
      value: SystemUiOverlayStyle(
        statusBarColor: MyColors.green,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: MyColors.green,
        body: Center(
          child: Image.asset("img/logo.png",
              height: (MediaQuery.of(context).size.width * 35.0) / 100,
              fit: BoxFit.fill,
              filterQuality: FilterQuality.high),
        ),
      ),
    );
  }
}
