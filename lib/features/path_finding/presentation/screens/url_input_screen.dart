import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:webspark_test/app/router/app_routes.dart';
import 'package:webspark_test/features/path_finding/presentation/state/url_input/url_input_cubit.dart';
import 'package:webspark_test/features/path_finding/presentation/state/url_input/url_input_state.dart';

import 'package:webspark_test/core/di/locator.dart';
import 'package:webspark_test/core/ui/widgets/primary_button.dart';

class UrlInputScreen extends StatelessWidget {
  const UrlInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<UrlInputCubit>(),
      child: const _UrlInputView(),
    );
  }
}

class _UrlInputView extends StatefulWidget {
  const _UrlInputView();

  @override
  State<_UrlInputView> createState() => _UrlInputViewState();
}

class _UrlInputViewState extends State<_UrlInputView> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home screen')),
      body: BlocConsumer<UrlInputCubit, UrlInputState>(
        listener: (context, state) {
          state.mapOrNull(
            initial: (s) {
              if (s.url.isNotEmpty && _controller.text != s.url) {
                _controller.text = s.url;
              }
            },
            success: (s) {
              context.push(AppRoutes.process, extra: s.url);
            },
          );
        },
        builder: (context, state) {
          final isLoading = state.maybeMap(
            loading: (_) => true,
            orElse: () => false,
          );
          final errorMessage = state.maybeMap(
            error: (e) => e.message,
            orElse: () => null,
          );

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    'Set valid API base URL in order to continue',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 0.0),
                        child: Transform.translate(
                          offset: const Offset(0, -4),
                          child: const Icon(
                            Icons.compare_arrows,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          enabled: !isLoading,
                          textInputAction: TextInputAction.send,
                          decoration: InputDecoration(
                            hintText: 'https://example.com/api',
                            errorText: errorMessage,
                            border: const UnderlineInputBorder(),
                            isDense: true,
                          ),
                          onChanged: (val) {
                            context.read<UrlInputCubit>().onUrlChanged(val);
                          },
                          onSubmitted: (val) {
                            context.read<UrlInputCubit>().onUrlChanged(val);
                            if (!isLoading) {
                              context.read<UrlInputCubit>().submit();
                            }
                          },
                          onEditingComplete: () {
                            if (!isLoading) {
                              context.read<UrlInputCubit>().submit();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),

                  PrimaryButton(
                    text: 'Start counting process',
                    isLoading: isLoading,
                    onPressed: () {
                      context.read<UrlInputCubit>().submit();
                    },
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
