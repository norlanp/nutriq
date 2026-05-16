import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/utils/ont_image_cache_manager.dart';

final cacheManagerProvider = Provider<CacheManager>((ref) {
  return OntImageCacheManager.instance;
});