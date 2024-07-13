import 'package:flutter/material.dart';
import '../../../../personalization/screens/settings/settings.dart';// Assuming the file exists and contains the SettingsScreen widget

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List<NotificationItem> notifications = [];

  @override
  void initState() {
    super.initState();
    // Simulate notifications with timers
    _scheduleNotifications();
  }

  void _scheduleNotifications() {
    // Simulate notifications with timers
    // Replace with your actual timer logic
    Future.delayed(Duration(seconds: 0), () {
      setState(() {
        notifications.add(
          NotificationItem(
            title: 'Your vehicle is parked',
            subtitle: 'The time will be counted down',
            timeAgo: 'Now',
          ),
        );
      });
    });

    Future.delayed(Duration(seconds: 360), () {
      setState(() {
        notifications.add(
          NotificationItem(
            title: 'You have arrived',
            subtitle: 'Please scan the code on the parking...',
            timeAgo: '6 min',
          ),
        );
      });
    });

    Future.delayed(Duration(seconds: 3600), () {
      setState(() {
        notifications.add(
          NotificationItem(
            title: 'Successful transaction',
            subtitle: '1 parking slot already booked',
            timeAgo: '1 hour',
          ),
        );
      });
    });
  }

  void _navigateToSettingsScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SettingsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: _navigateToSettingsScreen,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notifications[index].title),
            subtitle: Text(notifications[index].subtitle),
            trailing: Text(notifications[index].timeAgo),
          );
        },
      ),
    );
  }
}

class NotificationItem {
  final String title;
  final String subtitle;
  final String timeAgo;

  NotificationItem({
    required this.title,
    required this.subtitle,
    required this.timeAgo,
  });
}
