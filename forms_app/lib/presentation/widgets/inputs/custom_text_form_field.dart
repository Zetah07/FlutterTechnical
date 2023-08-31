import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final String? label;
  final String? hint;
  final String? errorMessage;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool obscureText;


  const CustomTextField({
    super.key,
    this.label,
    this.hint,
    this.errorMessage,
    this.onChanged,
    this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(40.0),
    );
    

    return TextFormField(

      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith( borderSide: BorderSide(color: colors.primary, width: 2) ),
        errorBorder: border.copyWith( borderSide: BorderSide(color: Colors.red.shade800, width: 2) ),
        focusedErrorBorder: border.copyWith( borderSide: BorderSide(color: Colors.red.shade800, width: 2) ),

        isDense: true,
        label: label != null ? Text(label!) : null,
        hintText: hint,
        errorText: errorMessage,
        prefixIcon: const Icon(Icons.person),

      ),
    );
  }
}