enum AllergenType {
  gluten,
  dairy,
  soy,
  nuts,
  shellfish,
  eggs,
  fish,
  sesame,
  peanuts,
  celery,
  mustard,
  lupin,
  molluscs,
  sulphurDioxide;

  String get displayName {
    switch (this) {
      case AllergenType.gluten:
        return 'Gluten';
      case AllergenType.dairy:
        return 'Dairy';
      case AllergenType.soy:
        return 'Soy';
      case AllergenType.nuts:
        return 'Nuts';
      case AllergenType.shellfish:
        return 'Shellfish';
      case AllergenType.eggs:
        return 'Eggs';
      case AllergenType.fish:
        return 'Fish';
      case AllergenType.sesame:
        return 'Sesame';
      case AllergenType.peanuts:
        return 'Peanuts';
      case AllergenType.celery:
        return 'Celery';
      case AllergenType.mustard:
        return 'Mustard';
      case AllergenType.lupin:
        return 'Lupin';
      case AllergenType.molluscs:
        return 'Molluscs';
      case AllergenType.sulphurDioxide:
        return 'Sulphur Dioxide';
    }
  }

  static AllergenType fromString(String value) {
    return AllergenType.values.firstWhere(
      (e) => e.name == value,
      orElse: () => AllergenType.gluten,
    );
  }
}
