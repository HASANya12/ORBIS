import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orbis/domain/busineslogic/authentication/authcontroller/auth_cubit.dart';
import 'package:orbis/domain/busineslogic/authentication/authway/authway_cubit.dart';
import 'package:orbis/domain/busineslogic/authentication/authway/authway_state.dart';
import 'package:orbis/domain/busineslogic/authentication/passworsshow/passwordshow_cubit.dart';
import 'package:orbis/domain/busineslogic/authentication/passworsshow/passwordshow_state.dart';
import 'package:orbis/domain/busineslogic/imagrpicker/imagepicker_cubit.dart';
import 'package:orbis/domain/busineslogic/imagrpicker/imagepicker_state.dart';
import 'package:orbis/presentation/widgets/customDialog.dart';

import 'package:orbis/presentation/widgets/custombottn.dart';
import 'package:orbis/presentation/widgets/customtextfield.dart';
import 'package:orbis/presentation/widgets/textwithborder.dart';
import 'package:orbis/utils/helper/color.dart';

class SinupScreen extends StatelessWidget {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  SinupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 10,
            child: SvgPicture.asset("asset/images/Group 33679.svg", width: 270),
          ),
          Positioned(
            left: 100,
            top: 15,
            child: Textwithborder(
              text: "Sing up",
              fonysize: 56,
              textcolor: AppColor().baiscblue,
              outlinecolor: AppColor().outline,
              withshdaw: true,
            ),
          ),
          Positioned(
            left: 240,
            top: 120,
            child: SvgPicture.asset("asset/images/plan.svg"),
          ),
          Positioned(
            right: -12,
            top: 390,
            child: SvgPicture.asset(
              "asset/images/polaris.svg",
              height: 490,
              width: 512,
            ),
          ),
          Form(
            key: formkey,
            child: ListView(
              // padding: EdgeInsets.only(top: 150, left: 20, right: 20),
              children: [
                SizedBox(height: 90),
                /////////////////////////////////////////////////////
                BlocBuilder<ImagepickerCubit, ImageState>(
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,

                          builder:
                              (context) => AlertDialog(
                                content: Customdialog(
                                  title: "choosing image ",
                                  subtitle: "",
                                  bottons: [
                                    Custombottn(
                                      onTap: () {
                                        context
                                            .read<ImagepickerCubit>()
                                            .pickImagefromegallery();
                                        Navigator.pop(context);
                                      },
                                      height: 50,
                                      text: "gallury",
                                      boxcolor: AppColor().baiscblue,
                                      withshadow: false,
                                    ),
                                    Custombottn(
                                      onTap: () {
                                        context
                                            .read<ImagepickerCubit>()
                                            .pickImagefromecamera();
                                        Navigator.pop(context);
                                      },
                                      height: 50,
                                      text: "camera",
                                      boxcolor: AppColor().baiscblue,
                                      withshadow: false,
                                    ),
                                  ],
                                ),
                              ),
                        );
                      },
                      child: CircleAvatar(
                        backgroundColor: AppColor().babyblue,
                        radius: 80,
                        backgroundImage: FileImage(state.imageFile),
                        child: Container(
                          width: 160,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 3,
                              color: AppColor().baiscblue1,
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Customtextfield(
                  typ: "full name",
                  text: "full name",
                  suffix: Icon(Icons.person, color: AppColor().blackblue),
                  textEditingController: TextEditingController(),
                  validator: (p0) {
                    return null;
                  },
                ),
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
                              context.read<AuthCubit>().email,
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
                              "Singin with ${state.authway == "Email" ? "phone number" : "Email"}...",

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
                ), ////
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
                      textEditingController: context.read<AuthCubit>().password,
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
                BlocBuilder<PasswordshowCubit, PasswordshowState>(
                  builder: (context, state) {
                    return Customtextfield(
                      typ: "password",
                      showText: state.showconfpassword,
                      text: "Password",
                      suffix: IconButton(
                        onPressed: () {
                          context.read<PasswordshowCubit>().Showconfpassword();
                        },
                        icon: Icon(
                          state.confpasswordshowicone,
                          color: AppColor().blackblue,
                        ),
                      ),
                      textEditingController:
                          context.read<AuthCubit>().confiermpassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Pleas enter password !";
                        } else if (value.length < 8) {
                          return "password can't be less than 8";
                        } else if (value !=
                            context.read<AuthCubit>().password.text) {
                          return "password not match !";
                        }
                        return null;
                      }, 
                    );
                  },
                ),  

                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Text(
                      "By Loging Or Registering, You Have Agreed To",
                      style: TextStyle(
                        fontFamily: "MPLUSRounded1c",
                        fontWeight: FontWeight.w400,
                        color: AppColor().blackblue,
                      ),
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 13),
                          child: Icon(
                            Icons.check_circle,
                            size: 40,
                            color: AppColor().blackblue,
                          ),
                        ),
                        Text(
                          "The Terms And Conditions \nAnd Privacy Policy.",
                          style: TextStyle(
                            fontFamily: "MPLUSRounded1c",
                            fontWeight: FontWeight.w500,
                            color: AppColor().baiscblue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 60, top: 30, right: 130),
                  child: Custombottn(
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        // context.read<AuthCubit>().singup(
                        //   context.read<AuthCubit>().email.text,
                        //   context.read<AuthCubit>().password.text,
                        // );
                        Navigator.pushNamed(
                          context,
                          "/VerificationScreen",
                          arguments: "/Singup",
                        );
                      } else {
                        return;
                      }
                    },
                    withshadow: true,
                    height: 48,
                    width: 163,
                    text: "Next",
                    boxcolor: AppColor().baiscblue,
                    //  colorfromleft: true, withsborder:false,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
