import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_listview_model.dart';

class ItemBuilder extends StatefulWidget {
  final CustomListViewModel item;
  const ItemBuilder({super.key, required this.item});

  @override
  State<ItemBuilder> createState() => _ItemBuilderState();
}

class _ItemBuilderState extends State<ItemBuilder> {
  // bool isFavorite = false;
  @override
  void initState() {
    // isFavorite = widget.item.isFavorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CachedImage(url: widget.item.logo),
      title: Row(
        children: [
          InkWell(
            onTap: () {
              widget.item.isFavorite = !widget.item.isFavorite;
              setState(() {});
            },
            child: Icon(
              Icons.favorite,
              color:
                  (widget.item.isFavorite == true) ? Colors.red : Colors.grey,
            ),
          ),
          const SizedBox(width: 16),
          Text(widget.item.name),
        ],
      ),
      trailing: Text(widget.item.getPriceWithFormat()),
    );
  }
}

class CachedImage extends StatelessWidget {
  final String url;
  const CachedImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Image.network(url);
    // TODo: solve test fail
    // return CachedNetworkImage(
    //   imageUrl: url,
    //   imageBuilder: (context, imageProvider) => Container(
    //     width: 50.0,
    //     height: 50.0,
    //     decoration: BoxDecoration(
    //       shape: BoxShape.circle,
    //       image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
    //     ),
    //   ),
    //   placeholder: (context, url) => const CupertinoActivityIndicator(),
    //   errorWidget: (context, url, error) => const Icon(Icons.error),
    // );
  }
}
