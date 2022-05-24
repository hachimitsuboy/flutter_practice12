import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

final loadingProvider = StateProvider<bool>((ref) => false);

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loadType = ref.watch(loadingProvider);

    return Stack(
      children: [
        WebView(
          initialUrl: "https://pub.dev/",
          onPageStarted: (url) =>
              ref.read(loadingProvider.notifier).state = true,
          onProgress: (progress) =>
              ref.read(loadingProvider.notifier).state = true,
          onPageFinished: (url) =>
              ref.read(loadingProvider.notifier).state = false,
        ),
        loadType ? const LinearProgressIndicator() : Container(),
      ],
    );
  }
}
