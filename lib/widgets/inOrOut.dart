import 'package:flutter/material.dart';

enum Condition {
  IN,
  OUT,
  ABSENT,
}

class InOrOut extends StatelessWidget {
  final Condition condition;
  final bool isIconVisible;

// TODO - Assign all the variable in constructor
  InOrOut({Key key, this.condition, this.isIconVisible}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: getBackgroundColor(),
      foregroundColor: getTextColor(),
      child: condition == Condition.ABSENT
          ? Icon(getIcon(false))
          : Text(
              getContent(),
              style: Theme.of(context).textTheme.subtitle.copyWith(
                    letterSpacing: 1,
                    color: getTextColor(),
                  ),
            ),
    );
  }

  getBackgroundColor() {
    switch (this.condition) {
      case Condition.IN:
        return Colors.green[100];
        break;
      case Condition.ABSENT:
        return Colors.grey[300];
        break;
      case Condition.OUT:
        return Colors.red[100];
        break;
      default:
        return Colors.red[100];
    }
  }

  getTextColor() {
    switch (this.condition) {
      case Condition.IN:
        return Colors.green[900];
        break;
      case Condition.ABSENT:
        return Colors.grey[600];
        break;
      case Condition.OUT:
        return Colors.red[900];
        break;
      default:
        return Colors.red[900];
    }
  }

  getContent() {
    switch (this.condition) {
      case Condition.IN:
        return "IN";
        break;
      case Condition.OUT:
        return "Out";
        break;
      default:
        return "";
    }
  }

// TODO Find out if the day is holiday
  getIcon(bool isHoliday) {
    IconData icon;
    DateTime now = new DateTime.now();
    if (now.hour > 20 && now.hour < 10) icon = Icons.hotel;
    if (now.hour > 10 && now.hour < 11) icon = Icons.directions_bus;
    if (now.hour > 11 && now.hour < 1) icon = Icons.restaurant;
    if (now.hour > 1 && now.hour < 20) icon = Icons.hotel;
    if (now.weekday == DateTime.sunday || now.weekday == DateTime.saturday)
      icon = Icons.weekend;
    if (isHoliday) icon = Icons.beach_access;
    return icon;
  }
}
