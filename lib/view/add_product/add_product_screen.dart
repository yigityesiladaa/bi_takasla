import 'package:bitakasla/config/theme/theme_extensions.dart';
import 'package:bitakasla/core/base/base_get_view.dart';
import 'package:bitakasla/core/constants/app_colors.dart';
import 'package:bitakasla/core/localization/localization_keys.dart';
import 'package:bitakasla/core/utils/size_config.dart';
import 'package:bitakasla/view/add_product/add_product_screen_controller.dart';
import 'package:bitakasla/widgets/custom_text_field.dart';
import 'package:bitakasla/widgets/primary_app_bar.dart';
import 'package:bitakasla/widgets/scale_factor_autosize_text.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends BaseGetView<AddProductScreenController> {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  PrimaryAppBar _buildAppBar() => PrimaryAppBar(
        title: LocalizationKeys.addProductTitleTextKey.tr,
      );

  Widget _buildBody() => SingleChildScrollView(
        child: Container(
          width: Get.width,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            color: AppColors.widgetBackgroundColor,
            borderRadius: BorderRadius.circular(Get.width * .03),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProductBrand(),
              SizedBox(height: 20.h),
              _buildProductModel(),
              SizedBox(height: 20.h),
              _buildProductDescription(),
            ],
          ),
        ),
      );

    Widget _buildProductBrand() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ScaleFactorAutoSizeText(
          text: 'Ürün Markası',
          style: theme.primaryTextTheme.bodyMedium!.bold,
        ),
        const CustomTextField(hintText: 'Marka Girin'),
      ],
    );

    Widget _buildProductModel() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ScaleFactorAutoSizeText(
          text: 'Ürün Modeli',
          style: theme.primaryTextTheme.bodyMedium!.bold,
        ),
        const CustomTextField(hintText: 'Model Girin'),
      ],
    );

    Widget _buildProductDescription() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ScaleFactorAutoSizeText(
          text: 'Ürün Açıklaması',
          style: theme.primaryTextTheme.bodyMedium!.bold,
        ),
        const CustomTextField(hintText: 'Açıklama Girin', maxLines: 5),
      ],
    );
}
