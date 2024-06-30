import 'package:bitakasla/core/base/base_get_view.dart';
import 'package:bitakasla/core/constants/app_colors.dart';
import 'package:bitakasla/core/localization/localization_keys.dart';
import 'package:bitakasla/view/notifications/notifications_screen_controller.dart';
import 'package:bitakasla/view/notifications/widgets/notification_card.dart';
import 'package:bitakasla/widgets/primary_app_bar.dart';

class NotificationsScreen extends BaseGetView<NotificationsScreenController> {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  PrimaryAppBar _buildAppBar() => PrimaryAppBar(
        title: LocalizationKeys.notificationsTitleTextKey.tr,
      );

  Widget _buildBody() => SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            color: AppColors.widgetBackgroundColor,
            borderRadius: BorderRadius.circular(Get.width * .03),
          ),
          child: Column(
            children: List.generate(
              controller.notifications.length,
              (index) => NotificationCard(model: controller.notifications[index]),
            ),
          ),
        ),
      );
}
