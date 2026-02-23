import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailsScreen extends StatelessWidget {
  final String articleUrl;
  const DetailsScreen(this.articleUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            print(progress);
          },
        ),
      )..loadRequest(Uri.parse(articleUrl));
    return SafeArea(
      child: Scaffold(
        body: WebViewWidget(controller: controller)
      ),
    );
  }
}
