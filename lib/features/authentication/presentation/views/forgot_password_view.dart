

// class ForgotPasswordView extends StatefulWidget {
//   const ForgotPasswordView({super.key});

//   @override
//   State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
// }

// class _ForgotPasswordViewState extends State<ForgotPasswordView> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   String? email;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24.0),
//         child: BlocListener<ResetPasswordCubit, ResetPasswordState>(
//           listener: (context, state) {
//             if (state is ResetPasswordSuccess) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text('Reset email sent!')),
//               );
//               context.push('/SendCodeView');
//             } else if (state is ResetPasswordFailure) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text(state.error)),
//               );
//             }
//           },
//           child: Column(
//             children: [
//               const SizedBox(height: 30),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: IconButton(
//                   icon: const Icon(
//                     Icons.arrow_back_ios,
//                     color: ColorsData.textColor,
//                   ),
//                   onPressed: () => context.pop(),
//                 ),
//               ),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           "Forgot Password? ",
//                           style: TextStyle(
//                             fontSize: 28,
//                             fontWeight: FontWeight.w500,
//                             color: ColorsData.textColor,
//                           ),
//                         ),
//                         SizedBox(height: 120),
//                         const Text(
//                           "Forgot your password? No problem. Just let us know your email address and we will send you a code to renew your password.",
//                         ),
//                         SizedBox(height: 10),
//                         // ignore: missing_required_param
//                         CustomTextField(
//                           hintText: 'Email',
//                           onSaved: (value) => email = value,
//                           validator: (value) => value == null || value.isEmpty ? 'Please enter email' : null,
//                         ),
//                         SizedBox(height: 50),
//                         CustumElevatedBottom(
//                           buttonColor: ColorsData.bottomsColor,
//                           borderColor: ColorsData.bottomsColor,
//                           textColor: Colors.white,
//                           text: "Send Code",
//                           onTap: () {
//                             if (_formKey.currentState!.validate()) {
//                               _formKey.currentState!.save();
//                               context.read<ResetPasswordCubit>().sendResetCode(email!);
//                             }
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }