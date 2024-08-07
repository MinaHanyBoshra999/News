// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// ';

// class PhoneNumberFormField extends StatelessWidget {
//   PhoneNumberFormField({super.key});


//   // final GlobalKey<FormState> _phoneFormKey=GlobalKey();
//   // String phoneNumber = '';
//   // TextEditingController mycontroller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<PhoneAuthCubit,PhoneAuthLoginState>(

//       builder: (context, state) {

//         if(state is PhoneLoginLoading){
//           return const Center(child: CircularProgressIndicator());
//         }
//         if(state is PhoneLoginFailure){
//           return Center(child: Text(state.errMessage.toString()));
//         }

//         return Column(
//           children: [
//             Row(
//               children: [
//                 // Flag emoji
//                 Container(
//                   padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 6),
//                   decoration: BoxDecoration(
//                       shape: BoxShape.rectangle,
//                       borderRadius: BorderRadius.circular(6),
//                       border: Border.all(
//                           strokeAlign: 1, color: const Color(0xffDCDCDC))),
//                   child: Text('${generateCountryCode()} +20',
//                       style: const TextStyle(fontSize: 18, letterSpacing: 2)),
//                 ),
//                 const SizedBox(
//                   width: 16,
//                 ),
//                 // PhoneNumber TextField
//                 Expanded(
//                   child: TextField(
//                    // controller: mycontroller,
//                     cursorColor: Colors.black,
//                     style: const TextStyle(fontSize: 18, letterSpacing: 2),
//                     keyboardType: TextInputType.phone,
//                     decoration: InputDecoration(
//                       focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(6),
//                           borderSide: const BorderSide(
//                             color: Color(0Xff0666EB),
//                           )),
//                       enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(6),
//                           borderSide: const BorderSide(color: Color(0xffDCDCDC))),
//                     ),
//                     // onTap: () {
//                     //
//                     // },
//                     onSubmitted: (value) {
//                       // this.phoneNumber = mycontroller.value.text;
//                       BlocProvider.of<PhoneAuthCubit>(context).phoneNumber=value.toString();
//                        print('hoooooooooooooooo ${value}');
//                     },
//                   ),
//                 ),
//                 // Expanded(
//                 //   child: Form(
//                 //     key: BlocProvider.of<PhoneAuthCubit>(context).phoneFormKey,
//                 //     child: TextFormField(
//                 //       cursorColor: Colors.black,
//                 //       style: const TextStyle(fontSize: 18,letterSpacing: 2),
//                 //       keyboardType: TextInputType.phone,
//                 //       decoration: InputDecoration(
//                 //         focusedBorder: OutlineInputBorder(
//                 //             borderRadius: BorderRadius.circular(6),
//                 //             borderSide: const BorderSide(
//                 //               color: Color(0Xff0666EB),
//                 //             )
//                 //         ),
//                 //         enabledBorder: OutlineInputBorder(
//                 //             borderRadius: BorderRadius.circular(6),
//                 //             borderSide:const  BorderSide(
//                 //                 color: Color(0xffDCDCDC)
//                 //             )
//                 //         ),
//                 //       ),
//                 //       validator: (value) {
//                 //         if(value!.isEmpty){
//                 //           return 'Please enter your phone number!';
//                 //         }
//                 //         if(value.length < 11){
//                 //           return 'Too short for a phone number!';
//                 //         }
//                 //         return 'Bad Format ';
//                 //       },
//                 //       onSaved: (newValue) {
//                 //         print('new valueuuuuuuuuuuuuuu${newValue}');
//                 //         BlocProvider.of<PhoneAuthCubit>(context).phoneNumber=newValue!;
//                 //
//                 //       },
//                 //       // onTap: () {
//                 //       //   print(phoneNumber);
//                 //       // },
//                 //
//                 //
//                 //     ),
//                 //
//                 //   ),
//                 // ),
//               ],
//             ),
//             const SizedBox(height: 111),
//             NextButton(text: 'Next',onPressed: () {
//               BlocProvider.of<PhoneAuthCubit>(context).sendOTPCode();
//             },),

//           ],
//         );



//       },
//       listener: (context, state) {
//         if(state is PhoneLoginSuccess ){
//           GoRouter.of(context).push(AppRouter.kOtpScreen);
//         }

//       },

//     );
//   }
// }

// String generateCountryCode() {
//   String countryCode = 'eg';
//   String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
//       (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
//   print(flag);
//   return flag;
// }





