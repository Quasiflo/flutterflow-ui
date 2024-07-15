// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:pubspec_yaml/pubspec_yaml.dart';
import './structures.dart';

Future<FlutterflowMergeConfig> parseConfig() async {
  final pubspecYaml = File('pubspec.yaml').readAsStringSync().toPubspecYaml();

  final customSettings = pubspecYaml.customFields;

  if (!customSettings.containsKey('flutterflow_merge')) {
    throw Exception(
      'The required "flutterflow_merge" key is not found in the pubspec.yaml file.',
    );
  }

  var config = FlutterflowMergeConfig.fromJson(
    customSettings['flutterflow_merge'] as Map<String, dynamic>,
  );

  if (config.package_name == null) {
    config = config.copyWith(package_name: pubspecYaml.name);
  }

  if (config.working_branch == null) {
    config = config.copyWith(working_branch: await getCurrentBranch());
  }

  return config;
}

Future<String> getCurrentBranch() async {
  final branchResult =
      await Process.run('git', ['rev-parse', '--abbrev-ref', 'HEAD']);
  if (branchResult.exitCode != 0) {
    print('Failed to get current branch: ${branchResult.stderr}');
    exit(1);
  }
  return (branchResult.stdout as String).trim();
}
