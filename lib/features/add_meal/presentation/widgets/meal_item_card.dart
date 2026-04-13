import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:nutriq/core/domain/entity/allergen_type.dart';
import 'package:nutriq/core/domain/service/allergen_filter_service.dart';
import 'package:nutriq/core/presentation/widgets/meal_value_unit_text.dart';
import 'package:nutriq/core/utils/locator.dart';
import 'package:nutriq/core/utils/navigation_options.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';
import 'package:nutriq/features/add_meal/presentation/add_meal_type.dart';
import 'package:nutriq/features/meal_detail/meal_detail_screen.dart';
import 'package:nutriq/generated/l10n.dart';

class MealItemCard extends StatelessWidget {
  final DateTime day;
  final AddMealType addMealType;
  final MealEntity mealEntity;
  final bool usesImperialUnits;
  final Set<AllergenType>? userAllergens;

  const MealItemCard(
      {super.key,
      required this.day,
      required this.mealEntity,
      required this.addMealType,
      required this.usesImperialUnits,
      this.userAllergens});

  Set<AllergenType> get _matchingAllergens {
    if (userAllergens == null || userAllergens!.isEmpty) return {};
    final service = locator<AllergenFilterService>();
    return service.getMatchingAllergens(mealEntity, userAllergens!);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Theme.of(context).colorScheme.outline),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: InkWell(
        child: SizedBox(
          height: 100,
          child: Center(
              child: ListTile(
            leading: mealEntity.thumbnailImageUrl != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: CachedNetworkImage(
                      cacheManager: locator<CacheManager>(),
                      fit: BoxFit.cover,
                      width: 60,
                      height: 60,
                      imageUrl: mealEntity.thumbnailImageUrl ?? "",
                    ))
                : ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                        width: 60,
                        height: 60,
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        child: const Icon(Icons.restaurant_outlined)),
                  ),
            title: AutoSizeText.rich(
                TextSpan(
                    text: mealEntity.name ?? "?",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface),
                    children: [
                      TextSpan(
                          text: ' ${mealEntity.brands ?? ""}',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurface
                                      .withValues(alpha: 0.8))),
                    ]),
                style: Theme.of(context).textTheme.titleLarge,
                maxLines: 2,
                overflow: TextOverflow.ellipsis),
            subtitle: mealEntity.mealQuantity != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MealValueUnitText(
                          value: double.parse(mealEntity.mealQuantity ?? "0"),
                          meal: mealEntity,
                          usesImperialUnits: usesImperialUnits),
                      if (_matchingAllergens.isNotEmpty) ...[
                        const SizedBox(height: 2),
                        _AllergenWarningChip(
                            matchingAllergens: _matchingAllergens),
                      ],
                    ],
                  )
                : _matchingAllergens.isNotEmpty
                    ? _AllergenWarningChip(
                        matchingAllergens: _matchingAllergens)
                    : const SizedBox(),
            trailing: IconButton(
              style: IconButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onSurface,
              ),
              icon: const Icon(Icons.add_outlined),
              onPressed: () => _onItemPressed(context),
            ),
          )),
        ),
        onTap: () => _onItemPressed(context),
      ),
    );
  }

  void _onItemPressed(BuildContext context) {
    Navigator.of(context).pushNamed(NavigationOptions.mealDetailRoute,
        arguments: MealDetailScreenArguments(
            mealEntity, addMealType.getIntakeType(), day, usesImperialUnits));
  }
}

class _AllergenWarningChip extends StatelessWidget {
  final Set<AllergenType> matchingAllergens;

  const _AllergenWarningChip({required this.matchingAllergens});

  @override
  Widget build(BuildContext context) {
    final allergenNames =
        matchingAllergens.take(3).map((a) => a.displayName).join(', ');
    final remaining =
        matchingAllergens.length > 3 ? ' +${matchingAllergens.length - 3}' : '';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.warning_amber,
            size: 14,
            color: Theme.of(context).colorScheme.onErrorContainer,
          ),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              '${S.of(context).containsAllergen}: $allergenNames$remaining',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onErrorContainer,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
