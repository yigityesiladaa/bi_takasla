import 'package:bitakasla/core/base/base_stateless_widget.dart';
import 'package:equatable/equatable.dart';

class DrawerItemModel extends Equatable {
  final String title;
  final IconData icon;
  final void Function() onTap;

  const DrawerItemModel({
    required this.title,
    required this.icon,
    required this.onTap
  });
  
  @override
  List<Object?> get props => [title, icon, onTap];
}