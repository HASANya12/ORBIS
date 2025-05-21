import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orbis/domain/business%20logic/authentication/authcontroller/auth_cubit.dart';
import 'package:orbis/domain/business%20logic/authentication/authcontroller/auth_state.dart';
import 'package:orbis/presentation/widgets/backgroundauth.dart';
import 'package:orbis/utils/constant/Responsive.dart';
import 'package:orbis/utils/helper/color.dart';
import 'package:pinput/pinput.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
      String previousScreen =ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: AppColor().babyblue,
      body: Stack(
        children: [
          Backgroundauuth(),
          Positioned(
            top: Responsive(context).hight * 0.35,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "verification code  send the code to\n this  email :",
                style: TextStyle(
                  fontFamily: "MPLUSRounded1c",
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: AppColor().blackblue,
                ),
              ),
            ),
          ),

          Positioned(
            top: Responsive(context).hight * 0.45,
            left: Responsive(context).width * 0.1,
            child: BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      context.read<AuthCubit>().email.text,
                      style: TextStyle(
                        fontFamily: "MPLUSRounded1c",
                        fontWeight: FontWeight.w400,
                        color: AppColor().baiscblue,
                        shadows: [
                          Shadow(
                            offset: Offset(0, 4),
                            blurRadius: 10,
                            color: AppColor().baiscblue,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 30),
                    Pinput(
                      onCompleted: (value) {
                      
                        print(previousScreen);
                        if (previousScreen == "/Phoneoremail") {
                          Navigator.pushNamed(context, "/Resetpassword");
                        } else if (previousScreen == "/Singup") {
                          Navigator.pushNamed(context, "/LoctionScreen");
                        }

                        print("$value{{{{{{{{{{{{{{{{{{{}}}}}}}}}}}}}}}}}}}");
                      },

                      length: 5,  
                      controller: context.read<AuthCubit>().otp,

                      defaultPinTheme: PinTheme(
                        width: 56,
                        height: 56,
                        textStyle: TextStyle(
                          fontSize: 22,
                          color: AppColor().blackblue,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: AppColor().baiscblue,
                              blurRadius: 4,
                              offset: Offset(0, 4),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(23),
                          border: Border.all(color: AppColor().baiscblue),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Wrap(
                      children: [
                        Text(
                          "Don't Receive the code ? ",
                          style: TextStyle(
                            fontFamily: "MPLUSRounded1c",
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: AppColor().blackblue,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Received ",
                            style: TextStyle(
                              fontFamily: "MPLUSRounded1c",
                              fontWeight: FontWeight.w400,
                              fontSize: 19,
                              color: AppColor().baiscblue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
