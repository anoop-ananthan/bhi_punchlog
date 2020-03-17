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
      child: Text(
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
        return Colors.grey[800];
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

  getIcon() {}

  Map<String, Color> getColors() {
    switch (this.condition) {
      case Condition.IN:
        return {"text": Colors.green[900], "background": Colors.green[100]};
        break;
      case Condition.ABSENT:
        return {"text": Colors.red[900], "background": Colors.red[100]};
        break;
      case Condition.OUT:
        return {"text": Colors.red[900], "background": Colors.red[100]};
        break;
      default:
        return {"text": Colors.green[900], "background": Colors.green[100]};
    }
  }
}
