import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:buy_mate/constants/color.dart';
import 'package:buy_mate/widgets/text_styles.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<NotificationClass> _notifications = List.generate(
      10,
      (index) => NotificationClass(
          title: 'Congratulation',
          dateTime:
              DateTimeFormat.format(DateTime.now(), format: 'j F Y, h:iA'),
          details:
              'when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
          read: index % 3 == 0 ? true : false));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kWhiteColor,
        actions: [
          TextButton(
            onPressed: () {
              //TODO: Clear all notification.
              _notifications.clear();
              setState(() {});
            },
            child: boldText(text: 'Clear', color: Colors.blue, size: 15),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: kBlackColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              boldText(text: 'Notifications', color: kBlackColor, size: 35),
              const SizedBox(
                height: 20,
              ),
              ...List.generate(
                _notifications.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: _notifications[index].read
                                ? kBlackColor
                                : Colors.blue),
                        borderRadius: BorderRadius.circular(20),
                        color: _notifications[index].read
                            ? kWhiteColor
                            : Colors.blue.withOpacity(0.2)),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          boldText(
                              text: _notifications[index].title,
                              color: _notifications[index].read
                                  ? kBlackColor
                                  : Colors.blue,
                              size: 20),
                          const SizedBox(
                            height: 5,
                          ),
                          regularText(
                            text: _notifications[index].details,
                            color: kBlackColor.withOpacity(0.5),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          regularText(
                            text: _notifications[index].dateTime,
                            color: kBlackColor.withOpacity(0.5),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationClass {
  final String title;
  final String details;
  final String dateTime;
  final bool read;

  NotificationClass(
      {required this.title,
      required this.dateTime,
      required this.details,
      required this.read});
}
