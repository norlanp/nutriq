import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/providers/service_providers.dart';
import 'package:nutriq/features/meal_detail/presentation/widgets/meal_placeholder.dart';

class ImageFullScreen extends ConsumerStatefulWidget {
  static const fullScreenHeroTag = 'fullScreenTag';
  final ImageFullScreenArguments arguments;

  const ImageFullScreen({super.key, required this.arguments});

  @override
  ConsumerState<ImageFullScreen> createState() => _ImageFullScreenState();
}

class _ImageFullScreenState extends ConsumerState<ImageFullScreen> {
  late String imageUrl;

  @override
  void initState() {
    imageUrl = widget.arguments.imageUrl;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: InteractiveViewer(
        child: Hero(
          tag: ImageFullScreen.fullScreenHeroTag,
          child: CachedNetworkImage(
            width: double.infinity,
            height: double.infinity,
            cacheManager: ref.read(cacheManagerProvider),
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            placeholder: (context, string) => const MealPlaceholder(),
            errorWidget: (context, url, error) => const MealPlaceholder(),
          ),
        ),
      ),
    );
  }
}

class ImageFullScreenArguments {
  final String imageUrl;

  ImageFullScreenArguments(this.imageUrl);
}
