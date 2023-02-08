import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:owwn_coding_challenge/core/constants/colors.dart';
import 'package:owwn_coding_challenge/core/constants/constants.dart';
import 'package:owwn_coding_challenge/domain/providers/auth/state.dart';
import 'package:owwn_coding_challenge/domain/providers/providers.dart';
import 'package:owwn_coding_challenge/ui/widgets/app_text.dart';
import 'package:owwn_coding_challenge/ui/widgets/app_text_button.dart';
import 'package:owwn_coding_challenge/ui/widgets/text_field.dart';
import 'package:owwn_coding_challenge/ui/widgets/utils.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppText(
              'Please Log in',
              fontSize: 18,
              weight: FontWeight.w400,
            ),
            sized(h: 12),
            Container(
              decoration: BoxDecoration(
                color: AppColors.tileBg,
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              child: const AppTextField(
                label: 'email',
                initialValue: kEmail,
                isEnabled: false,
              ),
            ),
            sized(h: 30),
            Consumer(
              builder: (context, ref, child) {
                final authState = ref.watch(authNotifierProvider);

                if (authState is AuthLoading) {
                  return customLoader;
                }
                return AppTextButton(
                  label: 'Log in',
                  onPressed: () {
                    ref
                        .read(authNotifierProvider.notifier)
                        .authenticateUser(kEmail);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
