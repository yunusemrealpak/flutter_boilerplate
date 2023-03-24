import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../core/localization/locale_keys.g.dart';

class SampleLanguageView extends StatelessWidget {
  const SampleLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample Language View - ${LocaleKeys.appLang.tr()}'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 32),
            child: Text(
              'Current Locale: ${context.locale}',
              style: const TextStyle(fontSize: 24),
            ),
          ),
          const Spacer(),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(LocaleKeys.appLang).tr(),
                ElevatedButton(
                  onPressed: () {
                    context.setLocale(const Locale('en'));
                  },
                  child: const Text('English'),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.setLocale(const Locale('tr'));
                  },
                  child: const Text('Turkish'),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.setLocale(const Locale('ar'));
                  },
                  child: const Text('Arabic'),
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
