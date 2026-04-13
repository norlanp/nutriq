import 'package:flutter/material.dart';
import 'package:nutriq/core/domain/entity/allergen_type.dart';
import 'package:nutriq/core/domain/usecase/add_config_usecase.dart';
import 'package:nutriq/core/utils/locator.dart';
import 'package:nutriq/generated/l10n.dart';

class AllergenSettingsScreen extends StatefulWidget {
  const AllergenSettingsScreen({super.key});

  @override
  State<AllergenSettingsScreen> createState() => _AllergenSettingsScreenState();
}

class _AllergenSettingsScreenState extends State<AllergenSettingsScreen> {
  late Set<AllergenType> _selectedAllergens;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _selectedAllergens = {};
    _loadAllergens();
  }

  Future<void> _loadAllergens() async {
    final addConfigUsecase = locator<AddConfigUsecase>();
    final allergens = await addConfigUsecase.getConfigAllergens();
    if (mounted) {
      setState(() {
        _selectedAllergens = allergens;
        _isLoading = false;
      });
    }
  }

  Future<void> _saveAllergens() async {
    final addConfigUsecase = locator<AddConfigUsecase>();
    await addConfigUsecase.setConfigAllergens(_selectedAllergens);
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).allergenSettingsTitle),
        actions: [
          TextButton(
            onPressed: _saveAllergens,
            child: Text(
              S.of(context).buttonSaveLabel,
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
            ),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    S.of(context).allergenSettingsDescription,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withValues(alpha: 0.7),
                        ),
                  ),
                ),
                const Divider(height: 1),
                ...AllergenType.values.map((allergen) {
                  return CheckboxListTile(
                    value: _selectedAllergens.contains(allergen),
                    title: Text(allergen.displayName),
                    subtitle: Text(_getAllergenDescription(allergen)),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          _selectedAllergens.add(allergen);
                        } else {
                          _selectedAllergens.remove(allergen);
                        }
                      });
                    },
                  );
                }),
                const SizedBox(height: 16),
                if (_selectedAllergens.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      S
                          .of(context)
                          .allergenFilterEnabled(_selectedAllergens.length),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ),
                const SizedBox(height: 32),
              ],
            ),
    );
  }

  String _getAllergenDescription(AllergenType allergen) {
    switch (allergen) {
      case AllergenType.gluten:
        return S.of(context).allergenGlutenDesc;
      case AllergenType.dairy:
        return S.of(context).allergenDairyDesc;
      case AllergenType.soy:
        return S.of(context).allergenSoyDesc;
      case AllergenType.nuts:
        return S.of(context).allergenNutsDesc;
      case AllergenType.shellfish:
        return S.of(context).allergenShellfishDesc;
      case AllergenType.eggs:
        return S.of(context).allergenEggsDesc;
      case AllergenType.fish:
        return S.of(context).allergenFishDesc;
      case AllergenType.sesame:
        return S.of(context).allergenSesameDesc;
      case AllergenType.peanuts:
        return S.of(context).allergenPeanutsDesc;
      case AllergenType.celery:
        return S.of(context).allergenCeleryDesc;
      case AllergenType.mustard:
        return S.of(context).allergenMustardDesc;
      case AllergenType.lupin:
        return S.of(context).allergenLupinDesc;
      case AllergenType.molluscs:
        return S.of(context).allergenMolluscsDesc;
      case AllergenType.sulphurDioxide:
        return S.of(context).allergenSulphurDioxideDesc;
    }
  }
}
