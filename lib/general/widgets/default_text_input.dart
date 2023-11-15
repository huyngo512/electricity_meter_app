import 'package:electricity_meter_app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultTextInput extends StatefulWidget {
  const DefaultTextInput({
    super.key,
    this.label,
    required this.controller,
    this.passwordType = false,
    this.hintText,
    this.fontSize = 14,
    this.fillColor = Colors.white,
    this.validator,
    this.prefixIcon,
    this.keyboardType,
  });

  final String? label;
  final TextEditingController controller;
  final bool passwordType;
  final String? hintText;
  final double fontSize;
  final Color fillColor;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;

  @override
  State<DefaultTextInput> createState() => _DefaultTextInputState();
}

class _DefaultTextInputState extends State<DefaultTextInput> {
  late bool _passwordVisible;

  @override
  void initState() {
    _passwordVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(
            widget.label!,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.grey700,
            ),
          ),
        const SizedBox(height: 4),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.passwordType ? _passwordVisible : false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: widget.keyboardType,
          validator: (value) {
            return widget.validator?.call(value);
          },
          style: const TextStyle(
            fontSize: 14,
            decoration: TextDecoration.none,
            decorationThickness: 0,
          ),
          decoration: InputDecoration(
            hintText: widget.hintText,
            filled: true,
            fillColor: widget.fillColor,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primaryturquoise),
              borderRadius: BorderRadius.circular(8),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(8),
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.passwordType
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                    icon: Icon(_passwordVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
