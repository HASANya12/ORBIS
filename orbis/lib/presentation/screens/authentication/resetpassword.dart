import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orbis/domain/business%20logic/authentication/authcontroller/auth_cubit.dart';
import 'package:orbis/domain/business%20logic/authentication/passworsshow/passwordshow_cubit.dart';
import 'package:orbis/domain/business%20logic/authentication/passworsshow/passwordshow_state.dart';
import 'package:orbis/presentation/widgets/backgroundauth.dart';
import 'package:orbis/presentation/widgets/custombottn.dart';
import 'package:orbis/presentation/widgets/customtextfield.dart';
import 'package:orbis/utils/constant/Responsive.dart';
import 'package:orbis/utils/helper/color.dart';

class Resetpassword extends StatefulWidget {
  const Resetpassword({super.key});

  @override
  State<Resetpassword> createState() => _ResetpasswordState();
}

class _ResetpasswordState extends State<Resetpassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor().babyblue,
      body: Stack(
        children: [
          Backgroundauuth(),
          Positioned(
            top: Responsive(context).hight * 0.3,
            left: Responsive(context).width * 0.05,
            child: SizedBox(
              width: Responsive(context).width * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  SizedBox(height: 20),

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
                  BlocBuilder<PasswordshowCubit, PasswordshowState>(
                    builder: (context, state) {
                      return Customtextfield(
                        typ: "password",
                        showText: state.showconfpassword,
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
                  SizedBox(height: Responsive(context).hight * 0.1),
                  Padding(
                    padding: const EdgeInsets.only(left: 200.0),
                    child: Custombottn(
                      withshadow: true,
                      
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          "/singinScreen",
                          (route) => true,
                        );
                      },
                      height: 43,
                      width: Responsive(context).width * 0.35,
                      text: "Confirm",
                      boxcolor: AppColor().baiscblue.withAlpha(190),
                      textcolor: AppColor().baiscblue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
