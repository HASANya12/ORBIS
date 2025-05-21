import 'package:flutter/material.dart';
import 'package:orbis/utils/helper/color.dart';

class Customtextfield extends StatelessWidget {
  String typ;
  String text;
  Widget suffix;
  TextEditingController textEditingController;
  String? Function(String?)? validator;
  bool showText;
  Customtextfield({
    super.key,
    required this.typ,
    required this.text,
    required this.suffix,
    required this.textEditingController,
    required this.validator,
    this.showText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              text,
              style: TextStyle(
                fontFamily: "MPLUSRounded1c",
                color: AppColor().blackblue,
              ),
            ),
          ),
          typ != "Phone"
              ?
              //////////////////////////text field//////////////////////
              TextFormField(
                cursorColor: AppColor().blackblue,
                obscureText: showText,
                controller: textEditingController,
                validator: validator,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  counterStyle: TextStyle(color: AppColor().blackblue),
                  filled: true,
                  fillColor: Colors.white54,
                  hoverColor: AppColor().blackblue,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: AppColor().blackblue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      width: 2,
                      color: AppColor().baiscblue2,
                    ),
                  ),
                  suffixIcon: suffix,
                ),
              )
              //////////////////////////phone field//////////////////////
              : SizedBox(
                child:  IntlPhoneField(
                  cursorColor: AppColor().blackblue,
                  obscureText: showText,
                  keyboardType: TextInputType.phone,
                  controller: textEditingController,
                  decoration: InputDecoration(
                    counterStyle: TextStyle(color: AppColor().blackblue),
                    filled: true,
                    fillColor: Colors.white54,
                    hoverColor: AppColor().blackblue,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: AppColor().blackblue),
                    ),
                    suffixIcon: suffix,
                  ),
                  initialCountryCode: 'SY',
                  onChanged: (phone) {
                    print(phone.completeNumber);
                  },
                  onCountryChanged: (country) {
                    print('Country changed to: ${country.name}');
                  },
                ),
              ),
        ],
      ),
    );
  }
}
