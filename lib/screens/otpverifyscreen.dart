// import 'package:flutter/material.dart';
// import 'package:iconify_flutter/iconify_flutter.dart';
// import 'package:iconify_flutter/icons/material_symbols.dart';
// import 'package:sunstar/common/approutes.dart';
// import 'package:sunstar/common/dio_client.dart';
// import 'package:sunstar/constant/color.dart';
// import 'package:sunstar/constant/font.dart';
// import 'package:sunstar/screens/app_title.dart';

// class OtpverifiedScreen extends StatefulWidget {
//   const OtpverifiedScreen({super.key});

//   @override
//   State<OtpverifiedScreen> createState() => _OtpverifiedScreenState();
// }

// class _OtpverifiedScreenState extends State<OtpverifiedScreen> {
//   @override
//   void initState() {
//     ApiClient.initialize();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;

//     return Scaffold(
//         extendBody: true,
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           backgroundColor: AppColors.backgroundColor,
//         ),
//         body: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const AppTitle(
//                     firstName: "SUN",
//                     secondName: "Star",
//                     firstColor: Colors.black,
//                     fontSize: 40,
//                     secondColor: AppColors.commonColor),
//                 const Iconify(MaterialSymbols.check_circle_outline,
//                     color: AppColors.commonColor, size: 200),
//                 const SizedBox(height: 20),
//                 const Text("Verified",
//                     style: TextStyle(
//                         color: AppColors.commonColor,
//                         fontSize: 40,
//                         fontFamily: AppFonts.gilroy,
//                         fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 30),
//                 SizedBox(
//                   width: width * 0.4,
//                   child: MaterialButton(
//                     height: height * 0.06,
//                     color: AppColors.commonColor,
//                     onPressed: () {
//                       if (mounted) {
//                         Navigator.pushNamed(context, Routes.homePage);
//                       }
//                     },
//                     disabledColor: Colors.grey,
//                     disabledTextColor: Colors.black,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                     child: const Center(
//                         child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           "Continue",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(width: 10),
//                         Iconify(
//                           MaterialSymbols.check_circle_rounded,
//                           color: Colors.white,
//                           size: 18,
//                         )
//                       ],
//                     )),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }
