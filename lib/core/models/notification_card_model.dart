import 'package:equatable/equatable.dart';

class NotificationCardModel extends Equatable {
  final String? imageUrl;
  final String? title;
  final String? subTitle;
  final String? description;

  const NotificationCardModel({
    required this.imageUrl,
    required this.title,
    required this.subTitle,
    required this.description,
  });
  
  @override
  List<Object?> get props => [imageUrl, title, subTitle, description];
}