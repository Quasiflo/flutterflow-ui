// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'structures.freezed.dart';
part 'structures.g.dart';

@freezed
class FlutterflowMergeConfig with _$FlutterflowMergeConfig {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory FlutterflowMergeConfig({
    required final Features features,
    final String? package_name,
    @Default('flutterflow') final String source_branch,
    final String? working_branch,
    @Default([]) final List<MergeTarget> dart_targets,
    @Default([]) final List<MergeTarget> other_targets,
    @Default([]) final List<String> ignore_items,
    @Default([]) final List<Replacement> replacements,
    @Default([]) final List<FunctionWrap> function_wraps,
  }) = _FlutterflowMergeConfig;
  const FlutterflowMergeConfig._();

  factory FlutterflowMergeConfig.fromJson(final Map<String, dynamic> json) =>
      _$FlutterflowMergeConfigFromJson(json);
}

@freezed
class MergeTarget with _$MergeTarget {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory MergeTarget({
    required final String source,
    required final String destination,
  }) = _MergeTarget;
  const MergeTarget._();

  factory MergeTarget.fromJson(final Map<String, dynamic> json) =>
      _$MergeTargetFromJson(json);
}

@freezed
class Features with _$Features {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory Features({
    @Default(true) final bool apply_dart_fix,
    @Default(true) final bool void_all_showdialog_widgets,
    @Default(false) final bool check_mounted_on_setstate,
  }) = _Features;
  const Features._();

  factory Features.fromJson(final Map<String, dynamic> json) =>
      _$FeaturesFromJson(json);
}

@freezed
class Replacement with _$Replacement {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory Replacement({
    required final String target,
    required final String replacement,
    @Default(false) final bool regex,
  }) = _Replacement;
  const Replacement._();

  factory Replacement.fromJson(final Map<String, dynamic> json) =>
      _$ReplacementFromJson(json);
}

@freezed
class FunctionWrap with _$FunctionWrap {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory FunctionWrap({
    required final String target,
    required final String leading,
    required final String trailing,
    @Default([]) final List<String> ignore_leadings,
  }) = _FunctionWrap;
  const FunctionWrap._();

  factory FunctionWrap.fromJson(final Map<String, dynamic> json) =>
      _$FunctionWrapFromJson(json);
}
