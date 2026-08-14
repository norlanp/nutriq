import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nutriq/core/domain/entity/intake_type_entity.dart';
import 'package:nutriq/core/router/app_routes.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';
import 'package:nutriq/features/diary/presentation/notifier/calendar_day_notifier.dart';
import 'package:nutriq/features/diary/presentation/notifier/diary_notifier.dart';
import 'package:nutriq/features/home/presentation/notifier/home_notifier.dart';
import 'package:nutriq/features/meal_detail/presentation/notifier/meal_detail_notifier.dart';
import 'package:nutriq/generated/l10n.dart';

class MealDetailBottomSheet extends ConsumerStatefulWidget {
  final MealEntity product;
  final DateTime day;
  final IntakeTypeEntity intakeTypeEntity;
  final TextEditingController quantityTextController;

  final String selectedUnit;

  final Function(String?, String?) onQuantityOrUnitChanged;

  const MealDetailBottomSheet({
    super.key,
    required this.product,
    required this.day,
    required this.intakeTypeEntity,
    required this.quantityTextController,
    required this.onQuantityOrUnitChanged,
    required this.selectedUnit,
  });

  @override
  ConsumerState<MealDetailBottomSheet> createState() =>
      _MealDetailBottomSheetState();
}

class _MealDetailBottomSheetState extends ConsumerState<MealDetailBottomSheet> {
  TimeOfDay? _selectedTime;

  @override
  Widget build(BuildContext context) {
    final productMissingRequiredInfo = _hasRequiredProductInfoMissing();
    return BottomSheet(
      elevation: 10,
      onClosing: () {},
      enableDrag: false,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.outline,
              width: 0.5,
            ),
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          child: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            enabled: !productMissingRequiredInfo,
                            controller: widget.quantityTextController
                              ..addListener(() {
                                widget.onQuantityOrUnitChanged(
                                  widget.quantityTextController.text,
                                  widget.selectedUnit,
                                );
                              }),
                            keyboardType: TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(r'^\d+([.,]\d{0,2})?$'),
                              ),
                            ],
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: S.of(context).quantityLabel,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: DropdownButtonFormField(
                            isExpanded: true,
                            initialValue: widget.selectedUnit,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: S.of(context).unitLabel,
                            ),
                            items: <DropdownMenuItem<String>>[
                              if (widget.product.hasServingValues)
                                _getServingDropdownItem(context),
                              if (widget.product.isSolid ||
                                  !widget.product.isLiquid &&
                                      !widget.product.isSolid)
                                ..._getSolidUnitDropdownItems(context),
                              if (widget.product.isLiquid ||
                                  !widget.product.isLiquid &&
                                      !widget.product.isSolid)
                                ..._getLiquidUnitDropdownItems(context),
                              ..._getOtherDropdownItems(context),
                            ],
                            onChanged: (value) {
                              widget.onQuantityOrUnitChanged(
                                widget.quantityTextController.text,
                                value,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0),
                    InkWell(
                      onTap: () => _pickTime(context),
                      borderRadius: BorderRadius.circular(8),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: S.of(context).mealTimeLabel,
                          suffixIcon: _selectedTime != null
                              ? IconButton(
                                  icon: const Icon(Icons.clear, size: 18),
                                  onPressed: () {
                                    setState(() {
                                      _selectedTime = null;
                                    });
                                  },
                                )
                              : const Icon(Icons.access_time),
                        ),
                        child: Text(
                          _selectedTime != null
                              ? _selectedTime!.format(context)
                              : S.of(context).mealTimeNowLabel,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: !productMissingRequiredInfo
                            ? () {
                                onAddButtonPressed(context);
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Theme.of(
                            context,
                          ).colorScheme.onPrimaryContainer,
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.primaryContainer,
                        ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                        icon: const Icon(Icons.add_outlined),
                        label: Text(S.of(context).addLabel),
                      ),
                    ),
                    productMissingRequiredInfo
                        ? Text(
                            S.of(context).missingProductInfo,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.error,
                                ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  bool _hasRequiredProductInfoMissing() {
    final productNutriments = widget.product.nutriments;
    if (productNutriments.energyKcal100 == null ||
        productNutriments.carbohydrates100 == null ||
        productNutriments.fat100 == null ||
        productNutriments.proteins100 == null) {
      return true;
    } else {
      return false;
    }
  }

  void onAddButtonPressed(BuildContext context) {
    final mealDetailState = ref.read(mealDetailNotifierProvider);
    ref
        .read(mealDetailNotifierProvider.notifier)
        .addIntake(
          mealDetailState.selectedUnit,
          mealDetailState.totalQuantityConverted,
          widget.intakeTypeEntity,
          widget.product,
          widget.day,
          time: _selectedTime,
        );

    ref.read(homeNotifierProvider.notifier).loadItems();
    ref.read(diaryNotifierProvider.notifier).loadDiaryYear();
    ref.read(calendarDayNotifierProvider.notifier).refreshCalendarDay();

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(S.of(context).infoAddedIntakeLabel)));
    context.go(AppRoutes.main);
  }

  DropdownMenuItem<String> _getServingDropdownItem(BuildContext context) {
    return DropdownMenuItem(
      value: UnitDropdownItem.serving.toString(),
      child: Text(
        widget.product.servingSize ??
            '${S.of(context).servingLabel} (${widget.product.servingQuantity} ${widget.product.servingUnit})',
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }

  List<DropdownMenuItem<String>> _getSolidUnitDropdownItems(
    BuildContext context,
  ) {
    return [
      DropdownMenuItem(
        value: UnitDropdownItem.g.toString(),
        child: Text(
          S.of(context).gramUnit,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
      DropdownMenuItem(
        value: UnitDropdownItem.oz.toString(),
        child: Text(
          S.of(context).ozUnit,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
    ];
  }

  List<DropdownMenuItem<String>> _getLiquidUnitDropdownItems(
    BuildContext context,
  ) {
    return [
      DropdownMenuItem(
        value: UnitDropdownItem.ml.toString(),
        child: Text(
          S.of(context).milliliterUnit,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
      DropdownMenuItem(
        value: UnitDropdownItem.flOz.toString(),
        child: Text(
          S.of(context).flOzUnit,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
    ];
  }

  List<DropdownMenuItem<String>> _getOtherDropdownItems(BuildContext context) {
    return [
      DropdownMenuItem(
        value: UnitDropdownItem.gml.toString(),
        child: Text(
          "${S.of(context).notAvailableLabel} (${S.of(context).gramMilliliterUnit})",
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
    ];
  }
}
