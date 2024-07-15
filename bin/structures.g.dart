// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'structures.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FlutterflowMergeConfigImpl _$$FlutterflowMergeConfigImplFromJson(
        Map<String, dynamic> json) =>
    _$FlutterflowMergeConfigImpl(
      features: Features.fromJson(json['features'] as Map<String, dynamic>),
      package_name: json['package_name'] as String?,
      source_branch: json['source_branch'] as String? ?? 'flutterflow',
      working_branch: json['working_branch'] as String?,
      dart_targets: (json['dart_targets'] as List<dynamic>?)
              ?.map((e) => MergeTarget.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      other_targets: (json['other_targets'] as List<dynamic>?)
              ?.map((e) => MergeTarget.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      ignore_items: (json['ignore_items'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      replacements: (json['replacements'] as List<dynamic>?)
              ?.map((e) => Replacement.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      function_wraps: (json['function_wraps'] as List<dynamic>?)
              ?.map((e) => FunctionWrap.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$FlutterflowMergeConfigImplToJson(
        _$FlutterflowMergeConfigImpl instance) =>
    <String, dynamic>{
      'features': instance.features.toJson(),
      'package_name': instance.package_name,
      'source_branch': instance.source_branch,
      'working_branch': instance.working_branch,
      'dart_targets': instance.dart_targets.map((e) => e.toJson()).toList(),
      'other_targets': instance.other_targets.map((e) => e.toJson()).toList(),
      'ignore_items': instance.ignore_items,
      'replacements': instance.replacements.map((e) => e.toJson()).toList(),
      'function_wraps': instance.function_wraps.map((e) => e.toJson()).toList(),
    };

_$MergeTargetImpl _$$MergeTargetImplFromJson(Map<String, dynamic> json) =>
    _$MergeTargetImpl(
      source: json['source'] as String,
      destination: json['destination'] as String,
    );

Map<String, dynamic> _$$MergeTargetImplToJson(_$MergeTargetImpl instance) =>
    <String, dynamic>{
      'source': instance.source,
      'destination': instance.destination,
    };

_$FeaturesImpl _$$FeaturesImplFromJson(Map<String, dynamic> json) =>
    _$FeaturesImpl(
      apply_dart_fix: json['apply_dart_fix'] as bool? ?? true,
      void_all_showdialog_widgets:
          json['void_all_showdialog_widgets'] as bool? ?? true,
      check_mounted_on_setstate:
          json['check_mounted_on_setstate'] as bool? ?? false,
    );

Map<String, dynamic> _$$FeaturesImplToJson(_$FeaturesImpl instance) =>
    <String, dynamic>{
      'apply_dart_fix': instance.apply_dart_fix,
      'void_all_showdialog_widgets': instance.void_all_showdialog_widgets,
      'check_mounted_on_setstate': instance.check_mounted_on_setstate,
    };

_$ReplacementImpl _$$ReplacementImplFromJson(Map<String, dynamic> json) =>
    _$ReplacementImpl(
      target: json['target'] as String,
      replacement: json['replacement'] as String,
      regex: json['regex'] as bool? ?? false,
    );

Map<String, dynamic> _$$ReplacementImplToJson(_$ReplacementImpl instance) =>
    <String, dynamic>{
      'target': instance.target,
      'replacement': instance.replacement,
      'regex': instance.regex,
    };

_$FunctionWrapImpl _$$FunctionWrapImplFromJson(Map<String, dynamic> json) =>
    _$FunctionWrapImpl(
      target: json['target'] as String,
      leading: json['leading'] as String,
      trailing: json['trailing'] as String,
      ignore_leadings: (json['ignore_leadings'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$FunctionWrapImplToJson(_$FunctionWrapImpl instance) =>
    <String, dynamic>{
      'target': instance.target,
      'leading': instance.leading,
      'trailing': instance.trailing,
      'ignore_leadings': instance.ignore_leadings,
    };
