import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:otpless_flutter/otpless_flutter.dart';
import 'package:sunstar/common/approutes.dart';
import 'package:sunstar/constant/color.dart';
import 'package:sunstar/constant/font.dart';
import 'package:sunstar/constant/prefs.dart';
import 'package:sunstar/screens/app_title.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _otplessFlutterPlugin = Otpless();
  var arg = {
    'appId': "NRDHMQVGGOFFEINBFRIH",
    'crossButtonHidden': true,
    'cid': "BL3OONO5FT3BM4DUZHM77SB2NPL2Q6N2",
  };
  var message = "";
  String fcmToken = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var loggedIn = await SharedPrefsHelper.getBool('loggedIn');
      if (loggedIn == true && mounted) {
        Navigator.pushNamed(context, '/home');
        return;
      } else {
        await startOtpLess();
      }
    });
  }

  Future<void> startOtpLess() async {
    await _otplessFlutterPlugin.openLoginPage(
      (result) async {
        if (result['data'] != null) {
          String phoneNumber = result['data']['identities'][0]['identityValue']
              .toString()
              .substring(2);
          SharedPrefsHelper.setString('phone', phoneNumber);
        } else {
          message = result['errorMessage'];
          if (context.mounted && message == "user cancelled") {
            Navigator.pushNamed(context, '/');
          }
        }
      },
      arg,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.backgroundColor,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AppTitle(
                    firstName: "Sun",
                    secondName: "Star",
                    firstColor: Colors.black,
                    fontSize: 40,
                    secondColor: AppColors.commonColor),
                const Iconify(MaterialSymbols.check_circle_outline,
                    color: AppColors.commonColor, size: 200),
                const SizedBox(height: 20),
                const Text("Verified",
                    style: TextStyle(
                        color: AppColors.commonColor,
                        fontSize: 40,
                        fontFamily: AppFonts.gilroy,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 30),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: MaterialButton(
                    height: MediaQuery.of(context).size.height * 0.06,
                    color: AppColors.commonColor,
                    onPressed: () {
                      if (mounted) {
                        Navigator.pushNamed(context, Routes.homePage);
                      }
                    },
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Continue",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        Iconify(
                          MaterialSymbols.check_circle_rounded,
                          color: Colors.white,
                          size: 18,
                        )
                      ],
                    )),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
