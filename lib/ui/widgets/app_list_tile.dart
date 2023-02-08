import 'package:flutter/material.dart';
import 'package:owwn_coding_challenge/core/constants/colors.dart';
import 'package:owwn_coding_challenge/core/constants/constants.dart';
import 'package:owwn_coding_challenge/core/models/user.dart';
import 'package:owwn_coding_challenge/ui/widgets/app_text.dart';

class AppListTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final User user;

  const AppListTile({
    super.key,
    required this.user,
    this.isFirst = false,
    this.isLast = false,
  });

  Widget _userInitials(String initials) {
    return Container(
      width: 38,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.avatarBg,
      ),
      child: Text(initials),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String name = user.name;
    final String email = user.email ?? '';
    final List<String> names = name.split(' ');
    names.removeWhere((element) => kNamesTitleQuals.contains(element));
    final String initials = names
        .sublist(
          names.length - 2,
          names.length,
        )
        .map((e) => e[0])
        .join();
    return ListTile(
      dense: true,
      style: ListTileStyle.drawer,
      tileColor: AppColors.tileBg,
      shape: isFirst
          ? kTopCircularBorder
          : isLast
              ? kBottomCircularBorder
              : null,
      leading: _userInitials(initials),
      title: AppText(name),
      subtitle: AppText(
        email,
        fontSize: 16,
        color: AppColors.subtitleText,
      ),
    );
  }
}
