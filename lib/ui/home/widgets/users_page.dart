import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:owwn_coding_challenge/core/constants/colors.dart';
import 'package:owwn_coding_challenge/core/constants/constants.dart';
import 'package:owwn_coding_challenge/core/models/user.dart';
import 'package:owwn_coding_challenge/domain/providers/providers.dart';
import 'package:owwn_coding_challenge/domain/providers/users/state.dart';
import 'package:owwn_coding_challenge/ui/widgets/app_list_tile.dart';
import 'package:owwn_coding_challenge/ui/widgets/app_text.dart';
import 'package:owwn_coding_challenge/ui/widgets/utils.dart';

class UsersPage extends ConsumerWidget {
  final int pageNumber;
  const UsersPage(this.pageNumber, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(usersNotifierProvider);

    ///
    ///
    /// Loading State in UI during fetch.
    /// Didn't revert to UsersLoading state because previous
    /// pages are stored in state
    if (!(userState as UsersLoaded)
        .apiResponsePerPage
        .containsKey(pageNumber)) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 600,
            child: customLoader,
          ),
        ],
      );
    } else {
      if (userState.apiResponsePerPage[pageNumber]!.isEmpty) {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              SizedBox(
                height: 600,
                child: AppText(
                  'No Orders Found',
                  color: AppColors.cwhite,
                  fontSize: 20,
                  weight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      }

      final List<User> activeUsers = userState.apiResponsePerPage[pageNumber]!
          .where((element) => element.status == 'active')
          .toList();

      final List<User> inactiveUsers = userState.apiResponsePerPage[pageNumber]!
          .where((element) => element.status == 'inactive')
          .toList();
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sized(
            h: AppBar().preferredSize.height + 100,
          ),
          const Padding(
            padding: kH16V10,
            child: AppText(
              'Active',
              fontSize: 18,
              weight: FontWeight.w600,
            ),
          ),
          sized(h: 20),
          Padding(
            padding: kTilePadding,
            child: Column(
              children: [
                ...activeUsers
                    .map(
                      (e) => Column(
                        children: [
                          AppListTile(
                            user: e,
                            isFirst: activeUsers.indexOf(e) == 0,
                            isLast: activeUsers.indexOf(e) ==
                                activeUsers.length - 1,
                          ),
                          sized(h: 2),
                        ],
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
          sized(h: 15),
          const Padding(
            padding: kH16V10,
            child: AppText(
              'Inactive',
              fontSize: 18,
              weight: FontWeight.w600,
            ),
          ),
          sized(h: 20),
          Padding(
            padding: kTilePadding,
            child: Column(
              children: [
                ...inactiveUsers
                    .map(
                      (e) => AppListTile(
                        user: e,
                        isFirst: inactiveUsers.indexOf(e) == 0,
                        isLast: inactiveUsers.indexOf(e) ==
                            inactiveUsers.length - 1,
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
          sized(h: 60)
        ],
      );
    }
  }
}
