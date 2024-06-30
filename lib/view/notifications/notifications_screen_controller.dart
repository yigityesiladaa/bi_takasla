import 'package:bitakasla/core/base/base_getx_controller.dart';
import 'package:bitakasla/core/models/notification_card_model.dart';

class NotificationsScreenController extends BaseGetxController {
  final List<NotificationCardModel> notifications = const [
    NotificationCardModel(
      imageUrl: '',
      title: 'Test Title 1',
      subTitle: 'Test Subtitle 1',
      description: 'Test Description 1',
    ),
    NotificationCardModel(
      imageUrl: '',
      title: 'Test Title 2',
      subTitle: 'Test Subtitle 2',
      description: 'Test Description 2',
    ),
    NotificationCardModel(
      imageUrl: '',
      title: 'Test Title 3',
      subTitle: 'Test Subtitle 3',
      description: 'Test Description 3',
    ),
    NotificationCardModel(
      imageUrl: '',
      title: 'Test Title 4',
      subTitle: 'Test Subtitle 4',
      description: 'Test Description 4',
    ),
  ];
}
