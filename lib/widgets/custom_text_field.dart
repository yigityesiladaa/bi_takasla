import 'package:bitakasla/config/theme/theme_extensions.dart';
import 'package:bitakasla/core/base/base_stateless_widget.dart';
import 'package:bitakasla/core/constants/app_colors.dart';
import 'package:bitakasla/core/utils/validators.dart';
import 'package:flutter/services.dart';

class CustomTextField extends BaseStatelessWidget {
  final bool isMoney;
  final bool isRate;
  final bool? isPrefixIcon;
  final TextStyle? style;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextEditingController? textEditingController;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final InputBorder? border;
  final InputBorder? disabledBorder;
  final InputBorder? errorBorder;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? focusedErrorBorder;
  final bool? filled;
  final Color? fillColor;
  final String? counterText;
  final bool? isDense;
  final TextStyle? hintStyle;
  final String? hintText;
  final EdgeInsetsGeometry? customPadding;
  final String? label;
  final void Function(String)? onChanged;
  final IconData? suffixIcon;
  final void Function()? onTapSuffixIcon;
  final int? contentVerticalPadding;
  final int? contentHorizontalPadding;
  final int? maxLines;
  const CustomTextField({
    super.key,
    this.style,
    this.validator,
    this.keyboardType,
    this.suffixIcon,
    this.onTapSuffixIcon,
    this.contentVerticalPadding,
    this.contentHorizontalPadding,
    this.textEditingController,
    this.maxLength,
    this.inputFormatters,
    this.border,
    this.maxLines = 1,
    this.disabledBorder,
    this.errorBorder,
    this.enabledBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.filled,
    this.onChanged,
    this.fillColor,
    this.counterText,
    this.isDense,
    this.hintStyle,
    this.hintText,
    this.customPadding,
    this.isMoney = false,
    this.isRate = false,
    this.isPrefixIcon,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: customPadding ?? padding.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            style: style ?? theme.primaryTextTheme.bodyMedium!.medium,
            validator: validator ?? Validators.formFieldValidation,
            keyboardType:
                keyboardType ?? const TextInputType.numberWithOptions(decimal: true),
            controller: textEditingController,
            maxLength: maxLength,
            maxLines: maxLines,
            onChanged: onChanged,
            cursorColor: AppColors.cardBlueColor,
            decoration: _inputDecoration(
              border: border,
              enabledBorder: enabledBorder,
              disabledBorder: disabledBorder,
              focusedBorder: focusedBorder,
              errorBorder: errorBorder,
              focusedErrorBorder: focusedErrorBorder,
              counterText: counterText,
              fillColor: fillColor,
              filled: filled,
              hintStyle: hintStyle,
              hintText: hintText,
              isDense: isDense,
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _inputDecoration({
    InputBorder? border,
    InputBorder? disabledBorder,
    InputBorder? errorBorder,
    InputBorder? enabledBorder,
    InputBorder? focusedBorder,
    InputBorder? focusedErrorBorder,
    bool? filled,
    Color? fillColor,
    String? counterText,
    bool? isDense,
    TextStyle? hintStyle,
    String? hintText,
  }) {
    return InputDecoration(
      contentPadding: padding.symmetric(horizontal: contentHorizontalPadding ?? 40, vertical: contentVerticalPadding ?? 20),
      suffixIcon: IconButton(onPressed: onTapSuffixIcon, icon: Icon(suffixIcon)),
      label: label != null ? Text(label!, style: style,) : const SizedBox(),
      border: border ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(sizeConfig.borderRadiusValue),
            borderSide: const BorderSide(
              color: AppColors.darkGray,
              width: .2,
            ),
          ),
      disabledBorder: disabledBorder ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(sizeConfig.borderRadiusValue),
            borderSide: const BorderSide(
              color: AppColors.darkGray,
              width: .2,
            ),
          ),
      errorBorder: errorBorder ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(sizeConfig.borderRadiusValue),
            borderSide: const BorderSide(
              color: AppColors.darkGray,
              width: .2,
            ),
          ),
      enabledBorder: enabledBorder ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(sizeConfig.borderRadiusValue),
            borderSide: const BorderSide(
              color: AppColors.darkGray,
              width: .2,
            ),
          ),
      focusedBorder: focusedBorder ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(sizeConfig.borderRadiusValue),
            borderSide: const BorderSide(
              color: AppColors.darkGray,
              width: .2,
            ),
          ),
      focusedErrorBorder: focusedErrorBorder ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(sizeConfig.borderRadiusValue),
            borderSide: const BorderSide(
              color: AppColors.darkGray,
              width: .2,
            ),
          ),
      /*
      prefixIcon: (isMoney && (isPrefixIcon == null || isPrefixIcon!))
          ? _buildPrefixIcon()
          : null,
      */
      filled: filled ?? true,
      fillColor: fillColor ?? AppColors.fillColor,
      counterText: counterText ?? '',
      isDense: isDense ?? true,
      hintStyle: hintStyle ??
          theme.primaryTextTheme.bodyMedium!.medium.copyWith(
            color: AppColors.hintTextColor,
          ),
      hintText: hintText ?? '',
      errorStyle: theme.primaryTextTheme.labelMedium!.medium.copyWith(
        color: AppColors.primaryRed,
      ),
    );
  }

  /*
  Widget _buildPrefixIcon() {
    return Container(
      margin: padding.only(right: 20),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            width: 6.w,
            color: AppColors.borderGray,
          ),
        ),
      ),
      child: Padding(
        padding: padding.all(16),
        child: ImageIcon(
          AssetImage(
            AssetConstants.turkishLiraIcon,
          ),
          color: AppColors.lightGray,
        ),
      ),
    );
  }
  */
}