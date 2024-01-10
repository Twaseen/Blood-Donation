// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class OTPScreen extends StatelessWidget {
//   const OTPScreen ({Key : key}) :super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var OTP;
//     return Scaffold(
//       body: Container(
//         padding: const EdgeInsets.all(tDefaultSize),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               tOTPTitle,
//               style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 80.0),
//             ),
//             Text(tOTPSubTitle.toUpperCase(), style: Theme.of(context).textTheme.headline6),
//             const SizedBox(height: 40.0),
//             const Text("$OTPMessage twaseen47@gmail.com", textAlign: TextAlign.center),
//             const SizedBox(height: 20.0),
//             OTPTextField(
//               mainAxisAlignment : MainAxisAlignment.center,
//               numberOfFields : 6,
//               fillColor : Colors.black.withOpacity(0.1),
//               filled: true
//             )
//           ],
//         ),
//       ),
//     )
//   }
// }