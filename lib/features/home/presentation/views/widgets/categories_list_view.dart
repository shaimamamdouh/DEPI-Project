import 'package:flutter/widgets.dart';
import 'package:readio/features/home/presentation/views/widgets/custom_category_item.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
    required this.categories,
  });

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return CustomCategoryItem(text: categories[index]);
      },
    );
  }
}
