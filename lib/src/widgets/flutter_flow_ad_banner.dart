// ignore_for_file: avoid_print

import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutterflow_ui/src/extras.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

/// A widget that displays a banner ad.
class FlutterFlowAdBanner extends StatefulWidget {
  const FlutterFlowAdBanner({
    required this.showsTestAd,
    super.key,
    this.width,
    this.height,
    this.iOSAdUnitID,
    this.androidAdUnitID,
  });

  /// The width of the ad banner.
  final double? width;

  /// The height of the ad banner.
  final double? height;

  /// Whether to show a test ad.
  final bool showsTestAd;

  /// The Ad Unit ID for iOS.
  final String? iOSAdUnitID;

  /// The Ad Unit ID for Android.
  final String? androidAdUnitID;

  @override
  State<FlutterFlowAdBanner> createState() => _FlutterFlowAdBannerState();
}

class _FlutterFlowAdBannerState extends State<FlutterFlowAdBanner> {
  static const AdRequest request = AdRequest();

  BannerAd? _anchoredBanner;
  AdWidget? adWidget;

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((final _) async {
      await _createAnchoredBanner(context);
    });
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    await _anchoredBanner?.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    var loadingText = r'Ad Loading... \n\n';
    if (widget.showsTestAd) {
      loadingText +=
          'If this takes a long time, you may have to check whether the ad is '
          'being covered from a parent widget. For example, a larger width than '
          'the device screen size or a large border radius encompassing the ad banner '
          'may stop ads from loading.\n\n'
          'If a full-width banner is desired for your app, leave the width and '
          'height of the AdBanner widget empty. AdBanner will automatically '
          'match the size of the banner to the device screen.';
    }

    return _anchoredBanner != null && adWidget != null
        ? Container(
            alignment: Alignment.center,
            color: Colors.red,
            width: _anchoredBanner!.size.width.toDouble(),
            height: _anchoredBanner!.size.height.toDouble(),
            child: adWidget,
          )
        : Container(
            color: Colors.black,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                loadingText,
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
            ),
          );
  }

  /// Creates an anchored banner ad.
  Future<void> _createAnchoredBanner(final BuildContext context) async {
    final size = widget.width != null && widget.height != null
        ? AdSize(
            height: widget.height!.toInt(),
            width: widget.width!.toInt(),
          )
        : await AdSize.getAnchoredAdaptiveBannerAdSize(
            widget.width == null ? Orientation.portrait : Orientation.landscape,
            widget.width == null
                ? MediaQuery.sizeOf(context).width.truncate()
                : MediaQuery.sizeOf(context).height.truncate(),
          );

    if (size == null) {
      if (flutterflowPrintDebug) {
        print('Unable to get size of anchored banner.');
      }
      return;
    }

    final isAndroid = !kIsWeb && Platform.isAndroid;
    final banner = BannerAd(
      size: size,
      request: request,
      adUnitId: widget.showsTestAd
          ? isAndroid
              ? 'ca-app-pub-3940256099942544/6300978111'
              : 'ca-app-pub-3940256099942544/2934735716'
          : isAndroid
              ? widget.androidAdUnitID!
              : widget.iOSAdUnitID!,
      listener: BannerAdListener(
        onAdLoaded: (final ad) {
          if (flutterflowPrintDebug) {
            print(r'$BannerAd loaded.');
          }
          if (mounted) {
            setState(() => _anchoredBanner = ad as BannerAd);
          }
        },
        onAdFailedToLoad: (final ad, final error) {
          if (flutterflowPrintDebug) {
            print(r'$BannerAd failedToLoad: $error');
          }
          ad.dispose();
        },
        onAdOpened: (final ad) {
          if (flutterflowPrintDebug) {
            print(r'$BannerAd onAdOpened.');
          }
        },
        onAdClosed: (final ad) {
          if (flutterflowPrintDebug) {
            print(r'$BannerAd onAdClosed.');
          }
        },
      ),
    );
    await banner.load();

    adWidget = AdWidget(ad: banner);
    setState(() {});
    return;
  }
}
