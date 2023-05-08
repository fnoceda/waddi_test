// ignore_for_file: prefer_const_constructors

library custom_listview;

import 'package:flutter/material.dart';
import 'custom_listview_model.dart';
import 'item_builder_widget.dart';

class CustomListViewWidget extends StatefulWidget {
  final List<CustomListViewModel> initialData;
  const CustomListViewWidget({super.key, required this.initialData});

  @override
  State<CustomListViewWidget> createState() => _CustomListViewWidgetState();
}

class _CustomListViewWidgetState extends State<CustomListViewWidget> {
  bool? priceAscending = true;
  bool? nameAscending;

  late List<CustomListViewModel> data;

  @override
  void initState() {
    super.initState();
    data = widget.initialData;
    sortByPrice();
  }

  void sortByPrice() {
    priceAscending = priceAscending ?? false;
    nameAscending = null;
    setState(() {
      priceAscending = !priceAscending!;
      data.sort(
        (a, b) => priceAscending!
            ? a.amount.compareTo(b.amount)
            : b.amount.compareTo(a.amount),
      );
    });
  }

  void sortByName() {
    nameAscending = nameAscending ?? false;
    priceAscending = null;

    setState(() {
      nameAscending = !nameAscending!;
      data.sort(
        (a, b) => nameAscending!
            ? a.name.compareTo(b.name)
            : b.name.compareTo(a.name),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                nameWidget(),
                priceWidget(),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView.separated(
              primary: false,
              shrinkWrap: false,
              key: const Key('myKey'),
              itemCount: widget.initialData.length,
              separatorBuilder: (_, i) => const Divider(),
              itemBuilder: (_, i) {
                // return Container();
                return ItemBuilder(item: widget.initialData[i]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget nameWidget() {
    return InkWell(
      onTap: () {
        sortByName();
      },
      child: Padding(
        padding: EdgeInsets.only(left: 44.0),
        child: Row(children: [
          Text('Name'),
          if (nameAscending != null)
            Icon(
              nameAscending! ? Icons.arrow_downward : Icons.arrow_upward,
              color: Colors.green,
            )
        ]),
      ),
    );
  }

  Widget priceWidget() {
    return InkWell(
      onTap: () {
        sortByPrice();
      },
      child: Row(
        children: [
          Text('Price'),
          if (priceAscending != null)
            Icon(
              priceAscending! ? Icons.arrow_downward : Icons.arrow_upward,
              color: Colors.green,
            )
        ],
      ),
    );
  }
}
