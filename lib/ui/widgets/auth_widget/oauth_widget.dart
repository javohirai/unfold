import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unsplash/ui/widgets/auth_widget/oauth_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OauthWidget extends StatelessWidget {
  const OauthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const _AuthWebWidget();
  }
}

class _AuthWebWidget extends StatelessWidget {
  const _AuthWebWidget();

  @override
  Widget build(BuildContext context) {
    final model = context.watch<OauthModel>();
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) async {
            await model.saveOauthCode(request, context);
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(model.oauthCodeUrl);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!model.codeGranted)
            Center(
              child: SizedBox(
                height: 400,
                child: WebViewWidget(
                  controller: controller,
                ),
              ),
            ),
          if (model.codeGranted && !model.accessTokenGranted)
            const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
