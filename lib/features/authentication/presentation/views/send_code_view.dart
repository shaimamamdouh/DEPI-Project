
// class SendCodeView extends StatelessWidget {
//   const SendCodeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24.0),
//         child: Column(
//           children: [
//             const SizedBox(height: 30),
//             Align(
//               alignment: Alignment.centerLeft,
//               child: IconButton(
//                 icon: const Icon(
//                   Icons.arrow_back_ios,
//                   color: ColorsData.textColor,
//                 ),
//                 onPressed: () => context.pop(),
//               ),
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       "Recovery Password ",
//                       style: TextStyle(
//                         fontSize: 28,
//                         fontWeight: FontWeight.w500,
//                         color: ColorsData.textColor,
//                       ),
//                     ),
//                     const SizedBox(height: 80),
//                     const Text(
//                       'Check your email inbox. A reset link has been sent to your email address. Follow it to reset your password.',
//                       style: TextStyle(fontSize: 16),
//                     ),
//                     const SizedBox(height: 50),
//                     CustumElevatedBottom(
//                       buttonColor: ColorsData.bottomsColor,
//                       borderColor: ColorsData.bottomsColor,
//                       textColor: Colors.white,
//                       text: "Back to Login",
//                       onTap: () => context.go('/LoginView'),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

