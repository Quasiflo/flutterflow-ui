// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'structures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FlutterflowMergeConfig _$FlutterflowMergeConfigFromJson(
    Map<String, dynamic> json) {
  return _FlutterflowMergeConfig.fromJson(json);
}

/// @nodoc
mixin _$FlutterflowMergeConfig {
  Features get features => throw _privateConstructorUsedError;
  String? get package_name => throw _privateConstructorUsedError;
  String get source_branch => throw _privateConstructorUsedError;
  String? get working_branch => throw _privateConstructorUsedError;
  List<MergeTarget> get dart_targets => throw _privateConstructorUsedError;
  List<MergeTarget> get other_targets => throw _privateConstructorUsedError;
  List<String> get ignore_items => throw _privateConstructorUsedError;
  List<Replacement> get replacements => throw _privateConstructorUsedError;
  List<FunctionWrap> get function_wraps => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlutterflowMergeConfigCopyWith<FlutterflowMergeConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlutterflowMergeConfigCopyWith<$Res> {
  factory $FlutterflowMergeConfigCopyWith(FlutterflowMergeConfig value,
          $Res Function(FlutterflowMergeConfig) then) =
      _$FlutterflowMergeConfigCopyWithImpl<$Res, FlutterflowMergeConfig>;
  @useResult
  $Res call(
      {Features features,
      String? package_name,
      String source_branch,
      String? working_branch,
      List<MergeTarget> dart_targets,
      List<MergeTarget> other_targets,
      List<String> ignore_items,
      List<Replacement> replacements,
      List<FunctionWrap> function_wraps});

  $FeaturesCopyWith<$Res> get features;
}

/// @nodoc
class _$FlutterflowMergeConfigCopyWithImpl<$Res,
        $Val extends FlutterflowMergeConfig>
    implements $FlutterflowMergeConfigCopyWith<$Res> {
  _$FlutterflowMergeConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? features = null,
    Object? package_name = freezed,
    Object? source_branch = null,
    Object? working_branch = freezed,
    Object? dart_targets = null,
    Object? other_targets = null,
    Object? ignore_items = null,
    Object? replacements = null,
    Object? function_wraps = null,
  }) {
    return _then(_value.copyWith(
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as Features,
      package_name: freezed == package_name
          ? _value.package_name
          : package_name // ignore: cast_nullable_to_non_nullable
              as String?,
      source_branch: null == source_branch
          ? _value.source_branch
          : source_branch // ignore: cast_nullable_to_non_nullable
              as String,
      working_branch: freezed == working_branch
          ? _value.working_branch
          : working_branch // ignore: cast_nullable_to_non_nullable
              as String?,
      dart_targets: null == dart_targets
          ? _value.dart_targets
          : dart_targets // ignore: cast_nullable_to_non_nullable
              as List<MergeTarget>,
      other_targets: null == other_targets
          ? _value.other_targets
          : other_targets // ignore: cast_nullable_to_non_nullable
              as List<MergeTarget>,
      ignore_items: null == ignore_items
          ? _value.ignore_items
          : ignore_items // ignore: cast_nullable_to_non_nullable
              as List<String>,
      replacements: null == replacements
          ? _value.replacements
          : replacements // ignore: cast_nullable_to_non_nullable
              as List<Replacement>,
      function_wraps: null == function_wraps
          ? _value.function_wraps
          : function_wraps // ignore: cast_nullable_to_non_nullable
              as List<FunctionWrap>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FeaturesCopyWith<$Res> get features {
    return $FeaturesCopyWith<$Res>(_value.features, (value) {
      return _then(_value.copyWith(features: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FlutterflowMergeConfigImplCopyWith<$Res>
    implements $FlutterflowMergeConfigCopyWith<$Res> {
  factory _$$FlutterflowMergeConfigImplCopyWith(
          _$FlutterflowMergeConfigImpl value,
          $Res Function(_$FlutterflowMergeConfigImpl) then) =
      __$$FlutterflowMergeConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Features features,
      String? package_name,
      String source_branch,
      String? working_branch,
      List<MergeTarget> dart_targets,
      List<MergeTarget> other_targets,
      List<String> ignore_items,
      List<Replacement> replacements,
      List<FunctionWrap> function_wraps});

  @override
  $FeaturesCopyWith<$Res> get features;
}

/// @nodoc
class __$$FlutterflowMergeConfigImplCopyWithImpl<$Res>
    extends _$FlutterflowMergeConfigCopyWithImpl<$Res,
        _$FlutterflowMergeConfigImpl>
    implements _$$FlutterflowMergeConfigImplCopyWith<$Res> {
  __$$FlutterflowMergeConfigImplCopyWithImpl(
      _$FlutterflowMergeConfigImpl _value,
      $Res Function(_$FlutterflowMergeConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? features = null,
    Object? package_name = freezed,
    Object? source_branch = null,
    Object? working_branch = freezed,
    Object? dart_targets = null,
    Object? other_targets = null,
    Object? ignore_items = null,
    Object? replacements = null,
    Object? function_wraps = null,
  }) {
    return _then(_$FlutterflowMergeConfigImpl(
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as Features,
      package_name: freezed == package_name
          ? _value.package_name
          : package_name // ignore: cast_nullable_to_non_nullable
              as String?,
      source_branch: null == source_branch
          ? _value.source_branch
          : source_branch // ignore: cast_nullable_to_non_nullable
              as String,
      working_branch: freezed == working_branch
          ? _value.working_branch
          : working_branch // ignore: cast_nullable_to_non_nullable
              as String?,
      dart_targets: null == dart_targets
          ? _value._dart_targets
          : dart_targets // ignore: cast_nullable_to_non_nullable
              as List<MergeTarget>,
      other_targets: null == other_targets
          ? _value._other_targets
          : other_targets // ignore: cast_nullable_to_non_nullable
              as List<MergeTarget>,
      ignore_items: null == ignore_items
          ? _value._ignore_items
          : ignore_items // ignore: cast_nullable_to_non_nullable
              as List<String>,
      replacements: null == replacements
          ? _value._replacements
          : replacements // ignore: cast_nullable_to_non_nullable
              as List<Replacement>,
      function_wraps: null == function_wraps
          ? _value._function_wraps
          : function_wraps // ignore: cast_nullable_to_non_nullable
              as List<FunctionWrap>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$FlutterflowMergeConfigImpl extends _FlutterflowMergeConfig {
  const _$FlutterflowMergeConfigImpl(
      {required this.features,
      this.package_name,
      this.source_branch = 'flutterflow',
      this.working_branch,
      final List<MergeTarget> dart_targets = const [],
      final List<MergeTarget> other_targets = const [],
      final List<String> ignore_items = const [],
      final List<Replacement> replacements = const [],
      final List<FunctionWrap> function_wraps = const []})
      : _dart_targets = dart_targets,
        _other_targets = other_targets,
        _ignore_items = ignore_items,
        _replacements = replacements,
        _function_wraps = function_wraps,
        super._();

  factory _$FlutterflowMergeConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlutterflowMergeConfigImplFromJson(json);

  @override
  final Features features;
  @override
  final String? package_name;
  @override
  @JsonKey()
  final String source_branch;
  @override
  final String? working_branch;
  final List<MergeTarget> _dart_targets;
  @override
  @JsonKey()
  List<MergeTarget> get dart_targets {
    if (_dart_targets is EqualUnmodifiableListView) return _dart_targets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dart_targets);
  }

  final List<MergeTarget> _other_targets;
  @override
  @JsonKey()
  List<MergeTarget> get other_targets {
    if (_other_targets is EqualUnmodifiableListView) return _other_targets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_other_targets);
  }

  final List<String> _ignore_items;
  @override
  @JsonKey()
  List<String> get ignore_items {
    if (_ignore_items is EqualUnmodifiableListView) return _ignore_items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ignore_items);
  }

  final List<Replacement> _replacements;
  @override
  @JsonKey()
  List<Replacement> get replacements {
    if (_replacements is EqualUnmodifiableListView) return _replacements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_replacements);
  }

  final List<FunctionWrap> _function_wraps;
  @override
  @JsonKey()
  List<FunctionWrap> get function_wraps {
    if (_function_wraps is EqualUnmodifiableListView) return _function_wraps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_function_wraps);
  }

  @override
  String toString() {
    return 'FlutterflowMergeConfig(features: $features, package_name: $package_name, source_branch: $source_branch, working_branch: $working_branch, dart_targets: $dart_targets, other_targets: $other_targets, ignore_items: $ignore_items, replacements: $replacements, function_wraps: $function_wraps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlutterflowMergeConfigImpl &&
            (identical(other.features, features) ||
                other.features == features) &&
            (identical(other.package_name, package_name) ||
                other.package_name == package_name) &&
            (identical(other.source_branch, source_branch) ||
                other.source_branch == source_branch) &&
            (identical(other.working_branch, working_branch) ||
                other.working_branch == working_branch) &&
            const DeepCollectionEquality()
                .equals(other._dart_targets, _dart_targets) &&
            const DeepCollectionEquality()
                .equals(other._other_targets, _other_targets) &&
            const DeepCollectionEquality()
                .equals(other._ignore_items, _ignore_items) &&
            const DeepCollectionEquality()
                .equals(other._replacements, _replacements) &&
            const DeepCollectionEquality()
                .equals(other._function_wraps, _function_wraps));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      features,
      package_name,
      source_branch,
      working_branch,
      const DeepCollectionEquality().hash(_dart_targets),
      const DeepCollectionEquality().hash(_other_targets),
      const DeepCollectionEquality().hash(_ignore_items),
      const DeepCollectionEquality().hash(_replacements),
      const DeepCollectionEquality().hash(_function_wraps));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FlutterflowMergeConfigImplCopyWith<_$FlutterflowMergeConfigImpl>
      get copyWith => __$$FlutterflowMergeConfigImplCopyWithImpl<
          _$FlutterflowMergeConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlutterflowMergeConfigImplToJson(
      this,
    );
  }
}

abstract class _FlutterflowMergeConfig extends FlutterflowMergeConfig {
  const factory _FlutterflowMergeConfig(
      {required final Features features,
      final String? package_name,
      final String source_branch,
      final String? working_branch,
      final List<MergeTarget> dart_targets,
      final List<MergeTarget> other_targets,
      final List<String> ignore_items,
      final List<Replacement> replacements,
      final List<FunctionWrap> function_wraps}) = _$FlutterflowMergeConfigImpl;
  const _FlutterflowMergeConfig._() : super._();

  factory _FlutterflowMergeConfig.fromJson(Map<String, dynamic> json) =
      _$FlutterflowMergeConfigImpl.fromJson;

  @override
  Features get features;
  @override
  String? get package_name;
  @override
  String get source_branch;
  @override
  String? get working_branch;
  @override
  List<MergeTarget> get dart_targets;
  @override
  List<MergeTarget> get other_targets;
  @override
  List<String> get ignore_items;
  @override
  List<Replacement> get replacements;
  @override
  List<FunctionWrap> get function_wraps;
  @override
  @JsonKey(ignore: true)
  _$$FlutterflowMergeConfigImplCopyWith<_$FlutterflowMergeConfigImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MergeTarget _$MergeTargetFromJson(Map<String, dynamic> json) {
  return _MergeTarget.fromJson(json);
}

/// @nodoc
mixin _$MergeTarget {
  String get source => throw _privateConstructorUsedError;
  String get destination => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MergeTargetCopyWith<MergeTarget> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MergeTargetCopyWith<$Res> {
  factory $MergeTargetCopyWith(
          MergeTarget value, $Res Function(MergeTarget) then) =
      _$MergeTargetCopyWithImpl<$Res, MergeTarget>;
  @useResult
  $Res call({String source, String destination});
}

/// @nodoc
class _$MergeTargetCopyWithImpl<$Res, $Val extends MergeTarget>
    implements $MergeTargetCopyWith<$Res> {
  _$MergeTargetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? destination = null,
  }) {
    return _then(_value.copyWith(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MergeTargetImplCopyWith<$Res>
    implements $MergeTargetCopyWith<$Res> {
  factory _$$MergeTargetImplCopyWith(
          _$MergeTargetImpl value, $Res Function(_$MergeTargetImpl) then) =
      __$$MergeTargetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String source, String destination});
}

/// @nodoc
class __$$MergeTargetImplCopyWithImpl<$Res>
    extends _$MergeTargetCopyWithImpl<$Res, _$MergeTargetImpl>
    implements _$$MergeTargetImplCopyWith<$Res> {
  __$$MergeTargetImplCopyWithImpl(
      _$MergeTargetImpl _value, $Res Function(_$MergeTargetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? destination = null,
  }) {
    return _then(_$MergeTargetImpl(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$MergeTargetImpl extends _MergeTarget {
  const _$MergeTargetImpl({required this.source, required this.destination})
      : super._();

  factory _$MergeTargetImpl.fromJson(Map<String, dynamic> json) =>
      _$$MergeTargetImplFromJson(json);

  @override
  final String source;
  @override
  final String destination;

  @override
  String toString() {
    return 'MergeTarget(source: $source, destination: $destination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MergeTargetImpl &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.destination, destination) ||
                other.destination == destination));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, source, destination);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MergeTargetImplCopyWith<_$MergeTargetImpl> get copyWith =>
      __$$MergeTargetImplCopyWithImpl<_$MergeTargetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MergeTargetImplToJson(
      this,
    );
  }
}

abstract class _MergeTarget extends MergeTarget {
  const factory _MergeTarget(
      {required final String source,
      required final String destination}) = _$MergeTargetImpl;
  const _MergeTarget._() : super._();

  factory _MergeTarget.fromJson(Map<String, dynamic> json) =
      _$MergeTargetImpl.fromJson;

  @override
  String get source;
  @override
  String get destination;
  @override
  @JsonKey(ignore: true)
  _$$MergeTargetImplCopyWith<_$MergeTargetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Features _$FeaturesFromJson(Map<String, dynamic> json) {
  return _Features.fromJson(json);
}

/// @nodoc
mixin _$Features {
  bool get apply_dart_fix => throw _privateConstructorUsedError;
  bool get void_all_showdialog_widgets => throw _privateConstructorUsedError;
  bool get check_mounted_on_setstate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeaturesCopyWith<Features> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeaturesCopyWith<$Res> {
  factory $FeaturesCopyWith(Features value, $Res Function(Features) then) =
      _$FeaturesCopyWithImpl<$Res, Features>;
  @useResult
  $Res call(
      {bool apply_dart_fix,
      bool void_all_showdialog_widgets,
      bool check_mounted_on_setstate});
}

/// @nodoc
class _$FeaturesCopyWithImpl<$Res, $Val extends Features>
    implements $FeaturesCopyWith<$Res> {
  _$FeaturesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apply_dart_fix = null,
    Object? void_all_showdialog_widgets = null,
    Object? check_mounted_on_setstate = null,
  }) {
    return _then(_value.copyWith(
      apply_dart_fix: null == apply_dart_fix
          ? _value.apply_dart_fix
          : apply_dart_fix // ignore: cast_nullable_to_non_nullable
              as bool,
      void_all_showdialog_widgets: null == void_all_showdialog_widgets
          ? _value.void_all_showdialog_widgets
          : void_all_showdialog_widgets // ignore: cast_nullable_to_non_nullable
              as bool,
      check_mounted_on_setstate: null == check_mounted_on_setstate
          ? _value.check_mounted_on_setstate
          : check_mounted_on_setstate // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeaturesImplCopyWith<$Res>
    implements $FeaturesCopyWith<$Res> {
  factory _$$FeaturesImplCopyWith(
          _$FeaturesImpl value, $Res Function(_$FeaturesImpl) then) =
      __$$FeaturesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool apply_dart_fix,
      bool void_all_showdialog_widgets,
      bool check_mounted_on_setstate});
}

/// @nodoc
class __$$FeaturesImplCopyWithImpl<$Res>
    extends _$FeaturesCopyWithImpl<$Res, _$FeaturesImpl>
    implements _$$FeaturesImplCopyWith<$Res> {
  __$$FeaturesImplCopyWithImpl(
      _$FeaturesImpl _value, $Res Function(_$FeaturesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apply_dart_fix = null,
    Object? void_all_showdialog_widgets = null,
    Object? check_mounted_on_setstate = null,
  }) {
    return _then(_$FeaturesImpl(
      apply_dart_fix: null == apply_dart_fix
          ? _value.apply_dart_fix
          : apply_dart_fix // ignore: cast_nullable_to_non_nullable
              as bool,
      void_all_showdialog_widgets: null == void_all_showdialog_widgets
          ? _value.void_all_showdialog_widgets
          : void_all_showdialog_widgets // ignore: cast_nullable_to_non_nullable
              as bool,
      check_mounted_on_setstate: null == check_mounted_on_setstate
          ? _value.check_mounted_on_setstate
          : check_mounted_on_setstate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$FeaturesImpl extends _Features {
  const _$FeaturesImpl(
      {this.apply_dart_fix = true,
      this.void_all_showdialog_widgets = true,
      this.check_mounted_on_setstate = false})
      : super._();

  factory _$FeaturesImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeaturesImplFromJson(json);

  @override
  @JsonKey()
  final bool apply_dart_fix;
  @override
  @JsonKey()
  final bool void_all_showdialog_widgets;
  @override
  @JsonKey()
  final bool check_mounted_on_setstate;

  @override
  String toString() {
    return 'Features(apply_dart_fix: $apply_dart_fix, void_all_showdialog_widgets: $void_all_showdialog_widgets, check_mounted_on_setstate: $check_mounted_on_setstate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeaturesImpl &&
            (identical(other.apply_dart_fix, apply_dart_fix) ||
                other.apply_dart_fix == apply_dart_fix) &&
            (identical(other.void_all_showdialog_widgets,
                    void_all_showdialog_widgets) ||
                other.void_all_showdialog_widgets ==
                    void_all_showdialog_widgets) &&
            (identical(other.check_mounted_on_setstate,
                    check_mounted_on_setstate) ||
                other.check_mounted_on_setstate == check_mounted_on_setstate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, apply_dart_fix,
      void_all_showdialog_widgets, check_mounted_on_setstate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeaturesImplCopyWith<_$FeaturesImpl> get copyWith =>
      __$$FeaturesImplCopyWithImpl<_$FeaturesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeaturesImplToJson(
      this,
    );
  }
}

abstract class _Features extends Features {
  const factory _Features(
      {final bool apply_dart_fix,
      final bool void_all_showdialog_widgets,
      final bool check_mounted_on_setstate}) = _$FeaturesImpl;
  const _Features._() : super._();

  factory _Features.fromJson(Map<String, dynamic> json) =
      _$FeaturesImpl.fromJson;

  @override
  bool get apply_dart_fix;
  @override
  bool get void_all_showdialog_widgets;
  @override
  bool get check_mounted_on_setstate;
  @override
  @JsonKey(ignore: true)
  _$$FeaturesImplCopyWith<_$FeaturesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Replacement _$ReplacementFromJson(Map<String, dynamic> json) {
  return _Replacement.fromJson(json);
}

/// @nodoc
mixin _$Replacement {
  String get target => throw _privateConstructorUsedError;
  String get replacement => throw _privateConstructorUsedError;
  bool get regex => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReplacementCopyWith<Replacement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReplacementCopyWith<$Res> {
  factory $ReplacementCopyWith(
          Replacement value, $Res Function(Replacement) then) =
      _$ReplacementCopyWithImpl<$Res, Replacement>;
  @useResult
  $Res call({String target, String replacement, bool regex});
}

/// @nodoc
class _$ReplacementCopyWithImpl<$Res, $Val extends Replacement>
    implements $ReplacementCopyWith<$Res> {
  _$ReplacementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? target = null,
    Object? replacement = null,
    Object? regex = null,
  }) {
    return _then(_value.copyWith(
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String,
      replacement: null == replacement
          ? _value.replacement
          : replacement // ignore: cast_nullable_to_non_nullable
              as String,
      regex: null == regex
          ? _value.regex
          : regex // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReplacementImplCopyWith<$Res>
    implements $ReplacementCopyWith<$Res> {
  factory _$$ReplacementImplCopyWith(
          _$ReplacementImpl value, $Res Function(_$ReplacementImpl) then) =
      __$$ReplacementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String target, String replacement, bool regex});
}

/// @nodoc
class __$$ReplacementImplCopyWithImpl<$Res>
    extends _$ReplacementCopyWithImpl<$Res, _$ReplacementImpl>
    implements _$$ReplacementImplCopyWith<$Res> {
  __$$ReplacementImplCopyWithImpl(
      _$ReplacementImpl _value, $Res Function(_$ReplacementImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? target = null,
    Object? replacement = null,
    Object? regex = null,
  }) {
    return _then(_$ReplacementImpl(
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String,
      replacement: null == replacement
          ? _value.replacement
          : replacement // ignore: cast_nullable_to_non_nullable
              as String,
      regex: null == regex
          ? _value.regex
          : regex // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ReplacementImpl extends _Replacement {
  const _$ReplacementImpl(
      {required this.target, required this.replacement, this.regex = false})
      : super._();

  factory _$ReplacementImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReplacementImplFromJson(json);

  @override
  final String target;
  @override
  final String replacement;
  @override
  @JsonKey()
  final bool regex;

  @override
  String toString() {
    return 'Replacement(target: $target, replacement: $replacement, regex: $regex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReplacementImpl &&
            (identical(other.target, target) || other.target == target) &&
            (identical(other.replacement, replacement) ||
                other.replacement == replacement) &&
            (identical(other.regex, regex) || other.regex == regex));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, target, replacement, regex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReplacementImplCopyWith<_$ReplacementImpl> get copyWith =>
      __$$ReplacementImplCopyWithImpl<_$ReplacementImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReplacementImplToJson(
      this,
    );
  }
}

abstract class _Replacement extends Replacement {
  const factory _Replacement(
      {required final String target,
      required final String replacement,
      final bool regex}) = _$ReplacementImpl;
  const _Replacement._() : super._();

  factory _Replacement.fromJson(Map<String, dynamic> json) =
      _$ReplacementImpl.fromJson;

  @override
  String get target;
  @override
  String get replacement;
  @override
  bool get regex;
  @override
  @JsonKey(ignore: true)
  _$$ReplacementImplCopyWith<_$ReplacementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FunctionWrap _$FunctionWrapFromJson(Map<String, dynamic> json) {
  return _FunctionWrap.fromJson(json);
}

/// @nodoc
mixin _$FunctionWrap {
  String get target => throw _privateConstructorUsedError;
  String get leading => throw _privateConstructorUsedError;
  String get trailing => throw _privateConstructorUsedError;
  List<String> get ignore_leadings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FunctionWrapCopyWith<FunctionWrap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FunctionWrapCopyWith<$Res> {
  factory $FunctionWrapCopyWith(
          FunctionWrap value, $Res Function(FunctionWrap) then) =
      _$FunctionWrapCopyWithImpl<$Res, FunctionWrap>;
  @useResult
  $Res call(
      {String target,
      String leading,
      String trailing,
      List<String> ignore_leadings});
}

/// @nodoc
class _$FunctionWrapCopyWithImpl<$Res, $Val extends FunctionWrap>
    implements $FunctionWrapCopyWith<$Res> {
  _$FunctionWrapCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? target = null,
    Object? leading = null,
    Object? trailing = null,
    Object? ignore_leadings = null,
  }) {
    return _then(_value.copyWith(
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String,
      leading: null == leading
          ? _value.leading
          : leading // ignore: cast_nullable_to_non_nullable
              as String,
      trailing: null == trailing
          ? _value.trailing
          : trailing // ignore: cast_nullable_to_non_nullable
              as String,
      ignore_leadings: null == ignore_leadings
          ? _value.ignore_leadings
          : ignore_leadings // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FunctionWrapImplCopyWith<$Res>
    implements $FunctionWrapCopyWith<$Res> {
  factory _$$FunctionWrapImplCopyWith(
          _$FunctionWrapImpl value, $Res Function(_$FunctionWrapImpl) then) =
      __$$FunctionWrapImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String target,
      String leading,
      String trailing,
      List<String> ignore_leadings});
}

/// @nodoc
class __$$FunctionWrapImplCopyWithImpl<$Res>
    extends _$FunctionWrapCopyWithImpl<$Res, _$FunctionWrapImpl>
    implements _$$FunctionWrapImplCopyWith<$Res> {
  __$$FunctionWrapImplCopyWithImpl(
      _$FunctionWrapImpl _value, $Res Function(_$FunctionWrapImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? target = null,
    Object? leading = null,
    Object? trailing = null,
    Object? ignore_leadings = null,
  }) {
    return _then(_$FunctionWrapImpl(
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String,
      leading: null == leading
          ? _value.leading
          : leading // ignore: cast_nullable_to_non_nullable
              as String,
      trailing: null == trailing
          ? _value.trailing
          : trailing // ignore: cast_nullable_to_non_nullable
              as String,
      ignore_leadings: null == ignore_leadings
          ? _value._ignore_leadings
          : ignore_leadings // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$FunctionWrapImpl extends _FunctionWrap {
  const _$FunctionWrapImpl(
      {required this.target,
      required this.leading,
      required this.trailing,
      final List<String> ignore_leadings = const []})
      : _ignore_leadings = ignore_leadings,
        super._();

  factory _$FunctionWrapImpl.fromJson(Map<String, dynamic> json) =>
      _$$FunctionWrapImplFromJson(json);

  @override
  final String target;
  @override
  final String leading;
  @override
  final String trailing;
  final List<String> _ignore_leadings;
  @override
  @JsonKey()
  List<String> get ignore_leadings {
    if (_ignore_leadings is EqualUnmodifiableListView) return _ignore_leadings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ignore_leadings);
  }

  @override
  String toString() {
    return 'FunctionWrap(target: $target, leading: $leading, trailing: $trailing, ignore_leadings: $ignore_leadings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FunctionWrapImpl &&
            (identical(other.target, target) || other.target == target) &&
            (identical(other.leading, leading) || other.leading == leading) &&
            (identical(other.trailing, trailing) ||
                other.trailing == trailing) &&
            const DeepCollectionEquality()
                .equals(other._ignore_leadings, _ignore_leadings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, target, leading, trailing,
      const DeepCollectionEquality().hash(_ignore_leadings));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FunctionWrapImplCopyWith<_$FunctionWrapImpl> get copyWith =>
      __$$FunctionWrapImplCopyWithImpl<_$FunctionWrapImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FunctionWrapImplToJson(
      this,
    );
  }
}

abstract class _FunctionWrap extends FunctionWrap {
  const factory _FunctionWrap(
      {required final String target,
      required final String leading,
      required final String trailing,
      final List<String> ignore_leadings}) = _$FunctionWrapImpl;
  const _FunctionWrap._() : super._();

  factory _FunctionWrap.fromJson(Map<String, dynamic> json) =
      _$FunctionWrapImpl.fromJson;

  @override
  String get target;
  @override
  String get leading;
  @override
  String get trailing;
  @override
  List<String> get ignore_leadings;
  @override
  @JsonKey(ignore: true)
  _$$FunctionWrapImplCopyWith<_$FunctionWrapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
