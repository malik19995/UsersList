import 'package:flutter/material.dart';

const String baseUrl = 'https://ccoding.owwn.com/hermes';

const String kEmail = 'flutter-challenge@owwn.com';

const String apiKey = 'owwn-challenge-22bbdk';

const int kApiLimit = 10;
const double kExpandedHeight = 300;

final kBackgroundImage = Image.asset(
  'assets/background.jpeg',
);

final kNamesTitleQuals = [
  'I',
  'II',
  'III',
  'IV',
  'V',
  'Mr.',
  'Dr.',
  'Mrs.',
  'Miss',
  'DDS',
  'PhD',
  'DVM',
  'MD',
  'Jr.',
  'Sr.'
];

///
///
/// Const Decorations
const kTopCircularBorder = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(10),
    topRight: Radius.circular(10),
  ),
);

const kBottomCircularBorder = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(10),
    bottomRight: Radius.circular(10),
  ),
);

const kTilePadding = EdgeInsets.only(left: 12, right: 16);

const kH16V10 = EdgeInsets.symmetric(
  horizontal: 16,
  vertical: 10,
);
