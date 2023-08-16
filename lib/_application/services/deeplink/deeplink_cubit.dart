import 'dart:async';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/_common/constants/hive_constants.dart';
import 'package:flutter_boilerplate/_core/storage/hive/i_cache_service.dart';
import 'package:flutter_boilerplate/_domain/cache/model/config.dart';
import 'package:flutter_boilerplate/_domain/deeplink/i_deeplink_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:share_plus/share_plus.dart';

import '../../../_common/enums/dynamic_link_type.dart';
import '../../core/base_cubit.dart';
import 'deeplink_state.dart';

class DeeplinkModel {
  DynamicLinkType? type;
  int? sectionId;
  String? referanceCode;

  DeeplinkModel({
    this.sectionId,
    this.type,
    this.referanceCode,
  });
}

StreamController<DeeplinkModel?> deeplinkStreamController = StreamController<DeeplinkModel?>.broadcast();

@lazySingleton
final class DeeplinkCubit extends BaseCubit<DeeplinkState> {
  final IDeeplinkRepository _deeplinkRepository;
  final ICacheManager<Config> _configManager;
  DeeplinkCubit(
    @Named(HiveConstants.configServiceKey) this._configManager,
    this._deeplinkRepository,
  ) : super(DeeplinkState.initial());

  void init() {
    listenDynamicLinks();
  }

  Future<void> listenDynamicLinks() async {
    try {
      final data = await FirebaseDynamicLinks.instance.getInitialLink();
      final deepLink = data?.link;

      if (deepLink != null) {
        await _handleUrl(deepLink);
      }

      FirebaseDynamicLinks.instance.onLink.listen((PendingDynamicLinkData dynamicLinkData) {
        final uri = dynamicLinkData.link;
        _handleUrl(uri);
      }).onError((error) {});
    } on Exception {
      debugPrint('deeplink exception');
    }
  }

  Future<void> _handleUrl(Uri uri) async {
    final params = uri.queryParameters;
    final type = params['deeplinkType'];

    if (type == null || type.isEmpty) return;

    final linkType = DynamicLinkType.fromValue(int.parse(type));

    switch (linkType) {
      case DynamicLinkType.section:
        final sectionId = params['section'];
        if (sectionId == null) return;

        await Future.delayed(const Duration(seconds: 1), () {});

        final model = DeeplinkModel(
          type: linkType,
          sectionId: int.parse(sectionId),
        );

        deeplinkStreamController.sink.add(model);
        break;
      case DynamicLinkType.profile:
        break;
      case DynamicLinkType.referanceCode:
        final code = params['referansCode'];
        if (code == null) return;

        emit(state.copyWith(referanceCode: code));
        final config = _configManager.getData();
        if (config == null) {
          await _configManager.setData(Config(referanceCode: code));
        } else {
          await _configManager.setData(config.copyWith(referanceCode: code));
        }

        final model = DeeplinkModel(
          type: linkType,
          referanceCode: code,
        );

        deeplinkStreamController.sink.add(model);

        break;
    }
  }

  Future<void> createDynamicLinksAndShare(
    DynamicLinkType type, {
    dynamic section,
    String? referanceCode,
    int? userId,
  }) async {
    const title = '';

    switch (type) {
      case DynamicLinkType.section:
        break;
      case DynamicLinkType.profile:
        break;
      case DynamicLinkType.referanceCode:
        if (referanceCode == null) return;
        break;
    }

    final shortLink = await _deeplinkRepository.createDeeplink(type, data: {});

    if (shortLink == null) return;

    await Share.share(shortLink, subject: title);
  }
}
