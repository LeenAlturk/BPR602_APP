import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({
    super.key,
    this.controller,
    this.focusNode,
    this.hintText,
    this.leading,
    this.trailing,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
    this.constraints,
    this.elevation,
    this.backgroundColor,
    this.shadowColor,
    this.surfaceTintColor,
    this.overlayColor,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final Widget? leading;
  final Iterable<Widget>? trailing;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final BoxConstraints? constraints;
  final WidgetStateProperty<double?>? elevation;
  final WidgetStateProperty<Color?>? backgroundColor;
  final WidgetStateProperty<Color?>? shadowColor;
  final WidgetStateProperty<Color?>? surfaceTintColor;
  final WidgetStateProperty<Color?>? overlayColor;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: constraints ?? const BoxConstraints(maxHeight: 56),
      child: Material(
        elevation: elevation?.resolve({WidgetState.pressed}) ?? 0,
        color: backgroundColor?.resolve({}) ?? ksmallActionColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.0),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Row(
              children: [
                if (leading != null) leading!,
                Expanded(
                  child: TextField(
                    controller: controller,
                    focusNode: focusNode,
                    onChanged: onChanged,
                    onSubmitted: onSubmitted,
                    style: const TextStyle(color: Colors.white), // Set text color to white
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 2, color: Colors.white),
                      ),
                      hintText: hintText ?? 'Search...',
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey[400]),
                    ),
                  ),
                ),
                if (trailing != null) ...trailing!,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
