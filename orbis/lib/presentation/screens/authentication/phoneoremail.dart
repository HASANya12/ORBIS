import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orbis/domain/business%20logic/authentication/authcontroller/auth_cubit.dart';
import 'package:orbis/domain/business%20logic/authentication/authway/authway_cubit.dart';
import 'package:orbis/domain/business%20logic/authentication/authway/authway_state.dart';
import 'package:orbis/presentation/widgets/backgroundauth.dart';
import 'package:orbis/presentation/widgets/custombottn.dart';
import 'package:orbis/presentation/widgets/customtextfield.dart';
import 'package:orbis/utils/constant/Responsive.dart';
import 'package:orbis/utils/helper/color.dart';

class Phoneoremail extends StatelessWidget {
  const Phoneoremail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor().babyblue,
      body: Stack(
        children: [
          Backgroundauuth(),
          Positioned(
            top: Responsive(context).hight * 0.2,
            left: Responsive(context).width * 0.05,
            child: BlocBuilder<AuthwayCubit, AuthwayState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Text(
                      "Reset Password",
                      style: TextStyle(
                        fontSize: 36,
                        shadows: [
                          Shadow(
                            color: AppColor().baiscblue2,
                            offset: Offset(0, 4),
                            blurRadius: 15,
                          ),
                        ],
                        fontFamily: "MPLUSRounded1c",
                        fontWeight: FontWeight.w400,
                        color: AppColor().baiscblue2,
                      ),
                    ),
                    Text(
                      " We will send the \n verification code to this\n email: ${state.authway} \n",
                      style: TextStyle(
                        fontFamily: "MPLUSRounded1c",
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                        color: AppColor().blackblue,
                      ),
                    ),
                    Text(
                      state.authway == "Email"
                          ? context.read<AuthCubit>().email.text
                          : context.read<AuthCubit>().phone.text,
                      style: TextStyle(
                        fontFamily: "MPLUSRounded1c",
                        fontWeight: FontWeight.w400,
                        color: AppColor().blackblue,
                      ),
                    ),
                    SizedBox(
                      width: Responsive(context).width * 0.9,
                      child: Customtextfield(
                        typ: state.authway,
                        text: state.authway,
                        suffix: Icon(state.icone),
                        textEditingController:
                            state.authway == "Email"
                                ? context.read<AuthCubit>().email
                                : context.read<AuthCubit>().password,
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return "Pleas enter ${state.authway} !";
                          } else if (!RegExp(
                            state.authway == "Email"
                                ? r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'
                                : r'^\+?[0-9]{10,15}$',
                          ).hasMatch(p0)) {
                            return "the entered ${state.authway} is incorrect !";
                          }
                          return null;
                        },
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        context.read<AuthwayCubit>().changedauthway();
                      },

                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Text(
                          "Singin with  ${state.authway == "Email" ? "phone number" : "Email"}...",

                          style: TextStyle(
                            fontFamily: "MPLUSRounded1c",
                            fontWeight: FontWeight.w400,
                            color: AppColor().blackblue,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: Responsive(context).hight * 0.15),
                    Padding(
                      padding: const EdgeInsets.only(left: 200),
                      child: Custombottn(
                        onTap: () {
                          // context.read<AuthCubit>().sendotp(
                          //       context.read<AuthwayCubit>().authway,
                          //       context.read<AuthCubit>().email.text,
                          //     );
                          Navigator.pushNamed(
                            context,
                            "/VerificationScreen",
                            arguments: "/Phoneoremail",
                          );
                        },
                        height: 43,
                        width: Responsive(context).width * 0.35,
                        text: "Confirm",
                        boxcolor: AppColor().baiscblue.withAlpha(200),
                        textcolor: AppColor().baiscblue,
                      ),
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
