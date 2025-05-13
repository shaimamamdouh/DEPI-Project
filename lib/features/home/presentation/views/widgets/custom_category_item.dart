import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:readio/features/home/domain/entities/category_entity.dart';
class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem({super.key, required this.category});
  final BookCategoryEntity category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/BookByCatigoryView', extra: category.name),
      child: SizedBox(
        height: 100,
        width: 80,
        child: Column(
          children: [
            SvgPicture.asset(category.iconUrl, width: 30, height: 30),
            const SizedBox(height: 8),
            Expanded(
              child: Text(
                category.name,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
