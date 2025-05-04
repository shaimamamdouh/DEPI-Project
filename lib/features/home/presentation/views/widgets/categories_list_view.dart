import 'package:flutter/widgets.dart';
import 'package:readio/features/home/presentation/views/widgets/custom_category_item.dart';
import 'package:readio/core/utils/catagory_book_list.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key, required List<String> categories,});

  //final List<BookCategoryEntity> categories;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return CustomCategoryItem( categories: categories[index],);
      },
    );
  }
}
