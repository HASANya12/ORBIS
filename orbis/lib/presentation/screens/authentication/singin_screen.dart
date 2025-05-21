import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orbis/domain/busineslogic/authentication/authcontroller/auth_cubit.dart';
import 'package:orbis/domain/busineslogic/authentication/authcontroller/auth_state.dart';
import 'package:orbis/domain/busineslogic/authentication/authway/authway_cubit.dart';
import 'package:orbis/domain/busineslogic/authentication/authway/authway_state.dart';
import 'package:orbis/domain/busineslogic/authentication/passworsshow/passwordshow_cubit.dart';
import 'package:orbis/domain/busineslogic/authentication/passworsshow/passwordshow_state.dart';
import 'package:orbis/presentation/widgets/custombottn.dart';
import 'package:orbis/presentation/widgets/customtextfield.dart';
import 'package:orbis/presentation/widgets/textwithborder.dart';
import 'package:orbis/utils/constant/Responsive.dart';
import 'package:orbis/utils/helper/color.dart';

class SinginScreen extends StatelessWidget {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  SinginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColor().white,
          body: Stack(
            children: [
              Positioned(
                right: 0,
                top: 90,
                child: SvgPicture.asset(
                  "asset/images/polaris.svg",
                  height: 650,
                  width: 512,
                ),
              ),
              Form(
                key: formkey,
                child: ListView(
                  padding: EdgeInsets.all(10),
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 80),
                      child: Textwithborder(
                        text: "Welcome",
                        fonysize: 56,
                        textcolor: AppColor().baiscblue,
                        outlinecolor: AppColor().outline,
                        withshdaw: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Textwithborder(
                        text: "ORBIS",
                        fonysize: 56,
                        textcolor: AppColor().baiscblue,
                        outlinecolor: AppColor().outline,
                        withshdaw: true,
                      ),
                    ),
                    SizedBox(height: Responsive(context).hight * 0.30),
                    ///////////////////////////////
                    BlocBuilder<AuthwayCubit, AuthwayState>(
                      builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,

                          children: [
                            Customtextfield(
                              typ: state.authway,
                              text: state.authway,

                              suffix: Icon(
                                state.authway == 'Email'
                                    ? Icons.alternate_email_outlined
                                    : Icons.phone,
                                color: AppColor().blackblue,
                              ),
                              textEditingController:
                                  state.authway == "Email"
                                      ? context.read<AuthCubit>().email
                                      : context.read<AuthCubit>().phone,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Pleas enter ${state.authway} !";
                                } else if (!RegExp(
                                  state.authway == "Email"
                                      ? r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'
                                      : r'^\+?[0-9]{10,15}$',
                                ).hasMatch(value)) {
                                  return "the entered ${state.authway} is incorrect !";
                                }
                                return null;
                              },
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
                          ],
                        );
                      },
                    ), ////////////////////////////////////////////////
                    BlocBuilder<PasswordshowCubit, PasswordshowState>(
                      builder: (context, state) {
                        return Customtextfield(
                          typ: "password",
                          showText: state.showpassword,
                          text: "Password",
                          suffix: IconButton(
                            onPressed: () {
                              context.read<PasswordshowCubit>().Showpassword();
                            },
                            icon: Icon(
                              state.passwordshowicone,
                              color: AppColor().blackblue,
                            ),
                          ),
                          textEditingController:
                              context.read<AuthCubit>().password,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Pleas enter password !";
                            } else if (value.length < 8) {
                              return "password can't be less than 8";
                            }
                            return null;
                          },
                        );
                      },
                    ),
                    ////////////////////////////////////////////////////
                    Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Text(
                          "Don't have account ? ",
                          style: TextStyle(
                            fontFamily: "MPLUSRounded1c",
                            fontWeight: FontWeight.w400,
                            color: AppColor().gray,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              "/singupScreen",
                              (route) => true,
                            );
                          },
                          child: Text(
                            "Sing Up ",
                            style: TextStyle(
                              fontFamily: "MPLUSRounded1c",
                              fontWeight: FontWeight.w500,
                              color: AppColor().baiscblue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    ////////////////////////////////////////////////////
                    Padding(
                      padding: const EdgeInsets.only(left: 200),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            "/Phoneoremail",
                            (route) => true,
                          );
                        },
                        child: Text(
                          "Forget Password ?",
                          style: TextStyle(
                            fontFamily: "MPLUSRounded1c",
                            fontWeight: FontWeight.w500,
                            color: AppColor().baiscblue,
                          ),
                        ),
                      ),
                    ),
                    ///////////////////////////////////////////////////
                    Padding(
                      padding: EdgeInsets.only(left: 220, right: 12),
                      child: Custombottn(
                        onTap: () {
                          // Navigator.pushNamedAndRemoveUntil(
                          //   context,
                          //   "/Mainscreen",
                          //   (route) => true,
                          // );
                          if (formkey.currentState!.validate()) {
                            context.read<AuthCubit>().singin(
                              context.read<AuthCubit>().email.text,
                              context.read<AuthCubit>().password.text,
                            );
                          }
                        },
                        // colorfromleft: null,

                        height: 48,
                        width: 163,
                        text: "Login",
                        boxcolor: AppColor().baiscblue,
                        // withsborder: true,
                        withshadow: true,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
