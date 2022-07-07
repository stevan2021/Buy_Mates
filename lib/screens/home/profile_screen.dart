import 'package:buy_mate/screens/setup_profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:buy_mate/constants/color.dart';
import 'package:buy_mate/functions/next_page.dart';
import 'package:buy_mate/screens/home/notification_screen.dart';
import 'package:buy_mate/screens/subscription/terms_and_conditions.dart';
import 'package:buy_mate/widgets/card_widget.dart';
import 'package:buy_mate/widgets/text_styles.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: boldText(text: 'Profile', color: kBlackColor),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: [
            CircleAvatar(
              radius: 60,
              child: Image.asset(
                'asset/heart.png',
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            boldText(text: 'Andrew Anisley', color: kBlackColor, size: 25),
            const SizedBox(
              height: 5,
            ),
            mediumText(
                text: 'something@gmail.com', color: kBlackColor, size: 15)
          ],
        ),
        const Divider(
          indent: 5,
          endIndent: 5,
          thickness: 1,
        ),
        _menuCard(
            title: 'Edit Profile',
            icon: Icons.person_outline_rounded,
            function: () {
              nextPage(context: context, widget: ProfileScreen());
            }),
        _menuCard(
            title: 'Notification',
            icon: Icons.notifications_none_rounded,
            function: () {
              nextPage(context: context, widget: const NotificationScreen());
            }),
        _menuCard(
            title: 'Payment', icon: Icons.payment_outlined, function: () {}),
        _menuCard(
            title: 'Security', icon: Icons.security_outlined, function: () {}),
        _menuCard(
            title: 'Language', icon: Icons.language_outlined, function: () {}),
        _menuCard(
            title: 'Privacy Policy',
            icon: Icons.lock_open_outlined,
            function: () {
              nextPage(context: context, widget: const TermsAndConditions());
            }),
        _menuCard(title: 'Invite Friends', icon: Icons.share, function: () {}),
        _menuCard(
            title: 'Logout', icon: Icons.logout_outlined, function: () {}),
      ],
    );
  }

  CardWidget _menuCard(
      {required String title,
      required IconData icon,
      required Function() function}) {
    return CardWidget(
      elevation: 2,
      radius: 10,
      color: kWhiteColor,
      widget: ListTile(
        onTap: function,
        leading:
            Icon(icon, color: title == 'Logout' ? Colors.red : kLightBlack),
        title: mediumText(
            text: title,
            color: title == 'Logout' ? Colors.red : kBlackColor,
            size: 18),
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}
