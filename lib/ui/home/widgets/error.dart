import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:owwn_coding_challenge/core/constants/constants.dart';
import 'package:owwn_coding_challenge/domain/providers/auth/state.dart';
import 'package:owwn_coding_challenge/domain/providers/providers.dart';
import 'package:owwn_coding_challenge/domain/providers/users/state.dart';
import 'package:owwn_coding_challenge/ui/widgets/app_text.dart';
import 'package:owwn_coding_challenge/ui/widgets/app_text_button.dart';
import 'package:owwn_coding_challenge/ui/widgets/utils.dart';

class ErrorPage extends ConsumerWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AuthLoaded authState = ref.watch(authNotifierProvider) as AuthLoaded;
    final userState = ref.watch(usersNotifierProvider) as UsersError;

    return SizedBox(
      height: MediaQuery.of(context).size.height - kExpandedHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(
            userState.error == '401'
                ? 'Session Expired. Either Refresh or Re-login.'
                : 'Some Error Occured, Please Try again',
            fontSize: 16,
            weight: FontWeight.w500,
          ),
          sized(h: 15),
          AppTextButton(
            label: 'Refresh Token',
            onPressed: () {
              final int pageNumber = ref.read(pageProvider);
              ref
                  .read(authNotifierProvider.notifier)
                  .refreshToken()
                  .then((value) {
                ref.read(usersNotifierProvider.notifier).fetchUsers(
                      pageNumber,
                      kApiLimit,
                      authState.authToken,
                    );
              });
            },
          ),
          AppTextButton(
            label: 'Logout',
            onPressed: () {
              ref.read(authNotifierProvider.notifier).logout();
            },
          ),
        ],
      ),
    );
  }
}
