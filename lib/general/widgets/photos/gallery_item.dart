import 'package:electricity_meter_app/constants/app_resources.dart';
import 'package:flutter/material.dart';

class GalleryItem {
  GalleryItem({
    required this.id,
    required this.resource,
    this.isSvg = false,
  });

  final String id;
  final String resource;
  final bool isSvg;
}

class GalleryItemThumbnail extends StatelessWidget {
  const GalleryItemThumbnail({
    Key? key,
    required this.galleryExampleItem,
    required this.onTap,
  }) : super(key: key);

  final GalleryItem galleryExampleItem;

  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: GestureDetector(
        onTap: onTap,
        child: Hero(
          tag: galleryExampleItem.id,
          child: Image.asset(galleryExampleItem.resource, height: 80.0),
        ),
      ),
    );
  }
}

List<GalleryItem> galleryItems = <GalleryItem>[
  GalleryItem(
    id: "tag1",
    resource: AppImages.img_login_center,
  ),
  GalleryItem(id: "tag2", resource: AppImages.img_login_center),
  GalleryItem(
    id: "tag3",
    resource: AppImages.img_robot,
  ),
  GalleryItem(
    id: "tag4",
    resource: AppImages.img_login_center,
  ),
];