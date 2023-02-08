import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:owwn_coding_challenge/core/constants/colors.dart';
import 'package:owwn_coding_challenge/ui/widgets/utils.dart';

// Default textInputAction is next. For last field use 'done'.
class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.label,
    this.isRequired = false,
    this.isEnabled = true,
    this.isLocationField = false,
    this.onChanged,
    this.hintText,
    this.initialValue = '',
    this.validator,
    this.obscureText = false,
    this.maxLength,
    this.textInputAction = TextInputAction.next,
    this.isNumberField = false,
    this.borderRadius = 12,
  });
  final String label;
  final bool obscureText;
  final bool isRequired;
  final String? hintText;
  final String? Function(String?)? validator;
  final int? maxLength;
  final double borderRadius;
  final String initialValue;
  final bool isEnabled;
  final bool isNumberField;
  final bool isLocationField;
  final TextInputAction textInputAction;
  final Function(String s)? onChanged;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late TextEditingController _textEditingController;
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.initialValue);
  }

  @override
  void didChangeDependencies() {
    _textEditingController.text = widget.initialValue;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.isEnabled,
      controller: _textEditingController,
      onChanged: widget.onChanged,
      obscureText: widget.obscureText,
      style: !widget.isEnabled
          ? Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: const Color(0xffC8C8C8),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              )
          : null,
      onSaved: (s) {
        if (widget.onChanged != null) widget.onChanged!(s ?? '');
      },
      validator: (s) {
        if (widget.isRequired && (s != null && s.isEmpty)) {
          return "Required Field";
        }
        if (widget.validator != null && s != null && s.isNotEmpty) {
          return widget.validator!(s);
        }
        return null;
      },
      maxLength: widget.maxLength,
      inputFormatters: widget.isNumberField
          ? [
              FilteringTextInputFormatter.allow(RegExp('[0-9]')),
            ]
          : [],
      keyboardType: widget.isNumberField ? TextInputType.number : null,
      textInputAction: widget.textInputAction,
      decoration: InputDecoration(
        hoverColor: AppColors.tileBg,
        fillColor: AppColors.tileBg,
        focusColor: AppColors.tileBg,
        hintText: widget.hintText ??
            (widget.isRequired ? '${widget.label} *' : widget.label),
        hintStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: AppColors.subtitleText),
        suffixIcon: widget.isLocationField
            ? const Icon(Icons.location_pin, color: AppColors.tileBg)
            : sized(w: 10),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: const BorderSide(
            color: AppColors.tileBg,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: const BorderSide(
            color: AppColors.white,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: const BorderSide(
            color: AppColors.tileBg,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 8,
        ),
      ),
    );
  }
}
