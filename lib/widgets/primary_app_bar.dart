import 'package:bitakasla/config/theme/theme_extensions.dart';
import 'package:bitakasla/widgets/scale_factor_autosize_text.dart';

import '../../../core/base/base_stateless_widget.dart';

class PrimaryAppBar extends BaseStatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final Widget? titleWidget;
  final PreferredSizeWidget? bottom;
  final Color? bgColor;
  final double? elevation;
  const PrimaryAppBar({
    super.key,
    this.title,
    this.actions,
    this.titleWidget,
    this.bottom,
    this.bgColor,
    this.elevation,
  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor ?? theme.scaffoldBackgroundColor,
      elevation: elevation ?? 0,
      centerTitle: true,
      title: titleWidget ??
          ScaleFactorAutoSizeText(
            text: title ?? '',
            maxLines: 1,
            style: theme.primaryTextTheme.bodyLarge!.semibold,
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
