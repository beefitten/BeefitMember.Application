// import 'package:beefitmember_application/shared/widgets/textfield.dart';
// import 'package:beefitmember_application/user/bloc/login_bloc.dart';
// import 'package:beefitmember_application/user/bloc/login_state.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class LoginInputWidget extends StatelessWidget {
//   LoginInputWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         inputs,
//         BlocBuilder<LoginBLoc, LoginState>(
//           builder: (context, state) {
//             if (state is LoginErrorState) {
//               return Center(
//                 child: Text(state.message, style: TextStyle(color: Colors.red)));
//             }
//             else if (state is LoginLoadingState) {
//               return Center(
//                 child: CircularProgressIndicator(),
//             );
//           }
//           return Container();
//           },
//         ),
//       ],
//     );
//   }
//
//   final inputs = Column(children: [
//     Container(
//       padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 15),
//           child: Column(
//             children: [
//               TextField(
//                 //controller: password,
//                 autofocus: false,
//                 //obscureText: _obscureText,
//                 decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Color.fromRGBO(247, 247, 252, 1),
//                 hintStyle: TextStyle(color: Color(0xFF666666)),
//                 hintText: 'Email',
//                 contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//                 border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(5.0)),
//                 // suffix: InkWell(
//                 //   onTap: _toggleObscureText,
//                 //   child: Icon(
//                 //       _obscureText ? Icons.visibility : Icons.visibility_off),
//                 // )),
//               ),
//             )],
//           ),
//     ),
//     Container(
//       padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 10),
//         child: Column(
//           children: [
//             TextField(
//               controller: password,
//               autofocus: false,
//               obscureText: _obscureText,
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Color.fromRGBO(247, 247, 252, 1),
//                 hintStyle: TextStyle(color: Color(0xFF666666)),
//                 hintText: 'Password',
//                 contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5.0)),
//                 suffix: InkWell(
//                   onTap: _toggleObscureText,
//                     child: Icon(
//                       _obscureText ? Icons.visibility : Icons.visibility_off),
//                  )),
//               ),
//           )],
//         ),
//       ),
//     ],
//   );
// }
