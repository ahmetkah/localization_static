import 'package:flutter/material.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/core/core.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    /// Sayfanın iskeletini Scaffold widgeti ile kurduk
    return Scaffold(
      appBar: AppBar(
        /// [AppBar]'ın [title] parametresine sayfanın başlığını verdik
        ///
        title: Text(
          /// Uygulamanın dil dosyalarındaki metinlere iki şekilde erişebiliriz
          /// 1) Yazdığımız [context.translate] metodunu kullanarak
          /// [BuildContext] üzerinden;
          context.translate.general_settings,

          /// 2)[translate()] metodunu kullanarak
          /// [AppLocalizations] sınıfı üzerinden;
          ///  AppLocalizations.of(context)!.general_settings
          /// Kodumuzu daha kısaltığı için biz ilk yöntemi terchi edeceğiz.
        ),
      ),

      /// [body] parametresinde birden fazla elaman vermek ve kaydırma özelliği
      /// kazandırmak için ListView widgeti kullandık.
      body: ListView(
        children: [
          /// [CardWidget] metodu text isimli bir parametre alarak
          /// Card ile sarılmış ListTile widgetini bize döndürecek.
          CardWidget(text: context.translate.account),
          CardWidget(text: context.translate.country),
          CardWidget(text: context.translate.data_usage),
          CardWidget(text: context.translate.display_and_sound),
          CardWidget(text: context.translate.english),
          CardWidget(text: context.translate.general_settings),
          CardWidget(text: context.translate.notifications),
          CardWidget(text: context.translate.permissions),
          CardWidget(text: context.translate.phone_language),
          CardWidget(text: context.translate.privacy),
          CardWidget(text: context.translate.turkish),
        ],
      ),
    );
  }
}

///  ListView'ın children'ına yerleştireceğimiz elemanlarını
/// ortak bir tasarımda olması için bu Widgeti oluşturduk.
class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(text),
        trailing: const Icon(
          Icons.keyboard_arrow_right,
        ),
      ),
    );
  }
}
