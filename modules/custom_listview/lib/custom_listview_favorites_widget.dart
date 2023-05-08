import 'package:flutter/material.dart';

import 'custom_listview_model.dart';
import 'custom_listview_widget.dart';

class CustomListViewFavorites extends StatefulWidget {
  final List<CustomListViewModel> initialData;

  const CustomListViewFavorites({super.key, required this.initialData});

  @override
  State<CustomListViewFavorites> createState() =>
      _CustomListViewFavoritesState();
}

class _CustomListViewFavoritesState extends State<CustomListViewFavorites> {
  late List<CustomListViewModel> allItems = [];
  late List<CustomListViewModel> favoriteItems = [];

  @override
  void initState() {
    super.initState();
    allItems = widget.initialData;
  }

  bool showFavorites = false;
  @override
  Widget build(BuildContext context) {
    favoriteItems.clear();
    for (var e in allItems) {
      if (e.isFavorite) {
        favoriteItems.add(e);
      }
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                // print('showAll');
                showFavorites = false;
                setState(() {});
              },
              child: const Text('All'),
            ),
            TextButton(
              onPressed: () {
                // print('showFavorites');

                showFavorites = true;
                setState(() {});
              },
              child: const Text('Favorites'),
            ),
          ],
        ),
        Visibility(
          visible: !showFavorites,
          child: CustomListViewWidget(
            initialData: allItems,
          ),
        ),
        Visibility(
          visible: showFavorites,
          child: CustomListViewWidget(
            initialData: favoriteItems,
          ),
        ),
      ],
    );
  }
}
