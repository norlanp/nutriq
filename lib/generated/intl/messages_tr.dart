// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a tr locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'tr';

  static String m0(pct) => "%${pct} güven";

  static String m1(versionNumber) => "Versiyon ${versionNumber}";

  static String m2(pctCarbs, pctFats, pctProteins) =>
      "%${pctCarbs} karbonhidrat, %${pctFats} yağ, %${pctProteins} protein";

  static String m3(timestamp) => "Son senkronizasyon: ${timestamp}";

  static String m4(steps) => "${steps} adım senkronize edildi";

  static String m5(riskValue) => "Eşlik eden hastalık riski: ${riskValue}";

  static String m6(current, goal) => "${current} / ${goal} ml";

  static String m7(age) => "${age} yıl";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "activeFastLabel": MessageLookupByLibrary.simpleMessage("Aktif Oruç"),
    "activityExample": MessageLookupByLibrary.simpleMessage(
      "ör. koşu, bisiklet, yoga ...",
    ),
    "activityLabel": MessageLookupByLibrary.simpleMessage("Aktivite"),
    "activityMultiplierLabel": MessageLookupByLibrary.simpleMessage(
      "Aktivite Çarpanı",
    ),
    "addExerciseLabel": MessageLookupByLibrary.simpleMessage("Egzersiz Ekle"),
    "addIngredientLabel": MessageLookupByLibrary.simpleMessage("Malzeme ekle"),
    "addItemLabel": MessageLookupByLibrary.simpleMessage("Yeni Öğe Ekle:"),
    "addLabel": MessageLookupByLibrary.simpleMessage("Ekle"),
    "addMeasurement": MessageLookupByLibrary.simpleMessage("Ölçü Ekle"),
    "addWater": MessageLookupByLibrary.simpleMessage("Su Ekle"),
    "additionalInfoLabelCompendium2011": MessageLookupByLibrary.simpleMessage(
      "Bilgi\n\'2011 Compendium\n of Physical Activities\'\nden sağlanmıştır",
    ),
    "additionalInfoLabelCustom": MessageLookupByLibrary.simpleMessage(
      "Özel Yemek Öğesi",
    ),
    "additionalInfoLabelFDC": MessageLookupByLibrary.simpleMessage(
      "Daha Fazla Bilgi\nFoodData Central\'da",
    ),
    "additionalInfoLabelOFF": MessageLookupByLibrary.simpleMessage(
      "Daha Fazla Bilgi\nOpenFoodFacts\'te",
    ),
    "additionalInfoLabelUnknown": MessageLookupByLibrary.simpleMessage(
      "Bilinmeyen Yemek Öğesi",
    ),
    "afterLabel": MessageLookupByLibrary.simpleMessage("Sonra"),
    "ageLabel": MessageLookupByLibrary.simpleMessage("Yaş"),
    "aiScannerCaptureButton": MessageLookupByLibrary.simpleMessage(
      "Fotoğraf Çek",
    ),
    "aiScannerConfidence": m0,
    "aiScannerExample": MessageLookupByLibrary.simpleMessage(
      "Yapay zeka ile gıdayı tanıyın",
    ),
    "aiScannerGalleryButton": MessageLookupByLibrary.simpleMessage(
      "Galeriden Seç",
    ),
    "aiScannerLabel": MessageLookupByLibrary.simpleMessage(
      "Yapay Zeka Gıda Tarayıcı",
    ),
    "aiScannerResultsTitle": MessageLookupByLibrary.simpleMessage(
      "Sınıflandırma Sonuçları",
    ),
    "aiScannerSearchManually": MessageLookupByLibrary.simpleMessage(
      "Manuel ara",
    ),
    "aiScannerSubtitle": MessageLookupByLibrary.simpleMessage(
      "Gıdayı tanımak için fotoğraf çekin veya galeriden seçin",
    ),
    "aiScannerTitle": MessageLookupByLibrary.simpleMessage(
      "Yapay Zeka Gıda Tarayıcı",
    ),
    "allItemsLabel": MessageLookupByLibrary.simpleMessage("Tümü"),
    "alphaVersionName": MessageLookupByLibrary.simpleMessage("[Alpha]"),
    "appDescription": MessageLookupByLibrary.simpleMessage(
      "Nutriq, gizliliğinize saygı duyan ücretsiz ve açık kaynaklı bir kalori ve besin takipçisidir.",
    ),
    "appLicenseLabel": MessageLookupByLibrary.simpleMessage("GPL-3.0 lisansı"),
    "appTitle": MessageLookupByLibrary.simpleMessage("Nutriq"),
    "appVersionName": m1,
    "averageLabel": MessageLookupByLibrary.simpleMessage("Ort."),
    "baseQuantityLabel": MessageLookupByLibrary.simpleMessage(
      "Temel miktar (g/ml)",
    ),
    "beforeLabel": MessageLookupByLibrary.simpleMessage("Önce"),
    "betaVersionName": MessageLookupByLibrary.simpleMessage("[Beta]"),
    "bicepCm": MessageLookupByLibrary.simpleMessage("Biceps (cm)"),
    "bmi": MessageLookupByLibrary.simpleMessage("BMI"),
    "bmiInfo": MessageLookupByLibrary.simpleMessage(
      "Vücut Kitle İndeksi (BMI), yetişkinlerde aşırı kiloyu ve obeziteyi sınıflandırmak için kullanılan bir indekstir. Kilogram cinsinden ağırlığın, metre cinsinden boyun karesine bölünmesiyle tanımlanır (kg/m²).\n\nBMI, yağ ve kas kütlesi arasında ayrım yapmaz ve bazı bireyler için yanıltıcı olabilir.",
    ),
    "bmiLabel": MessageLookupByLibrary.simpleMessage("BMI"),
    "bmiNormal": MessageLookupByLibrary.simpleMessage("Normal"),
    "bmiObese": MessageLookupByLibrary.simpleMessage("Obez"),
    "bmiOverweight": MessageLookupByLibrary.simpleMessage("Fazla Kilolu"),
    "bmiUnderweight": MessageLookupByLibrary.simpleMessage("Düşük Kilolu"),
    "bmrKcal": MessageLookupByLibrary.simpleMessage("Bazal Metabolizma Hızı"),
    "bmrLabel": MessageLookupByLibrary.simpleMessage("BMR"),
    "bodyMeasurementTitle": MessageLookupByLibrary.simpleMessage(
      "Vücut Ölçüleri",
    ),
    "breakfastExample": MessageLookupByLibrary.simpleMessage(
      "ör. mısır gevreği, süt, kahve ...",
    ),
    "breakfastLabel": MessageLookupByLibrary.simpleMessage("Kahvaltı"),
    "burnedCaloriesLabel": MessageLookupByLibrary.simpleMessage("Yakıldı"),
    "burnedLabel": MessageLookupByLibrary.simpleMessage("yakılan"),
    "buttonNextLabel": MessageLookupByLibrary.simpleMessage("İLERİ"),
    "buttonResetLabel": MessageLookupByLibrary.simpleMessage("Sıfırla"),
    "buttonSaveLabel": MessageLookupByLibrary.simpleMessage("Kaydet"),
    "buttonStartLabel": MessageLookupByLibrary.simpleMessage("BAŞLA"),
    "buttonYesLabel": MessageLookupByLibrary.simpleMessage("EVET"),
    "calculationMethodLabel": MessageLookupByLibrary.simpleMessage(
      "Hesaplama Yöntemi",
    ),
    "calculationsMacronutrientsDistributionLabel":
        MessageLookupByLibrary.simpleMessage("Makro besin dağılımı"),
    "calculationsMacrosDistribution": m2,
    "calculationsRecommendedLabel": MessageLookupByLibrary.simpleMessage(
      "(önerilen)",
    ),
    "calculationsTDEEIOM2006Label": MessageLookupByLibrary.simpleMessage(
      "Tıp Enstitüsü Denklemi",
    ),
    "calculationsTDEELabel": MessageLookupByLibrary.simpleMessage(
      "TDEE denklemi",
    ),
    "calculationsTDEEMifflinStJeorLabel": MessageLookupByLibrary.simpleMessage(
      "Mifflin-St Jeor Denklemi",
    ),
    "caloriesTab": MessageLookupByLibrary.simpleMessage("Kalori"),
    "cancel": MessageLookupByLibrary.simpleMessage("İptal"),
    "carbohydrateLabel": MessageLookupByLibrary.simpleMessage("karbonhidrat"),
    "carbsLabel": MessageLookupByLibrary.simpleMessage("karbonhidrat"),
    "chartExportErrorLabel": MessageLookupByLibrary.simpleMessage(
      "Grafik paylaşılamadı",
    ),
    "chartExportedLabel": MessageLookupByLibrary.simpleMessage(
      "Grafik paylaşıldı",
    ),
    "chestCm": MessageLookupByLibrary.simpleMessage("Göğüs (cm)"),
    "chooseWeightGoalLabel": MessageLookupByLibrary.simpleMessage(
      "Kilo Hedefini Seçin",
    ),
    "cmLabel": MessageLookupByLibrary.simpleMessage("cm"),
    "consumedLabel": MessageLookupByLibrary.simpleMessage("Tüketilen"),
    "copyDialogTitle": MessageLookupByLibrary.simpleMessage(
      "Hangi yemek türüne kopyalamak istiyorsunuz?",
    ),
    "copyOrDeleteTimeDialogContent": MessageLookupByLibrary.simpleMessage(
      "\"Bugüne Kopyala\" ile yemeği bugüne kopyalayabilirsiniz. \"Sil\" ile yemeği silebilirsiniz.",
    ),
    "copyOrDeleteTimeDialogTitle": MessageLookupByLibrary.simpleMessage(
      "Ne yapmak istiyorsunuz?",
    ),
    "createCustomDialogContent": MessageLookupByLibrary.simpleMessage(
      "Özel bir yemek öğesi oluşturmak istiyor musunuz?",
    ),
    "createCustomDialogTitle": MessageLookupByLibrary.simpleMessage(
      "Özel yemek öğesi oluştur?",
    ),
    "createCustomFoodLabel": MessageLookupByLibrary.simpleMessage(
      "Özel yiyecek oluştur",
    ),
    "currentWeight": MessageLookupByLibrary.simpleMessage("Mevcut"),
    "custom": MessageLookupByLibrary.simpleMessage("Özel"),
    "customFoodEnergyLabel": MessageLookupByLibrary.simpleMessage(
      "Enerji (100 g/ml başına kcal)",
    ),
    "customFoodNameRequired": MessageLookupByLibrary.simpleMessage(
      "Yiyecek adı gereklidir",
    ),
    "dailyGoalLabel": MessageLookupByLibrary.simpleMessage("Günlük Hedef"),
    "dailyKcalAdjustmentLabel": MessageLookupByLibrary.simpleMessage(
      "Günlük Kcal ayarı:",
    ),
    "dailySummaryLabel": MessageLookupByLibrary.simpleMessage("Günlük Özet"),
    "dailyWaterGoal": MessageLookupByLibrary.simpleMessage("Günlük Su Hedefi"),
    "dataCollectionLabel": MessageLookupByLibrary.simpleMessage(
      "Anonim kullanım verileri sağlayarak geliştirmeyi destekleyin",
    ),
    "dataSyncBackupCreated": MessageLookupByLibrary.simpleMessage(
      "Yedekleme başarıyla oluşturuldu",
    ),
    "dataSyncBackupFilePath": MessageLookupByLibrary.simpleMessage(
      "Yedekleme dosya yolu",
    ),
    "dataSyncCloudBackupTitle": MessageLookupByLibrary.simpleMessage(
      "Bulut Yedekleme",
    ),
    "dataSyncCloudProvider": MessageLookupByLibrary.simpleMessage(
      "Bulut Sağlayıcı",
    ),
    "dataSyncComingSoon": MessageLookupByLibrary.simpleMessage("Yakında"),
    "dataSyncConfirmPassword": MessageLookupByLibrary.simpleMessage(
      "Şifreyi Onayla",
    ),
    "dataSyncCreateEncryptedBackup": MessageLookupByLibrary.simpleMessage(
      "Şifrelenmiş Yedekleme Oluştur",
    ),
    "dataSyncEncryptBackup": MessageLookupByLibrary.simpleMessage(
      "Şifrelenmiş Yedekleme",
    ),
    "dataSyncEncryptBackupDescription": MessageLookupByLibrary.simpleMessage(
      "Verilerinizin AES-256 şifreli yedeklemesini oluşturun. Yedekleme cihazınızda yerel olarak saklanır.",
    ),
    "dataSyncEncryptedRestore": MessageLookupByLibrary.simpleMessage(
      "Şifrelenmiş Geri Yükleme",
    ),
    "dataSyncExportSuccess": MessageLookupByLibrary.simpleMessage(
      "Veriler başarıyla dışa aktarıldı",
    ),
    "dataSyncExportTitle": MessageLookupByLibrary.simpleMessage(
      "Verileri Dışa Aktar",
    ),
    "dataSyncFormatJson": MessageLookupByLibrary.simpleMessage("JSON"),
    "dataSyncFormatZip": MessageLookupByLibrary.simpleMessage("ZIP"),
    "dataSyncImportDescription": MessageLookupByLibrary.simpleMessage(
      "Daha önce dışa aktarılan bir JSON veya ZIP dosyasından verileri içe aktarın. Bu, mevcut verilerle birleştirilecektir.",
    ),
    "dataSyncImportJson": MessageLookupByLibrary.simpleMessage(
      "JSON\'dan İçe Aktar",
    ),
    "dataSyncImportSuccess": MessageLookupByLibrary.simpleMessage(
      "Veriler başarıyla içe aktarıldı",
    ),
    "dataSyncImportTitle": MessageLookupByLibrary.simpleMessage(
      "Verileri İçe Aktar",
    ),
    "dataSyncImportZip": MessageLookupByLibrary.simpleMessage(
      "ZIP\'ten İçe Aktar",
    ),
    "dataSyncLastBackup": MessageLookupByLibrary.simpleMessage("Son Yedekleme"),
    "dataSyncLocalEncryption": MessageLookupByLibrary.simpleMessage(
      "Yerel Şifreleme",
    ),
    "dataSyncLocalEncryptionDescription": MessageLookupByLibrary.simpleMessage(
      "Yedeklemenizi şifreleyin ve yerel olarak saklayın. Şifrelenmiş dosyayı manuel olarak bulut depolamaya aktarabilirsiniz.",
    ),
    "dataSyncNoBackup": MessageLookupByLibrary.simpleMessage(
      "Yedekleme bulunamadı",
    ),
    "dataSyncPassword": MessageLookupByLibrary.simpleMessage("Şifre"),
    "dataSyncPasswordMismatch": MessageLookupByLibrary.simpleMessage(
      "Şifreler eşleşmiyor",
    ),
    "dataSyncPreviewTitle": MessageLookupByLibrary.simpleMessage(
      "İçe Aktarma Önizlemesi",
    ),
    "dataSyncRecords": MessageLookupByLibrary.simpleMessage("kayıt"),
    "dataSyncRestoreEncrypted": MessageLookupByLibrary.simpleMessage(
      "Şifrelenmiş Yedeklemeden Geri Yükle",
    ),
    "dataSyncRestoreFromBackup": MessageLookupByLibrary.simpleMessage(
      "Yedeklemeden Geri Yükle",
    ),
    "dataSyncSelectDataTypes": MessageLookupByLibrary.simpleMessage(
      "Dışa aktarılacak veri türlerini seçin",
    ),
    "dataSyncSelectFormat": MessageLookupByLibrary.simpleMessage(
      "Dışa aktarma formatı",
    ),
    "dataSyncTypeActivities": MessageLookupByLibrary.simpleMessage(
      "Aktiviteler",
    ),
    "dataSyncTypeConfig": MessageLookupByLibrary.simpleMessage("Ayarlar"),
    "dataSyncTypeFasts": MessageLookupByLibrary.simpleMessage("Oruç Seansları"),
    "dataSyncTypeIntakes": MessageLookupByLibrary.simpleMessage(
      "Besin Alımları",
    ),
    "dataSyncTypeMealPlans": MessageLookupByLibrary.simpleMessage(
      "Öğün Planları",
    ),
    "dataSyncTypeMeals": MessageLookupByLibrary.simpleMessage("Öğünler"),
    "dataSyncTypeNotificationSettings": MessageLookupByLibrary.simpleMessage(
      "Bildirim Ayarları",
    ),
    "dataSyncTypeRecipes": MessageLookupByLibrary.simpleMessage("Tarifler"),
    "dataSyncTypeTrackedDays": MessageLookupByLibrary.simpleMessage(
      "Takip Edilen Günler",
    ),
    "dataSyncTypeUsers": MessageLookupByLibrary.simpleMessage(
      "Kullanıcı Profili",
    ),
    "dataSyncTypeWaterEntries": MessageLookupByLibrary.simpleMessage(
      "Su Girişleri",
    ),
    "dataSyncTypeWeights": MessageLookupByLibrary.simpleMessage("Ağırlıklar"),
    "date": MessageLookupByLibrary.simpleMessage("Tarih"),
    "deletePhotoDialogContent": MessageLookupByLibrary.simpleMessage(
      "Bu fotoğrafı silmek istediğinizden emin misiniz?",
    ),
    "deletePhotoLabel": MessageLookupByLibrary.simpleMessage("Fotoğrafı Sil"),
    "deleteRecipeLabel": MessageLookupByLibrary.simpleMessage("Tarifi sil"),
    "deleteTimeDialogContent": MessageLookupByLibrary.simpleMessage(
      "Seçilen öğeyi silmek istiyor musunuz?",
    ),
    "deleteTimeDialogPluralContent": MessageLookupByLibrary.simpleMessage(
      "Bu öğüne ait tüm girdileri silmek istiyor musunuz?",
    ),
    "deleteTimeDialogPluralTitle": MessageLookupByLibrary.simpleMessage(
      "Girdiler silinsin mi?",
    ),
    "deleteTimeDialogTitle": MessageLookupByLibrary.simpleMessage("Öğeyi Sil?"),
    "deleteWeight": MessageLookupByLibrary.simpleMessage("Kaydı Sil"),
    "dialogCancelLabel": MessageLookupByLibrary.simpleMessage("İPTAL"),
    "dialogCopyLabel": MessageLookupByLibrary.simpleMessage("BUGÜNE KOPYALA"),
    "dialogDeleteLabel": MessageLookupByLibrary.simpleMessage("SİL"),
    "dialogOKLabel": MessageLookupByLibrary.simpleMessage("TAMAM"),
    "diaryLabel": MessageLookupByLibrary.simpleMessage("Günlük"),
    "dinnerExample": MessageLookupByLibrary.simpleMessage(
      "ör. çorba, tavuk, şarap ...",
    ),
    "dinnerLabel": MessageLookupByLibrary.simpleMessage("Akşam Yemeği"),
    "disclaimerText": MessageLookupByLibrary.simpleMessage(
      "Nutriq bir tıbbi uygulama değildir. Sağlanan tüm veriler doğrulanmamıştır ve dikkatle kullanılmalıdır. Lütfen sağlıklı bir yaşam tarzı sürdürün ve herhangi bir sorununuz varsa bir profesyonele danışın. Hastalık, hamilelik veya emzirme döneminde kullanımı önerilmez.\n\n\nUygulama hala geliştirme aşamasındadır. Hatalar, aksaklıklar ve çökmeler meydana gelebilir.",
    ),
    "editItemDialogTitle": MessageLookupByLibrary.simpleMessage(
      "Öğeyi Düzenle",
    ),
    "editMealLabel": MessageLookupByLibrary.simpleMessage("Yemeği Düzenle"),
    "elapsedTimeLabel": MessageLookupByLibrary.simpleMessage("Geçen"),
    "emptyShoppingListLabel": MessageLookupByLibrary.simpleMessage(
      "Alışveriş listesi boş",
    ),
    "emptySlotLabel": MessageLookupByLibrary.simpleMessage("Boş"),
    "enableDailySummaryLabel": MessageLookupByLibrary.simpleMessage(
      "Günlük Özeti Etkinleştir",
    ),
    "endFastLabel": MessageLookupByLibrary.simpleMessage("Oruç Bitir"),
    "energyLabel": MessageLookupByLibrary.simpleMessage("enerji"),
    "errorFetchingProductData": MessageLookupByLibrary.simpleMessage(
      "Ürün verileri alınırken hata oluştu",
    ),
    "errorLoadingActivities": MessageLookupByLibrary.simpleMessage(
      "Aktiviteler yüklenirken hata oluştu",
    ),
    "errorMealSave": MessageLookupByLibrary.simpleMessage(
      "Yemek kaydedilirken hata oluştu. Doğru yemek bilgilerini girdiniz mi?",
    ),
    "errorOpeningBrowser": MessageLookupByLibrary.simpleMessage(
      "Tarayıcı uygulaması açılırken hata oluştu",
    ),
    "errorOpeningEmail": MessageLookupByLibrary.simpleMessage(
      "E-posta uygulaması açılırken hata oluştu",
    ),
    "errorProductNotFound": MessageLookupByLibrary.simpleMessage(
      "Ürün bulunamadı",
    ),
    "exerciseCalorieImpact": MessageLookupByLibrary.simpleMessage(
      "Egzersiz Etkisi",
    ),
    "exerciseListLabel": MessageLookupByLibrary.simpleMessage(
      "Bugünkü Egzersizler",
    ),
    "exportAction": MessageLookupByLibrary.simpleMessage("Dışa Aktar"),
    "exportChartLabel": MessageLookupByLibrary.simpleMessage("Grafiği Paylaş"),
    "exportImportDescription": MessageLookupByLibrary.simpleMessage(
      "Uygulama verilerini bir zip dosyasına dışa aktarabilir ve daha sonra içe aktarabilirsiniz. Bu, verilerinizi yedeklemek veya başka bir cihaza aktarmak istiyorsanız kullanışlıdır.\n\nUygulama, verilerinizi saklamak için herhangi bir bulut hizmeti kullanmaz.",
    ),
    "exportImportErrorLabel": MessageLookupByLibrary.simpleMessage(
      "Dışa Aktarma / İçe Aktarma hatası",
    ),
    "exportImportLabel": MessageLookupByLibrary.simpleMessage(
      "Verileri Dışa Aktar / İçe Aktar",
    ),
    "exportImportSuccessLabel": MessageLookupByLibrary.simpleMessage(
      "Dışa Aktarma / İçe Aktarma başarılı",
    ),
    "fastingEndedNotificationBody": MessageLookupByLibrary.simpleMessage(
      "Tebrikler! Oruç hedefinize ulaştınız.",
    ),
    "fastingEndedNotificationTitle": MessageLookupByLibrary.simpleMessage(
      "Oruç Tamamlandı",
    ),
    "fastingHistoryLabel": MessageLookupByLibrary.simpleMessage("Oruç Geçmişi"),
    "fastingStartedNotificationBody": MessageLookupByLibrary.simpleMessage(
      "Oruç döneminiz başladı. Dayanıklı olun!",
    ),
    "fastingStartedNotificationTitle": MessageLookupByLibrary.simpleMessage(
      "Oruç Başladı",
    ),
    "fastingTrackerLabel": MessageLookupByLibrary.simpleMessage(
      "Aralıklı Oruç",
    ),
    "fatLabel": MessageLookupByLibrary.simpleMessage("yağ"),
    "fiberLabel": MessageLookupByLibrary.simpleMessage("lif"),
    "fiberPer100Label": MessageLookupByLibrary.simpleMessage("Lif başına "),
    "flOzUnit": MessageLookupByLibrary.simpleMessage("fl.oz"),
    "fridayLabel": MessageLookupByLibrary.simpleMessage("Cum"),
    "ftLabel": MessageLookupByLibrary.simpleMessage("ft"),
    "genderFemaleLabel": MessageLookupByLibrary.simpleMessage("♀ kadın"),
    "genderLabel": MessageLookupByLibrary.simpleMessage("Cinsiyet"),
    "genderMaleLabel": MessageLookupByLibrary.simpleMessage("♂ erkek"),
    "goalGainWeight": MessageLookupByLibrary.simpleMessage("Kilo Al"),
    "goalLabel": MessageLookupByLibrary.simpleMessage("Hedef"),
    "goalLoseWeight": MessageLookupByLibrary.simpleMessage("Kilo Ver"),
    "goalMaintainWeight": MessageLookupByLibrary.simpleMessage("Kilo Koru"),
    "goalWeight": MessageLookupByLibrary.simpleMessage("Hedef Kilo"),
    "gramMilliliterUnit": MessageLookupByLibrary.simpleMessage("g/ml"),
    "gramUnit": MessageLookupByLibrary.simpleMessage("g"),
    "healthSyncDataTypes": MessageLookupByLibrary.simpleMessage("Veri Türleri"),
    "healthSyncGrantPermission": MessageLookupByLibrary.simpleMessage(
      "İzin Ver",
    ),
    "healthSyncLastSync": m3,
    "healthSyncNeverSynced": MessageLookupByLibrary.simpleMessage(
      "Hiç senkronize edilmedi",
    ),
    "healthSyncNow": MessageLookupByLibrary.simpleMessage(
      "Şimdi Senkronize Et",
    ),
    "healthSyncPermissionRequired": MessageLookupByLibrary.simpleMessage(
      "Sağlık verilerine erişmek için izin gerekli",
    ),
    "healthSyncSteps": MessageLookupByLibrary.simpleMessage("Adımlar"),
    "healthSyncStepsResult": m4,
    "healthSyncTitle": MessageLookupByLibrary.simpleMessage(
      "Sağlık Senkronizasyonu",
    ),
    "healthSyncWeight": MessageLookupByLibrary.simpleMessage("Kilo"),
    "healthSyncWorkouts": MessageLookupByLibrary.simpleMessage("Egzersizler"),
    "heightLabel": MessageLookupByLibrary.simpleMessage("Boy"),
    "hipCm": MessageLookupByLibrary.simpleMessage("Kalça (cm)"),
    "homeLabel": MessageLookupByLibrary.simpleMessage("Ana Sayfa"),
    "hoursLabel": MessageLookupByLibrary.simpleMessage("Saat"),
    "importAction": MessageLookupByLibrary.simpleMessage("İçe Aktar"),
    "inactiveFastLabel": MessageLookupByLibrary.simpleMessage("Aktif oruç yok"),
    "infoAddedActivityLabel": MessageLookupByLibrary.simpleMessage(
      "Yeni aktivite eklendi",
    ),
    "infoAddedIntakeLabel": MessageLookupByLibrary.simpleMessage(
      "Yeni alım eklendi",
    ),
    "ingredientsLabel": MessageLookupByLibrary.simpleMessage("malzemeler"),
    "insufficientWeightData": MessageLookupByLibrary.simpleMessage(
      "Trendi göstermek için yeterli kilo verisi yok",
    ),
    "itemDeletedSnackbar": MessageLookupByLibrary.simpleMessage("Öğe silindi"),
    "itemUpdatedSnackbar": MessageLookupByLibrary.simpleMessage(
      "Öğe güncellendi",
    ),
    "kcalLabel": MessageLookupByLibrary.simpleMessage("kcal"),
    "kcalLeftLabel": MessageLookupByLibrary.simpleMessage("kalan kcal"),
    "keyboardShortcutBack": MessageLookupByLibrary.simpleMessage("Geri"),
    "keyboardShortcutNewEntry": MessageLookupByLibrary.simpleMessage(
      "Yeni giriş",
    ),
    "keyboardShortcutSave": MessageLookupByLibrary.simpleMessage("Kaydet"),
    "kgLabel": MessageLookupByLibrary.simpleMessage("kg"),
    "lbsLabel": MessageLookupByLibrary.simpleMessage("lbs"),
    "logWeight": MessageLookupByLibrary.simpleMessage("Kilo Gir"),
    "lunchExample": MessageLookupByLibrary.simpleMessage(
      "ör. pizza, salata, pirinç ...",
    ),
    "lunchLabel": MessageLookupByLibrary.simpleMessage("Öğle Yemeği"),
    "macroDistributionLabel": MessageLookupByLibrary.simpleMessage(
      "Makro besin Dağılımı:",
    ),
    "macroTrendChart": MessageLookupByLibrary.simpleMessage("Makro Trendi"),
    "macrosTab": MessageLookupByLibrary.simpleMessage("Makrolar"),
    "mealAddedToPlanLabel": MessageLookupByLibrary.simpleMessage(
      "Öğün plana eklendi",
    ),
    "mealBrandsLabel": MessageLookupByLibrary.simpleMessage("Markalar"),
    "mealCarbsLabel": MessageLookupByLibrary.simpleMessage(
      "karbonhidrat başına",
    ),
    "mealFatLabel": MessageLookupByLibrary.simpleMessage("yağ başına"),
    "mealKcalLabel": MessageLookupByLibrary.simpleMessage("kcal başına"),
    "mealNameLabel": MessageLookupByLibrary.simpleMessage("Yemek adı"),
    "mealPlanLabel": MessageLookupByLibrary.simpleMessage("Öğün Planlama"),
    "mealPlanSubtitle": MessageLookupByLibrary.simpleMessage(
      "Haftalık öğün planlayın",
    ),
    "mealProteinLabel": MessageLookupByLibrary.simpleMessage(
      "protein başına 100 g/ml",
    ),
    "mealRemindersLabel": MessageLookupByLibrary.simpleMessage(
      "Öğün Hatırlatıcıları",
    ),
    "mealSizeLabel": MessageLookupByLibrary.simpleMessage(
      "Yemek boyutu (g/ml)",
    ),
    "mealSizeLabelImperial": MessageLookupByLibrary.simpleMessage(
      "Yemek boyutu (oz/fl oz)",
    ),
    "mealTimeLabel": MessageLookupByLibrary.simpleMessage("Öğün Zamanı"),
    "mealTimeNowLabel": MessageLookupByLibrary.simpleMessage("Şimdi"),
    "mealTimingAvgTimesLabel": MessageLookupByLibrary.simpleMessage(
      "Ortalama Öğün Zamanları",
    ),
    "mealTimingDistributionLabel": MessageLookupByLibrary.simpleMessage(
      "Öğün Zamanı Dağılımı",
    ),
    "mealTimingEntriesLabel": MessageLookupByLibrary.simpleMessage(
      "Son Girişler",
    ),
    "mealTimingLabel": MessageLookupByLibrary.simpleMessage("Öğün Zamanlaması"),
    "mealTimingNoDataLabel": MessageLookupByLibrary.simpleMessage(
      "Henüz öğün zamanı verisi yok. Desenleri görmek için öğün eklerken zaman belirleyin.",
    ),
    "mealUnitLabel": MessageLookupByLibrary.simpleMessage("Yemek birimi"),
    "measurementHistory": MessageLookupByLibrary.simpleMessage("Ölçü Geçmişi"),
    "microNutrientsLabel": MessageLookupByLibrary.simpleMessage(
      "Mikrobesin Öğeleri",
    ),
    "milliliterUnit": MessageLookupByLibrary.simpleMessage("ml"),
    "minutesLabel": MessageLookupByLibrary.simpleMessage("Dakika"),
    "missingProductInfo": MessageLookupByLibrary.simpleMessage(
      "Üründe gerekli kcal veya makro besin bilgileri eksik",
    ),
    "ml": MessageLookupByLibrary.simpleMessage("ml"),
    "mondayLabel": MessageLookupByLibrary.simpleMessage("Pzt"),
    "monthlyCalorieChart": MessageLookupByLibrary.simpleMessage(
      "Aylık Kaloriler",
    ),
    "monthlyLabel": MessageLookupByLibrary.simpleMessage("Ay"),
    "movingAverage": MessageLookupByLibrary.simpleMessage("Hareketli Ortalama"),
    "myMealsLabel": MessageLookupByLibrary.simpleMessage("Yemeklerim"),
    "neckCm": MessageLookupByLibrary.simpleMessage("Boyun (cm)"),
    "netCaloriesLabel": MessageLookupByLibrary.simpleMessage("Net Kalori"),
    "noActivityRecentlyAddedLabel": MessageLookupByLibrary.simpleMessage(
      "Son zamanlarda eklenen aktivite yok",
    ),
    "noMealsRecentlyAddedLabel": MessageLookupByLibrary.simpleMessage(
      "Son zamanlarda eklenen yemek yok",
    ),
    "noMeasurements": MessageLookupByLibrary.simpleMessage("Henüz ölçü yok"),
    "noPhotosLabel": MessageLookupByLibrary.simpleMessage(
      "Henüz ilerleme fotoğrafı yok. Eklemek için + tuşuna dokunun.",
    ),
    "noRecipesLabel": MessageLookupByLibrary.simpleMessage(
      "Henüz tarif yok. Bir tane oluşturun!",
    ),
    "noResultsFound": MessageLookupByLibrary.simpleMessage("Sonuç bulunamadı"),
    "noResultsHint": MessageLookupByLibrary.simpleMessage(
      "Farklı anahtar kelimelerle aramayı deneyin",
    ),
    "noWaterEntries": MessageLookupByLibrary.simpleMessage(
      "Henüz su kaydı yok",
    ),
    "noWeightEntries": MessageLookupByLibrary.simpleMessage(
      "Henüz kilo kaydı yok",
    ),
    "notAvailableLabel": MessageLookupByLibrary.simpleMessage("Mevcut Değil"),
    "notSetLabel": MessageLookupByLibrary.simpleMessage("Ayarlanmadı"),
    "note": MessageLookupByLibrary.simpleMessage("Not"),
    "nothingAddedLabel": MessageLookupByLibrary.simpleMessage(
      "Hiçbir şey eklenmedi",
    ),
    "notificationSettingsLabel": MessageLookupByLibrary.simpleMessage(
      "Bildirimler",
    ),
    "nutritionInfoLabel": MessageLookupByLibrary.simpleMessage(
      "Beslenme Bilgileri",
    ),
    "nutritionPreviewLabel": MessageLookupByLibrary.simpleMessage(
      "Tahmini Besin Değerleri",
    ),
    "nutritionalStatusNormalWeight": MessageLookupByLibrary.simpleMessage(
      "Normal Kilo",
    ),
    "nutritionalStatusObeseClassI": MessageLookupByLibrary.simpleMessage(
      "Obezite Sınıf I",
    ),
    "nutritionalStatusObeseClassII": MessageLookupByLibrary.simpleMessage(
      "Obezite Sınıf II",
    ),
    "nutritionalStatusObeseClassIII": MessageLookupByLibrary.simpleMessage(
      "Obezite Sınıf III",
    ),
    "nutritionalStatusPreObesity": MessageLookupByLibrary.simpleMessage(
      "Obezite Öncesi",
    ),
    "nutritionalStatusRiskAverage": MessageLookupByLibrary.simpleMessage(
      "Ortalama",
    ),
    "nutritionalStatusRiskIncreased": MessageLookupByLibrary.simpleMessage(
      "Artmış",
    ),
    "nutritionalStatusRiskLabel": m5,
    "nutritionalStatusRiskLow": MessageLookupByLibrary.simpleMessage(
      "Düşük \n(ancak diğer \nklinik sorunların riski artmış)",
    ),
    "nutritionalStatusRiskModerate": MessageLookupByLibrary.simpleMessage(
      "Orta",
    ),
    "nutritionalStatusRiskSevere": MessageLookupByLibrary.simpleMessage(
      "Şiddetli",
    ),
    "nutritionalStatusRiskVerySevere": MessageLookupByLibrary.simpleMessage(
      "Çok şiddetli",
    ),
    "nutritionalStatusUnderweight": MessageLookupByLibrary.simpleMessage(
      "Düşük Kilolu",
    ),
    "offDisclaimer": MessageLookupByLibrary.simpleMessage(
      "Bu uygulama tarafından size sağlanan veriler Open Food Facts veritabanından alınmaktadır. Sağlanan bilgilerin doğruluğu, eksiksizliği veya güvenilirliği konusunda hiçbir garanti verilmemektedir. Veriler \"olduğu gibi\" sağlanır ve verilerin kullanımıyla ilgili herhangi bir zarardan verilerin kaynağı (Open Food Facts) sorumlu tutulamaz.",
    ),
    "onboardingActivityQuestionSubtitle": MessageLookupByLibrary.simpleMessage(
      "Ne kadar aktifsiz? (antrenmanlar hariç)",
    ),
    "onboardingBirthdayHint": MessageLookupByLibrary.simpleMessage(
      "Tarih Girin",
    ),
    "onboardingBirthdayQuestionSubtitle": MessageLookupByLibrary.simpleMessage(
      "Doğum gününüz ne zaman?",
    ),
    "onboardingEnterBirthdayLabel": MessageLookupByLibrary.simpleMessage(
      "Doğum Günü",
    ),
    "onboardingGenderQuestionSubtitle": MessageLookupByLibrary.simpleMessage(
      "Cinsiyetiniz nedir?",
    ),
    "onboardingGoalQuestionSubtitle": MessageLookupByLibrary.simpleMessage(
      "Mevcut kilo hedefiniz nedir?",
    ),
    "onboardingHeightExampleHintCm": MessageLookupByLibrary.simpleMessage(
      "ör. 170",
    ),
    "onboardingHeightExampleHintFt": MessageLookupByLibrary.simpleMessage(
      "ör. 5.8",
    ),
    "onboardingHeightQuestionSubtitle": MessageLookupByLibrary.simpleMessage(
      "Mevcut boyunuz nedir?",
    ),
    "onboardingIntroDescription": MessageLookupByLibrary.simpleMessage(
      "Başlamak için, uygulamanın günlük kalori hedefinizi hesaplamak için hakkınızda bazı bilgilere ihtiyacı var.\nHakkınızdaki tüm bilgiler cihazınızda güvenli bir şekilde saklanır.",
    ),
    "onboardingKcalPerDayLabel": MessageLookupByLibrary.simpleMessage(
      "günlük kcal",
    ),
    "onboardingOverviewLabel": MessageLookupByLibrary.simpleMessage(
      "Genel Bakış",
    ),
    "onboardingSaveUserError": MessageLookupByLibrary.simpleMessage(
      "Yanlış giriş, lütfen tekrar deneyin",
    ),
    "onboardingWeightExampleHintKg": MessageLookupByLibrary.simpleMessage(
      "ör. 60",
    ),
    "onboardingWeightExampleHintLbs": MessageLookupByLibrary.simpleMessage(
      "ör. 132",
    ),
    "onboardingWeightQuestionSubtitle": MessageLookupByLibrary.simpleMessage(
      "Mevcut kilonuz nedir?",
    ),
    "onboardingWelcomeLabel": MessageLookupByLibrary.simpleMessage(
      "Hoş geldiniz",
    ),
    "onboardingWrongHeightLabel": MessageLookupByLibrary.simpleMessage(
      "Doğru boy girin",
    ),
    "onboardingWrongWeightLabel": MessageLookupByLibrary.simpleMessage(
      "Doğru kilo girin",
    ),
    "onboardingYourGoalLabel": MessageLookupByLibrary.simpleMessage(
      "Kalori hedefiniz:",
    ),
    "onboardingYourMacrosGoalLabel": MessageLookupByLibrary.simpleMessage(
      "Makro besin hedefleriniz:",
    ),
    "ozUnit": MessageLookupByLibrary.simpleMessage("oz"),
    "paAmericanFootballGeneral": MessageLookupByLibrary.simpleMessage("futbol"),
    "paAmericanFootballGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "dokunmatik, bayrak, genel",
    ),
    "paArcheryGeneral": MessageLookupByLibrary.simpleMessage("okçuluk"),
    "paArcheryGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "avcılık dışı",
    ),
    "paAutoRacing": MessageLookupByLibrary.simpleMessage("otomobil yarışı"),
    "paAutoRacingDesc": MessageLookupByLibrary.simpleMessage("açık tekerlek"),
    "paBackpackingGeneral": MessageLookupByLibrary.simpleMessage(
      "sırt çantasıyla gezme",
    ),
    "paBackpackingGeneralDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paBadmintonGeneral": MessageLookupByLibrary.simpleMessage("badminton"),
    "paBadmintonGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "sosyal tekler ve çiftler, genel",
    ),
    "paBasketballGeneral": MessageLookupByLibrary.simpleMessage("basketbol"),
    "paBasketballGeneralDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paBicyclingGeneral": MessageLookupByLibrary.simpleMessage(
      "bisiklet sürme",
    ),
    "paBicyclingGeneralDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paBicyclingMountainGeneral": MessageLookupByLibrary.simpleMessage(
      "dağ bisikleti",
    ),
    "paBicyclingMountainGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "genel",
    ),
    "paBicyclingStationaryGeneral": MessageLookupByLibrary.simpleMessage(
      "sabit bisiklet",
    ),
    "paBicyclingStationaryGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "genel",
    ),
    "paBilliardsGeneral": MessageLookupByLibrary.simpleMessage("bilardo"),
    "paBilliardsGeneralDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paBowlingGeneral": MessageLookupByLibrary.simpleMessage("bowling"),
    "paBowlingGeneralDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paBoxingBag": MessageLookupByLibrary.simpleMessage("boks"),
    "paBoxingBagDesc": MessageLookupByLibrary.simpleMessage("kum torbası"),
    "paBoxingGeneral": MessageLookupByLibrary.simpleMessage("boks"),
    "paBoxingGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "ringde, genel",
    ),
    "paBroomball": MessageLookupByLibrary.simpleMessage("broomball"),
    "paBroomballDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paCalisthenicsGeneral": MessageLookupByLibrary.simpleMessage("kalistenik"),
    "paCalisthenicsGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "hafif veya orta derecede çaba, genel (ör. sırt egzersizleri)",
    ),
    "paCanoeingGeneral": MessageLookupByLibrary.simpleMessage("kano"),
    "paCanoeingGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "kürek çekme, zevk için, genel",
    ),
    "paCatch": MessageLookupByLibrary.simpleMessage("futbol veya beyzbol"),
    "paCatchDesc": MessageLookupByLibrary.simpleMessage("yakalama oyunu"),
    "paCheerleading": MessageLookupByLibrary.simpleMessage("amigo"),
    "paCheerleadingDesc": MessageLookupByLibrary.simpleMessage(
      "jimnastik hareketleri, rekabetçi",
    ),
    "paChildrenGame": MessageLookupByLibrary.simpleMessage("çocuk oyunları"),
    "paChildrenGameDesc": MessageLookupByLibrary.simpleMessage(
      "(ör. seksek, 4-kare, dodgeball, oyun alanı aletleri, t-ball, tetherball, misket, arcade oyunları), orta derecede çaba",
    ),
    "paClimbingHillsNoLoadGeneral": MessageLookupByLibrary.simpleMessage(
      "tepe tırmanma, yük yok",
    ),
    "paClimbingHillsNoLoadGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "yük yok",
    ),
    "paCricket": MessageLookupByLibrary.simpleMessage("kriket"),
    "paCricketDesc": MessageLookupByLibrary.simpleMessage(
      "vuruş, bowling, saha",
    ),
    "paCroquet": MessageLookupByLibrary.simpleMessage("kroket"),
    "paCroquetDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paCurling": MessageLookupByLibrary.simpleMessage("curling"),
    "paCurlingDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paDancingAerobicGeneral": MessageLookupByLibrary.simpleMessage("aerobik"),
    "paDancingAerobicGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "genel",
    ),
    "paDancingGeneral": MessageLookupByLibrary.simpleMessage("genel dans"),
    "paDancingGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "ör. disko, halk, İrlanda step dansı, hat dansı, polka, contra, country",
    ),
    "paDartsWall": MessageLookupByLibrary.simpleMessage("dart"),
    "paDartsWallDesc": MessageLookupByLibrary.simpleMessage("duvar veya çim"),
    "paDivingGeneral": MessageLookupByLibrary.simpleMessage("dalış"),
    "paDivingGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "deri dalışı, scuba dalışı, genel",
    ),
    "paDivingSpringboardPlatform": MessageLookupByLibrary.simpleMessage(
      "dalış",
    ),
    "paDivingSpringboardPlatformDesc": MessageLookupByLibrary.simpleMessage(
      "trambolin veya platform",
    ),
    "paFencing": MessageLookupByLibrary.simpleMessage("eskrim"),
    "paFencingDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paFrisbee": MessageLookupByLibrary.simpleMessage("frisbee oyunu"),
    "paFrisbeeDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paGeneralDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paGolfGeneral": MessageLookupByLibrary.simpleMessage("golf"),
    "paGolfGeneralDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paGymnasticsGeneral": MessageLookupByLibrary.simpleMessage("jimnastik"),
    "paGymnasticsGeneralDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paHackySack": MessageLookupByLibrary.simpleMessage("hacky sack"),
    "paHackySackDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paHandballGeneral": MessageLookupByLibrary.simpleMessage("hentbol"),
    "paHandballGeneralDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paHangGliding": MessageLookupByLibrary.simpleMessage("yelken kanat"),
    "paHangGlidingDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paHeadingBicycling": MessageLookupByLibrary.simpleMessage(
      "bisiklet sürme",
    ),
    "paHeadingConditionalExercise": MessageLookupByLibrary.simpleMessage(
      "koşullandırma egzersizi",
    ),
    "paHeadingDancing": MessageLookupByLibrary.simpleMessage("dans"),
    "paHeadingRunning": MessageLookupByLibrary.simpleMessage("koşu"),
    "paHeadingSports": MessageLookupByLibrary.simpleMessage("spor"),
    "paHeadingWalking": MessageLookupByLibrary.simpleMessage("yürüyüş"),
    "paHeadingWaterActivities": MessageLookupByLibrary.simpleMessage(
      "su aktiviteleri",
    ),
    "paHeadingWinterActivities": MessageLookupByLibrary.simpleMessage(
      "kış aktiviteleri",
    ),
    "paHikingCrossCountry": MessageLookupByLibrary.simpleMessage("yürüyüş"),
    "paHikingCrossCountryDesc": MessageLookupByLibrary.simpleMessage(
      "kırsal alan",
    ),
    "paHockeyField": MessageLookupByLibrary.simpleMessage("çim hokeyi"),
    "paHockeyFieldDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paHorseRidingGeneral": MessageLookupByLibrary.simpleMessage("at binme"),
    "paHorseRidingGeneralDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paIceHockeyGeneral": MessageLookupByLibrary.simpleMessage("buz hokeyi"),
    "paIceHockeyGeneralDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paIceSkatingGeneral": MessageLookupByLibrary.simpleMessage("buz pateni"),
    "paIceSkatingGeneralDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paJaiAlai": MessageLookupByLibrary.simpleMessage("jai alai"),
    "paJaiAlaiDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paJoggingGeneral": MessageLookupByLibrary.simpleMessage("koşu"),
    "paJoggingGeneralDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paJuggling": MessageLookupByLibrary.simpleMessage("jonglörlük"),
    "paJugglingDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paKayakingModerate": MessageLookupByLibrary.simpleMessage("kano"),
    "paKayakingModerateDesc": MessageLookupByLibrary.simpleMessage(
      "orta derecede çaba",
    ),
    "paKickball": MessageLookupByLibrary.simpleMessage("kickball"),
    "paKickballDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paLacrosse": MessageLookupByLibrary.simpleMessage("lakros"),
    "paLacrosseDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paLawnBowling": MessageLookupByLibrary.simpleMessage("çim bowling"),
    "paLawnBowlingDesc": MessageLookupByLibrary.simpleMessage(
      "bocce topu, açık hava",
    ),
    "paMartialArtsModerate": MessageLookupByLibrary.simpleMessage(
      "dövüş sanatları",
    ),
    "paMartialArtsModerateDesc": MessageLookupByLibrary.simpleMessage(
      "farklı tipler, orta tempo (ör. judo, jujitsu, karate, kick boxing, tae kwan do, tai-bo, Muay Thai boks)",
    ),
    "paMartialArtsSlower": MessageLookupByLibrary.simpleMessage(
      "dövüş sanatları",
    ),
    "paMartialArtsSlowerDesc": MessageLookupByLibrary.simpleMessage(
      "farklı tipler, daha yavaş tempo, acemi performansçılar, pratik",
    ),
    "paMotoCross": MessageLookupByLibrary.simpleMessage("moto-kros"),
    "paMotoCrossDesc": MessageLookupByLibrary.simpleMessage(
      "arazi motor sporları, arazi aracı, genel",
    ),
    "paMountainClimbing": MessageLookupByLibrary.simpleMessage("tırmanma"),
    "paMountainClimbingDesc": MessageLookupByLibrary.simpleMessage(
      "kaya veya dağ tırmanışı",
    ),
    "paOrienteering": MessageLookupByLibrary.simpleMessage("oryantiring"),
    "paOrienteeringDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paPaddleBoarding": MessageLookupByLibrary.simpleMessage("kürek tahtası"),
    "paPaddleBoardingDesc": MessageLookupByLibrary.simpleMessage("ayakta"),
    "paPaddleBoat": MessageLookupByLibrary.simpleMessage("pedallı tekne"),
    "paPaddleBoatDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paPaddleball": MessageLookupByLibrary.simpleMessage("paddleball"),
    "paPaddleballDesc": MessageLookupByLibrary.simpleMessage("rahat, genel"),
    "paPoloHorse": MessageLookupByLibrary.simpleMessage("polo"),
    "paPoloHorseDesc": MessageLookupByLibrary.simpleMessage("at üzerinde"),
    "paRacquetball": MessageLookupByLibrary.simpleMessage("raketbol"),
    "paRacquetballDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paResistanceTraining": MessageLookupByLibrary.simpleMessage(
      "direnç antrenmanı",
    ),
    "paResistanceTrainingDesc": MessageLookupByLibrary.simpleMessage(
      "ağırlık kaldırma, serbest ağırlık, nautilus veya evrensel",
    ),
    "paRodeoSportGeneralModerate": MessageLookupByLibrary.simpleMessage(
      "rodeo sporları",
    ),
    "paRodeoSportGeneralModerateDesc": MessageLookupByLibrary.simpleMessage(
      "genel, orta derecede çaba",
    ),
    "paRollerbladingLight": MessageLookupByLibrary.simpleMessage(
      "patenle kayma",
    ),
    "paRollerbladingLightDesc": MessageLookupByLibrary.simpleMessage(
      "sıralı paten",
    ),
    "paRopeJumpingGeneral": MessageLookupByLibrary.simpleMessage("ip atlama"),
    "paRopeJumpingGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "orta tempo, 100-120 atlama/dakika, genel, 2 ayak atlama, düz atlama",
    ),
    "paRopeSkippingGeneral": MessageLookupByLibrary.simpleMessage("ip atlama"),
    "paRopeSkippingGeneralDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paRugbyCompetitive": MessageLookupByLibrary.simpleMessage("rugby"),
    "paRugbyCompetitiveDesc": MessageLookupByLibrary.simpleMessage(
      "birlik, takım, rekabetçi",
    ),
    "paRugbyNonCompetitive": MessageLookupByLibrary.simpleMessage("rugby"),
    "paRugbyNonCompetitiveDesc": MessageLookupByLibrary.simpleMessage(
      "dokunmatik, rekabetçi olmayan",
    ),
    "paRunningGeneral": MessageLookupByLibrary.simpleMessage("koşu"),
    "paRunningGeneralDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paSailingGeneral": MessageLookupByLibrary.simpleMessage("yelken"),
    "paSailingGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "tekne ve tahta yelken, rüzgar sörfü, buz yelken, genel",
    ),
    "paShuffleboard": MessageLookupByLibrary.simpleMessage("shuffleboard"),
    "paShuffleboardDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paSkateboardingGeneral": MessageLookupByLibrary.simpleMessage("kaykay"),
    "paSkateboardingGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "genel, orta derecede çaba",
    ),
    "paSkatingRoller": MessageLookupByLibrary.simpleMessage("paten kayma"),
    "paSkatingRollerDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paSkiingGeneral": MessageLookupByLibrary.simpleMessage("kayak"),
    "paSkiingGeneralDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paSkiingWaterWakeboarding": MessageLookupByLibrary.simpleMessage(
      "su kayağı",
    ),
    "paSkiingWaterWakeboardingDesc": MessageLookupByLibrary.simpleMessage(
      "su veya wakeboarding",
    ),
    "paSkydiving": MessageLookupByLibrary.simpleMessage("paraşütle atlama"),
    "paSkydivingDesc": MessageLookupByLibrary.simpleMessage(
      "paraşütle atlama, base jumping, bungee jumping",
    ),
    "paSnorkeling": MessageLookupByLibrary.simpleMessage("şnorkelle dalış"),
    "paSnorkelingDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paSnowShovingModerate": MessageLookupByLibrary.simpleMessage("kar küreme"),
    "paSnowShovingModerateDesc": MessageLookupByLibrary.simpleMessage(
      "elle, orta derecede çaba",
    ),
    "paSoccerGeneral": MessageLookupByLibrary.simpleMessage("futbol"),
    "paSoccerGeneralDesc": MessageLookupByLibrary.simpleMessage("rahat, genel"),
    "paSoftballBaseballGeneral": MessageLookupByLibrary.simpleMessage(
      "softbol / beyzbol",
    ),
    "paSoftballBaseballGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "hızlı veya yavaş atış, genel",
    ),
    "paSquashGeneral": MessageLookupByLibrary.simpleMessage("squash"),
    "paSquashGeneralDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paSurfing": MessageLookupByLibrary.simpleMessage("sörf"),
    "paSurfingDesc": MessageLookupByLibrary.simpleMessage(
      "vücut veya tahta, genel",
    ),
    "paSwimmingGeneral": MessageLookupByLibrary.simpleMessage("yüzme"),
    "paSwimmingGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "su üzerinde durma, orta derecede çaba, genel",
    ),
    "paTableTennisGeneral": MessageLookupByLibrary.simpleMessage("masa tenisi"),
    "paTableTennisGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "masa tenisi, ping pong",
    ),
    "paTaiChiQiGongGeneral": MessageLookupByLibrary.simpleMessage(
      "tai chi, qi gong",
    ),
    "paTaiChiQiGongGeneralDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paTennisGeneral": MessageLookupByLibrary.simpleMessage("tenis"),
    "paTennisGeneralDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paTrackField": MessageLookupByLibrary.simpleMessage("atletizm"),
    "paTrackField1Desc": MessageLookupByLibrary.simpleMessage(
      "(ör. gülle, disk, çekiç atma)",
    ),
    "paTrackField2Desc": MessageLookupByLibrary.simpleMessage(
      "(ör. yüksek atlama, uzun atlama, üçlü atlama, cirit, sırıkla atlama)",
    ),
    "paTrackField3Desc": MessageLookupByLibrary.simpleMessage(
      "(ör. engelli koşu, engelli yarış)",
    ),
    "paTrampolineLight": MessageLookupByLibrary.simpleMessage("trambolin"),
    "paTrampolineLightDesc": MessageLookupByLibrary.simpleMessage(
      "eğlence amaçlı",
    ),
    "paUnicyclingGeneral": MessageLookupByLibrary.simpleMessage(
      "tek tekerlekli bisiklet",
    ),
    "paUnicyclingGeneralDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paVolleyballGeneral": MessageLookupByLibrary.simpleMessage("voleybol"),
    "paVolleyballGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "rekabetçi olmayan, 6 - 9 üyeli takım, genel",
    ),
    "paWalkingForPleasure": MessageLookupByLibrary.simpleMessage("yürüyüş"),
    "paWalkingForPleasureDesc": MessageLookupByLibrary.simpleMessage(
      "zevk için",
    ),
    "paWalkingTheDog": MessageLookupByLibrary.simpleMessage("köpeği gezdirmek"),
    "paWalkingTheDogDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paWallyball": MessageLookupByLibrary.simpleMessage("wallyball"),
    "paWallyballDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paWaterAerobics": MessageLookupByLibrary.simpleMessage("su egzersizi"),
    "paWaterAerobicsDesc": MessageLookupByLibrary.simpleMessage(
      "su aerobiği, su kalistenik",
    ),
    "paWaterPolo": MessageLookupByLibrary.simpleMessage("su topu"),
    "paWaterPoloDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paWaterVolleyball": MessageLookupByLibrary.simpleMessage("su voleybolu"),
    "paWaterVolleyballDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "paWateraerobicsCalisthenics": MessageLookupByLibrary.simpleMessage(
      "su aerobiği",
    ),
    "paWateraerobicsCalisthenicsDesc": MessageLookupByLibrary.simpleMessage(
      "su aerobiği, su kalistenik",
    ),
    "paWrestling": MessageLookupByLibrary.simpleMessage("güreş"),
    "paWrestlingDesc": MessageLookupByLibrary.simpleMessage("genel"),
    "palActiveDescriptionLabel": MessageLookupByLibrary.simpleMessage(
      "iş yerinde çoğunlukla ayakta durma veya yürüme ve aktif serbest zaman aktiviteleri",
    ),
    "palActiveLabel": MessageLookupByLibrary.simpleMessage("Aktif"),
    "palExtraActiveDescriptionLabel": MessageLookupByLibrary.simpleMessage(
      "Çok yoğun fiziksel iş ve son derece aktif serbest zaman aktiviteleri",
    ),
    "palExtraActiveLabel": MessageLookupByLibrary.simpleMessage("Ekstra Aktif"),
    "palLowActiveDescriptionLabel": MessageLookupByLibrary.simpleMessage(
      "ör. iş yerinde oturma veya ayakta durma ve hafif serbest zaman aktiviteleri",
    ),
    "palLowLActiveLabel": MessageLookupByLibrary.simpleMessage("Düşük Aktif"),
    "palSedentaryDescriptionLabel": MessageLookupByLibrary.simpleMessage(
      "ör. ofis işi ve çoğunlukla oturarak geçirilen serbest zaman aktiviteleri",
    ),
    "palSedentaryLabel": MessageLookupByLibrary.simpleMessage("Hareketsiz"),
    "palVeryActiveDescriptionLabel": MessageLookupByLibrary.simpleMessage(
      "iş yerinde çoğunlukla yürüme, koşma veya ağırlık taşıma ve aktif serbest zaman aktiviteleri",
    ),
    "palVeryActiveLabel": MessageLookupByLibrary.simpleMessage("Çok Aktif"),
    "per100gmlLabel": MessageLookupByLibrary.simpleMessage("100g/ml başına"),
    "perServingLabel": MessageLookupByLibrary.simpleMessage("Porsiyon Başına"),
    "photoCaptureButton": MessageLookupByLibrary.simpleMessage("Fotoğraf Çek"),
    "photoComparisonTitle": MessageLookupByLibrary.simpleMessage(
      "Önce & Sonra",
    ),
    "photoGalleryButton": MessageLookupByLibrary.simpleMessage("Galeriden Seç"),
    "photoProgressLabel": MessageLookupByLibrary.simpleMessage(
      "Fotoğraf İlerlemesi",
    ),
    "photoProgressSubtitle": MessageLookupByLibrary.simpleMessage(
      "İlerlemeyi fotoğraflarla takip edin",
    ),
    "photoProgressTitle": MessageLookupByLibrary.simpleMessage(
      "Fotoğraf İlerlemesi",
    ),
    "photoTagsHint": MessageLookupByLibrary.simpleMessage("ör. ön, yan"),
    "photoTagsLabel": MessageLookupByLibrary.simpleMessage("Etiketler"),
    "potassiumPer100Label": MessageLookupByLibrary.simpleMessage(
      "Potasyum başına ",
    ),
    "presetCustom": MessageLookupByLibrary.simpleMessage("Özel"),
    "presetEighteenSix": MessageLookupByLibrary.simpleMessage("18:6"),
    "presetOMAD": MessageLookupByLibrary.simpleMessage("OMAD"),
    "presetSixteenEight": MessageLookupByLibrary.simpleMessage("16:8"),
    "presetTwentyFour": MessageLookupByLibrary.simpleMessage("20:4"),
    "privacyPolicyLabel": MessageLookupByLibrary.simpleMessage(
      "Gizlilik politikası",
    ),
    "profileLabel": MessageLookupByLibrary.simpleMessage("Profil"),
    "progressChartsLabel": MessageLookupByLibrary.simpleMessage("İlerleme"),
    "proteinLabel": MessageLookupByLibrary.simpleMessage("protein"),
    "quantityLabel": MessageLookupByLibrary.simpleMessage("Miktar"),
    "readLabel": MessageLookupByLibrary.simpleMessage(
      "Gizlilik politikasını okudum ve kabul ediyorum.",
    ),
    "recentFoodsLabel": MessageLookupByLibrary.simpleMessage("Son Yiyecekler"),
    "recentlyAddedLabel": MessageLookupByLibrary.simpleMessage(
      "Son Eklenenler",
    ),
    "recipeBuilderLabel": MessageLookupByLibrary.simpleMessage(
      "Tarif Oluşturucu",
    ),
    "recipeNameLabel": MessageLookupByLibrary.simpleMessage("Tarif adı"),
    "recipeServingsLabel": MessageLookupByLibrary.simpleMessage("Porsiyon"),
    "remainingBudgetLabel": MessageLookupByLibrary.simpleMessage("Kalan Bütçe"),
    "remainingLabel": MessageLookupByLibrary.simpleMessage("Kalan"),
    "remainingTimeLabel": MessageLookupByLibrary.simpleMessage("Kalan"),
    "reportErrorDialogText": MessageLookupByLibrary.simpleMessage(
      "Geliştiriciye bir hata bildirmek istiyor musunuz?",
    ),
    "retryLabel": MessageLookupByLibrary.simpleMessage("Tekrar Dene"),
    "saturatedFatLabel": MessageLookupByLibrary.simpleMessage("doymuş yağ"),
    "saturatedFatPer100Label": MessageLookupByLibrary.simpleMessage(
      "Doymuş yağ başına ",
    ),
    "saturdayLabel": MessageLookupByLibrary.simpleMessage("Cmt"),
    "save": MessageLookupByLibrary.simpleMessage("Kaydet"),
    "saveRecipeLabel": MessageLookupByLibrary.simpleMessage("Tarifi kaydet"),
    "scanProductLabel": MessageLookupByLibrary.simpleMessage("Ürünü Tara"),
    "searchDefaultLabel": MessageLookupByLibrary.simpleMessage(
      "Lütfen bir arama kelimesi girin",
    ),
    "searchFoodPage": MessageLookupByLibrary.simpleMessage("Yiyecek"),
    "searchLabel": MessageLookupByLibrary.simpleMessage("Ara"),
    "searchProductsPage": MessageLookupByLibrary.simpleMessage("Ürünler"),
    "searchResultsLabel": MessageLookupByLibrary.simpleMessage(
      "Arama sonuçları",
    ),
    "seeAllLabel": MessageLookupByLibrary.simpleMessage("Tümünü Gör"),
    "selectGenderDialogLabel": MessageLookupByLibrary.simpleMessage(
      "Cinsiyet Seçin",
    ),
    "selectHeightDialogLabel": MessageLookupByLibrary.simpleMessage(
      "Boy Seçin",
    ),
    "selectPalCategoryLabel": MessageLookupByLibrary.simpleMessage(
      "Aktivite Seviyesini Seçin",
    ),
    "selectWeightDialogLabel": MessageLookupByLibrary.simpleMessage(
      "Kilo Seçin",
    ),
    "sendAnonymousUserData": MessageLookupByLibrary.simpleMessage(
      "Anonim kullanım verileri gönder",
    ),
    "servingLabel": MessageLookupByLibrary.simpleMessage("Porsiyon"),
    "servingSizeLabelImperial": MessageLookupByLibrary.simpleMessage(
      "Porsiyon boyutu (oz/fl oz)",
    ),
    "servingSizeLabelMetric": MessageLookupByLibrary.simpleMessage(
      "Porsiyon boyutu (g/ml)",
    ),
    "settingAboutLabel": MessageLookupByLibrary.simpleMessage("Hakkında"),
    "settingFeedbackLabel": MessageLookupByLibrary.simpleMessage(
      "Geri Bildirim",
    ),
    "settingsCalculationsLabel": MessageLookupByLibrary.simpleMessage(
      "Hesaplamalar",
    ),
    "settingsDisclaimerLabel": MessageLookupByLibrary.simpleMessage(
      "Sorumluluk Reddi",
    ),
    "settingsDistanceLabel": MessageLookupByLibrary.simpleMessage("Mesafe"),
    "settingsImperialLabel": MessageLookupByLibrary.simpleMessage(
      "İmperial (lbs, ft, oz)",
    ),
    "settingsLabel": MessageLookupByLibrary.simpleMessage("Ayarlar"),
    "settingsLicensesLabel": MessageLookupByLibrary.simpleMessage("Lisanslar"),
    "settingsMassLabel": MessageLookupByLibrary.simpleMessage("Kütle"),
    "settingsMetricLabel": MessageLookupByLibrary.simpleMessage(
      "Metrik (kg, cm, ml)",
    ),
    "settingsPrivacySettings": MessageLookupByLibrary.simpleMessage(
      "Gizlilik Ayarları",
    ),
    "settingsReportErrorLabel": MessageLookupByLibrary.simpleMessage(
      "Hata Bildir",
    ),
    "settingsSourceCodeLabel": MessageLookupByLibrary.simpleMessage(
      "Kaynak Kodu",
    ),
    "settingsSystemLabel": MessageLookupByLibrary.simpleMessage("Sistem"),
    "settingsThemeDarkLabel": MessageLookupByLibrary.simpleMessage("Koyu"),
    "settingsThemeLabel": MessageLookupByLibrary.simpleMessage("Tema"),
    "settingsThemeLightLabel": MessageLookupByLibrary.simpleMessage("Açık"),
    "settingsThemeSystemDefaultLabel": MessageLookupByLibrary.simpleMessage(
      "Sistem varsayılanı",
    ),
    "settingsUnitsLabel": MessageLookupByLibrary.simpleMessage("Birimler"),
    "settingsVolumeLabel": MessageLookupByLibrary.simpleMessage("Hacim"),
    "shoppingListLabel": MessageLookupByLibrary.simpleMessage(
      "Alışveriş Listesi",
    ),
    "snackExample": MessageLookupByLibrary.simpleMessage(
      "ör. elma, dondurma, çikolata ...",
    ),
    "snackLabel": MessageLookupByLibrary.simpleMessage("Atıştırmalık"),
    "sodiumPer100Label": MessageLookupByLibrary.simpleMessage("Sodyum başına "),
    "startFastLabel": MessageLookupByLibrary.simpleMessage("Oruç Başlat"),
    "startWeight": MessageLookupByLibrary.simpleMessage("Başlangıç"),
    "streakLabel": MessageLookupByLibrary.simpleMessage("Seri"),
    "sugarLabel": MessageLookupByLibrary.simpleMessage("şeker"),
    "sugarsPer100Label": MessageLookupByLibrary.simpleMessage("Şeker başına "),
    "summaryTimeLabel": MessageLookupByLibrary.simpleMessage("Özet Zamanı"),
    "sundayLabel": MessageLookupByLibrary.simpleMessage("Paz"),
    "suppliedLabel": MessageLookupByLibrary.simpleMessage("tüketilen"),
    "tdeeLabel": MessageLookupByLibrary.simpleMessage("TDEE"),
    "thighCm": MessageLookupByLibrary.simpleMessage("Uyluk (cm)"),
    "thursdayLabel": MessageLookupByLibrary.simpleMessage("Per"),
    "todayEntries": MessageLookupByLibrary.simpleMessage("Bugün"),
    "tuesdayLabel": MessageLookupByLibrary.simpleMessage("Sal"),
    "unitLabel": MessageLookupByLibrary.simpleMessage("Birim"),
    "viewPhotoLabel": MessageLookupByLibrary.simpleMessage(
      "Fotoğrafı Görüntüle",
    ),
    "waistCm": MessageLookupByLibrary.simpleMessage("Bel (cm)"),
    "waterProgress": m6,
    "waterTrackerTitle": MessageLookupByLibrary.simpleMessage("Su Takipçi"),
    "wednesdayLabel": MessageLookupByLibrary.simpleMessage("Çar"),
    "weeklyCalorieChart": MessageLookupByLibrary.simpleMessage(
      "Haftalık Kaloriler",
    ),
    "weeklyLabel": MessageLookupByLibrary.simpleMessage("Hafta"),
    "weeklySummaryLabel": MessageLookupByLibrary.simpleMessage("Haftalık Özet"),
    "weightKg": MessageLookupByLibrary.simpleMessage("Kilo (kg)"),
    "weightLabel": MessageLookupByLibrary.simpleMessage("Kilo"),
    "weightTab": MessageLookupByLibrary.simpleMessage("Kilo"),
    "weightTracking": MessageLookupByLibrary.simpleMessage("Kilo Takibi"),
    "weightTrend": MessageLookupByLibrary.simpleMessage("Kilo Trendi"),
    "yearsLabel": m7,
  };
}
