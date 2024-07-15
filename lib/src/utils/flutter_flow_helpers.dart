import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:intl/intl.dart';
import 'package:json_path/json_path.dart';
import 'package:timeago/timeago.dart' as timeago;

export 'dart:convert' show jsonDecode, jsonEncode;
export 'dart:math' show max, min;
export 'dart:typed_data' show Uint8List;
export 'package:intl/intl.dart';
export 'package:page_transition/page_transition.dart';
export 'flutter_flow_model.dart';
export 'lat_lng.dart';
export 'place.dart';

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<PageRoute<void>>();

T valueOrDefault<T>(final T? value, final T defaultValue) =>
    (value is String && value.isEmpty) || value == null ? defaultValue : value;

String dateTimeFormat(
  final String format,
  final DateTime? dateTime, {
  final String? locale,
}) {
  if (dateTime == null) {
    return '';
  }
  if (format == 'relative') {
    return timeago.format(dateTime, locale: locale, allowFromNow: true);
  }
  return DateFormat(format, locale).format(dateTime);
}

Color colorFromCssString(final String color, {final Color? defaultColor}) {
  try {
    return fromCssColor(color);
  } on FormatException catch (_) {}
  return defaultColor ?? Colors.black;
}

enum FormatType {
  decimal,
  percent,
  scientific,
  compact,
  compactLong,
  custom,
}

enum DecimalType {
  automatic,
  periodDecimal,
  commaDecimal,
}

String formatNumber(
  final num? value, {
  required final FormatType formatType,
  final DecimalType? decimalType,
  final String? currency,
  final bool toLowerCase = false,
  final String? format,
  final String? locale,
}) {
  if (value == null) {
    return '';
  }
  var formattedValue = '';
  switch (formatType) {
    case FormatType.decimal:
      switch (decimalType!) {
        case DecimalType.automatic:
          formattedValue = NumberFormat.decimalPattern().format(value);
        case DecimalType.periodDecimal:
          formattedValue = NumberFormat.decimalPattern('en_US').format(value);
        case DecimalType.commaDecimal:
          formattedValue = NumberFormat.decimalPattern('es_PA').format(value);
      }
    case FormatType.percent:
      formattedValue = NumberFormat.percentPattern().format(value);
    case FormatType.scientific:
      formattedValue = NumberFormat.scientificPattern().format(value);
      if (toLowerCase) {
        formattedValue = formattedValue.toLowerCase();
      }
    case FormatType.compact:
      formattedValue = NumberFormat.compact().format(value);
    case FormatType.compactLong:
      formattedValue = NumberFormat.compactLong().format(value);
    case FormatType.custom:
      final hasLocale = locale != null && locale.isNotEmpty;
      formattedValue =
          NumberFormat(format, hasLocale ? locale : null).format(value);
  }

  if (formattedValue.isEmpty) {
    return value.toString();
  }

  if (currency != null) {
    final currencySymbol = currency.isNotEmpty
        ? currency
        : NumberFormat.simpleCurrency().format(0.0).substring(0, 1);
    formattedValue = '$currencySymbol$formattedValue';
  }

  return formattedValue;
}

DateTime get getCurrentTimestamp => DateTime.now();
DateTime dateTimeFromSecondsSinceEpoch(final int seconds) =>
    DateTime.fromMillisecondsSinceEpoch(seconds * 1000);

extension DateTimeConversionExtension on DateTime {
  int get secondsSinceEpoch => (millisecondsSinceEpoch / 1000).round();
}

extension DateTimeComparisonOperators on DateTime {
  bool operator <(final DateTime other) => isBefore(other);
  bool operator >(final DateTime other) => isAfter(other);
  bool operator <=(final DateTime other) =>
      this < other || isAtSameMomentAs(other);
  bool operator >=(final DateTime other) =>
      this > other || isAtSameMomentAs(other);
}

dynamic getJsonField(
  final dynamic response,
  final String jsonPath, [
  final bool isForList = false,
]) {
  final field = JsonPath(jsonPath).read(response);
  if (field.isEmpty) {
    return null;
  }
  if (field.length > 1) {
    return field.map((final f) => f.value).toList();
  }
  final value = field.first.value;
  return isForList && value is! Iterable ? [value] : value;
}

Rect? getWidgetBoundingBox(final BuildContext context) {
  try {
    final renderBox = context.findRenderObject() as RenderBox?;
    return renderBox!.localToGlobal(Offset.zero) & renderBox.size;
    // ignore: avoid_catches_without_on_clauses
  } catch (_) {
    return null;
  }
}

bool get isAndroid => !kIsWeb && Platform.isAndroid;
bool get isiOS => !kIsWeb && Platform.isIOS;
bool get isWeb => kIsWeb;

const kBreakpointSmall = 479.0;
const kBreakpointMedium = 767.0;
const kBreakpointLarge = 991.0;
bool isMobileWidth(final BuildContext context) =>
    MediaQuery.sizeOf(context).width < kBreakpointSmall;
bool responsiveVisibility({
  required final BuildContext context,
  final bool phone = true,
  final bool tablet = true,
  final bool tabletLandscape = true,
  final bool desktop = true,
}) {
  final width = MediaQuery.sizeOf(context).width;
  if (width < kBreakpointSmall) {
    return phone;
  } else if (width < kBreakpointMedium) {
    return tablet;
  } else if (width < kBreakpointLarge) {
    return tabletLandscape;
  } else {
    return desktop;
  }
}

const kTextValidatorUsernameRegex = r'^[a-zA-Z][a-zA-Z0-9_-]{2,16}$';
// https://stackoverflow.com/a/201378
const kTextValidatorEmailRegex =
    "^(?:[a-z0-9!#\$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#\$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])\$";
const kTextValidatorWebsiteRegex =
    r'(https?:\/\/)?(www\.)[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,10}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)|(https?:\/\/)?(www\.)?(?!ww)[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,10}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)';

extension FFTextEditingControllerExt on TextEditingController? {
  String get text => this == null ? '' : this!.text;
  set text(final String newText) => this?.text = newText;
}

extension IterableExt<T> on Iterable<T> {
  List<S> mapIndexed<S>(final S Function(int, T) func) => toList()
      .asMap()
      .map((final index, final value) => MapEntry(index, func(index, value)))
      .values
      .toList();
}

void showSnackbar(
  final BuildContext context,
  final String message, {
  final bool loading = false,
  final int duration = 4,
}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          if (loading)
            const Padding(
              padding: EdgeInsetsDirectional.only(end: 10),
              child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
          Text(message),
        ],
      ),
      duration: Duration(seconds: duration),
    ),
  );
}

extension FFStringExt on String {
  String maybeHandleOverflow({
    final int? maxChars,
    final String replacement = '',
  }) =>
      maxChars != null && length > maxChars
          ? replaceRange(maxChars, null, replacement)
          : this;
}

extension ListFilterExt<T> on Iterable<T?> {
  List<T> get withoutNulls =>
      where((final s) => s != null).map((final e) => e!).toList();
}

extension ListDivideExt<T extends Widget> on Iterable<T> {
  Iterable<MapEntry<int, Widget>> get enumerate => toList().asMap().entries;

  List<Widget> divide(final Widget t) => isEmpty
      ? []
      : (enumerate
          .map((final e) => [e.value, t])
          .expand((final i) => i)
          .toList()
        ..removeLast());

  List<Widget> around(final Widget t) => addToStart(t).addToEnd(t);

  List<Widget> addToStart(final Widget t) =>
      enumerate.map((final e) => e.value).toList()..insert(0, t);

  List<Widget> addToEnd(final Widget t) =>
      enumerate.map((final e) => e.value).toList()..add(t);

  List<Padding> paddingTopEach(final double val) =>
      map((final w) => Padding(padding: EdgeInsets.only(top: val), child: w))
          .toList();
}

extension StatefulWidgetExtensions on State<StatefulWidget> {
  /// Check if the widget exist before safely setting state.
  void safeSetState(final VoidCallback fn) {
    if (mounted) {
      // ignore: invalid_use_of_protected_member
      setState(fn);
    }
  }
}
