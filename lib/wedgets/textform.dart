
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:flutter/material.dart';

class InputTextForm extends StatelessWidget {
  final FormValidator formValidator;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final bool showText;
  final VoidCallback? suffixPressed;
  final Function? onChange;
  final String? titleItem;
  final String? hintText;
  final String? labelText; // New parameter for label text

  final IconData? iconData;
  final IconData? prefIcon;
  final Color? color;
  final Color? hintColors;
  final Color? fieldColor;
  final Color? textFoeldColor;
  final Color? prefIconColor;
  final Color? suffIconColor;
  final TextInputType? textInputType;

  final String? errorMessage;

  final bool? paddingHorezontal;
  final double? raduse;
  final double? horizentalPadding;

  // New properties for floating label style
  final Color? floatingLabelColor;
  final double? floatingLabelFontSize;

  const InputTextForm({
    super.key,
    required this.formValidator,
    this.suffixIcon,
    this.prefixIcon,
    this.suffixPressed,
    this.titleItem,
    this.iconData,
    this.prefIcon,
    this.color = Colors.white,
    this.errorMessage,
    this.hintText,
    this.labelText, // Added labelText
    this.hintColors = const Color.fromARGB(255, 151, 146, 128),
    this.fieldColor = ksmallActionColor,
    this.textFoeldColor = Colors.white,
    this.prefIconColor = Ktext,
    this.paddingHorezontal = true,
    this.suffIconColor = Ktext,
    this.showText = true,
    this.textInputType = TextInputType.text,
    this.onChange,
    this.raduse = 60,
    this.horizentalPadding = 0,
    this.floatingLabelColor,
    this.floatingLabelFontSize,
  });

  Widget? _getSuffixIcon() {
    if (suffixIcon == null) return null;
    return IconButton(
      onPressed: suffixPressed,
      icon: Icon(
        suffixIcon,
        color: suffIconColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: paddingHorezontal! ? 1 : 0,
          vertical: mediaQuery.height * 0.0065),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleItem != null
              ? Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 10, horizontal: horizentalPadding!),
                  child: Text(
                    titleItem!,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: mediaQuery.height * 0.018,
                        color: color),
                  ),
                )
              : const SizedBox.shrink(),
          SizedBox(
            height: mediaQuery.height * 0.08,
            child: Padding(
              padding: Sizer.textFiledPadding,
              child: Center(
                child: TextFormField(
                  
                  keyboardType: textInputType,
                  controller: formValidator.controller,
                  validator: formValidator.validator,
                  style: TextStyle(color: textFoeldColor, fontSize: 15.sp),
                  onChanged: (value) => onChange!(),
                  decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(
                      color: floatingLabelColor ?? Colors.white,
                      fontSize: floatingLabelFontSize ?? 25,
                    ),
                    suffixIcon: _getSuffixIcon(),
                    isCollapsed: true,
                    filled: true,
                    labelText: labelText, // Use labelText here
                    hintText: hintText,
                    errorText: errorMessage,
                    hintStyle: TextStyle(color: hintColors, height: 1.5.sp , fontSize: 11.sp),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 17),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 2,
                          color: border,
                        ),
                        borderRadius: BorderRadius.circular(raduse!)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 2,
                          color:border,
                        ),
                        borderRadius: BorderRadius.circular(raduse!)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(raduse!),
                        borderSide: const BorderSide(
                            color: border, width: 2)),
                    fillColor: fieldColor,
                    prefixIcon: prefIcon != null
                        ? Icon(
                            prefIcon,
                            color: prefIconColor,
                          )
                        : null,
                  ),
                  obscureText: !showText,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class FormValidator {
//   String? hint;
//   RegExp? regExp;
//   String? errorMessage;
//   final TextEditingController controller = TextEditingController();

//   FormValidator({this.hint, this.regExp, this.errorMessage});

//   String? validator(String? inputText) {
    
//     return regExp!.hasMatch(inputText!) ? null : errorMessage;
//   }


// }
class FormValidator {
  String? hint;
  RegExp? regExp;
  String? errorMessage;
  final TextEditingController controller = TextEditingController();

  FormValidator({this.hint, this.regExp, this.errorMessage});

  String? validator(String? inputText) {
    if (inputText == null) return errorMessage;

  
    final isEmail = hint?.toLowerCase() == 'email';
    final cleanedInput = isEmail ? inputText.trim() : inputText;

    return regExp!.hasMatch(cleanedInput) ? null : errorMessage;
  }
}

