import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../extensions/context.dart';
import '../generated/l10n.dart';

class WidgetAsync<T> extends ConsumerWidget {
  final ProviderListenable<AsyncValue<T>> provider;

  final bool skipError, skipLoadingOnReload, skipLoadingOnRefresh;

  final Widget Function(BuildContext context, WidgetRef ref, T data) builder;
  final Widget Function(BuildContext context, Object error, StackTrace stackTrace)? errorBuilder;
  final Widget Function(BuildContext context)? loadingBuilder;

  const WidgetAsync({
    required this.provider,
    required this.builder,
    this.errorBuilder,
    this.loadingBuilder,
    this.skipError = false,
    this.skipLoadingOnReload = false,
    this.skipLoadingOnRefresh = true,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref
        .watch(provider)
        .when<Widget>(
          error: (e, s) => buildError(context, ref, e, s),
          loading: () => buildLoading(context, ref),
          data: (data) => builder(context, ref, data),
          skipError: skipError,
          skipLoadingOnRefresh: skipLoadingOnRefresh,
          skipLoadingOnReload: skipLoadingOnReload,
        );
  }

  Widget buildError(BuildContext context, WidgetRef ref, Object error, StackTrace stackTrace) {
    debugPrintStack(label: error.toString(), stackTrace: stackTrace);

    return errorBuilder?.call(context, error, stackTrace) ??
        Text(
          S.current.somethingWentWrong,
          style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.error),
        );
  }

  Widget buildLoading(BuildContext context, WidgetRef ref) {
    return loadingBuilder?.call(context) ?? const CircularProgressIndicator.adaptive();
  }
}
