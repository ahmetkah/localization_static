import 'dart:developer' show log;

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'view/view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Localization',
      debugShowCheckedModeBanner: false,

      /// Delegate: Temsilci Listesi
      localizationsDelegates: AppLocalizations.localizationsDelegates,

      /// Desteklenen Diller
      supportedLocales: AppLocalizations.supportedLocales,

      localeResolutionCallback:
          (Locale? locale, Iterable<Locale> supportedLocales) {
        /// [locale]: Cihazın dili null değilse
        if (locale != null) {
          log("Algılanan cihaz dili: Dil Kodu: ${locale.languageCode}, Ülke Kodu: ${locale.countryCode}");

          /// for döngüsü yardımıyla [supportedLocales] listesi içinde arama yapıyoruz
          for (var supportedLocale in supportedLocales) {
            /// Cihazın dil kodu [locale.languageCode] ve ülke kodu [locale.countryCode]
            /// desteklenen diller arasındaki dil ve ülke kodlarının içinde [supportedLocale] var mı?
            if (supportedLocale.languageCode == locale.languageCode &&
                locale.countryCode == locale.countryCode) {
              /// Varsa desteklenen dili döndür
              return supportedLocale;
            }
          }
        }
        log("Algılanan cihaz dili desteklenen diller arasında bulunmuyor.");

        /// Yoksa [supportedLocales] Listesindeki ilk sonucu döndür.
        log("Uygulamanın başlatılması istenen dil: Dil Kodu: ${supportedLocales.first.languageCode}, Ülke Kodu: ${supportedLocales.first.countryCode}");
        return supportedLocales.first;
      },
      home: const SettingsView(),
    );
  }
}
