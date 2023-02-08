import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:owwn_coding_challenge/core/constants/colors.dart';
import 'package:owwn_coding_challenge/core/constants/constants.dart';
import 'package:owwn_coding_challenge/domain/providers/auth/state.dart';
import 'package:owwn_coding_challenge/domain/providers/providers.dart';
import 'package:owwn_coding_challenge/domain/providers/users/state.dart';
import 'package:owwn_coding_challenge/ui/home/widgets/error.dart';
import 'package:owwn_coding_challenge/ui/home/widgets/users_page.dart';
import 'package:owwn_coding_challenge/ui/widgets/app_text.dart';
import 'package:owwn_coding_challenge/ui/widgets/utils.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AuthLoaded authState = ref.watch(authNotifierProvider) as AuthLoaded;
    final int pageNumber = ref.watch(pageProvider);
    final userState = ref.watch(usersNotifierProvider);

    ref.read(usersNotifierProvider.notifier).fetchUsers(
          pageNumber,
          kApiLimit,
          authState.authToken,
        );

    return Scaffold(
      backgroundColor: AppColors.black,
      bottomNavigationBar: BottomAppBar(
        color: AppColors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (pageNumber > 1)
              IconButton(
                icon: const Icon(
                  Icons.keyboard_arrow_left_rounded,
                  size: 30,
                  color: AppColors.cwhite,
                ),
                onPressed: () {
                  ref.read(pageProvider.notifier).state = pageNumber - 1;
                  ref
                      .read(usersNotifierProvider.notifier)
                      .fetchUsers(pageNumber, kApiLimit, authState.authToken);
                },
              )
            else
              sized(w: 20, h: 10),
            AppText(
              'Page: $pageNumber',
              weight: FontWeight.w500,
              color: AppColors.cwhite,
            ),
            if (userState is UsersLoaded &&
                userState.apiResponsePerPage[pageNumber] != null &&
                userState.apiResponsePerPage[pageNumber]!.length >
                    kApiLimit - 1)
              IconButton(
                icon: const Icon(
                  Icons.keyboard_arrow_right_rounded,
                  size: 30,
                  color: AppColors.cwhite,
                ),
                onPressed: () {
                  ref.read(pageProvider.notifier).state = pageNumber + 1;
                  ref
                      .read(usersNotifierProvider.notifier)
                      .fetchUsers(pageNumber, kApiLimit, authState.authToken);
                },
              )
            else
              sized(w: 20, h: 10)
          ],
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (
          BuildContext context,
          bool innerBoxIsScrolled,
        ) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                titleTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.cwhite,
                      fontWeight: FontWeight.w600,
                    ),
                title: innerBoxIsScrolled
                    ? const AppText(
                        'Users',
                        fontSize: 20,
                        weight: FontWeight.w500,
                      )
                    : sized(h: 0),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                flexibleSpace: innerBoxIsScrolled
                    ? sized(h: 0)
                    : ColoredBox(
                        color: AppColors.black,
                        child: kBackgroundImage,
                      ),
                collapsedHeight: 100,
                forceElevated: innerBoxIsScrolled,
                expandedHeight: kExpandedHeight,
                pinned: true,
                elevation: 0,
                // bottom:
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          child: userState is UsersLoaded
              ? UsersPage(pageNumber)
              : userState is UsersError
                  ? const ErrorPage()
                  : customLoader,
        ),
      ),
    );
  }
}
