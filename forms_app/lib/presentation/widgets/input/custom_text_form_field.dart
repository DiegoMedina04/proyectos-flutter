import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorText;
  final bool? obscureText;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  const CustomTextFormField({
    super.key,
    this.label,
    this.hint,
    this.errorText,
    this.onFieldSubmitted,
    this.validator,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: colors.primary),
    );
    return TextFormField(
      onChanged: onFieldSubmitted,
      validator: validator,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        enabledBorder: border,
        label: label != null ? Text(label!) : null,
        hintText: hint,
        focusColor: colors.primary,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(color: colors.primary, width: 2),
        ),
        isDense: true, //para que no sea tan denso, sea como mas delagado
        prefixIcon: Icon(
          Icons.supervised_user_circle_outlined,
          color: colors.primary,
        ),
        errorText: errorText, // "Este es el error text",
        errorBorder: border.copyWith(
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        focusedErrorBorder: border.copyWith(
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }
}
