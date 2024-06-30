import 'package:bitakasla/config/theme/theme_extensions.dart';
import 'package:bitakasla/core/constants/app_colors.dart';
import 'package:bitakasla/widgets/scale_factor_autosize_text.dart';

import '../../../core/base/base_stateless_widget.dart';

class PrimaryAppBar extends BaseStatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final Widget? titleWidget;
  final PreferredSizeWidget? bottom;
  final Color? bgColor;
  final double? elevation;
  final TextStyle? titleStyle;
  final IconThemeData? iconThemeData;
  const PrimaryAppBar({
    super.key,
    this.title,
    this.actions,
    this.titleWidget,
    this.iconThemeData,
    this.bottom,
    this.bgColor,
    this.elevation,
    this.titleStyle,
  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor ?? AppColors.primaryColor,
      elevation: elevation ?? 0,
      centerTitle: true,
      iconTheme: iconThemeData,
      title: titleWidget ??
          ScaleFactorAutoSizeText(
            text: title ?? '',
            maxLines: 1,
            style: titleStyle ?? theme.primaryTextTheme.bodyLarge!.semibold.copyWith(
              color: AppColors.backgroundColor
            ),
          ),
      actions: actions,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize =>
      _PreferredAppBarSize(kToolbarHeight, bottom?.preferredSize.height);
}

class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight(
            (toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? bottomHeight;
}
