import 'package:flutter/cupertino.dart';
import 'package:flip_card/flip_card.dart';

enum Level { Easy, Hard }

List<String> fillSourceArray() {
  return [
    'assets/cards/android.jpg',
    'assets/cards/android.jpg',
    'assets/cards/flutter.jpg',
    'assets/cards/flutter.jpg',
    'assets/cards/java.png',
    'assets/cards/java.png',
    'assets/cards/kotlin.jpg',
    'assets/cards/kotlin.jpg',
    'assets/cards/objective-c.png',
    'assets/cards/objective-c.png',
    'assets/cards/react.jpg',
    'assets/cards/react.jpg',
    'assets/cards/swift.jpg',
    'assets/cards/swift.jpg',
    'assets/cards/xamarin.jpg',
    'assets/cards/xamarin.jpg',
    'assets/cards/csharp.png',
    'assets/cards/csharp.png',
  ];
}

List<String> HardsourceArray() {
  return [
    'assets/cards/intellij.png',
    'assets/cards/intellij.png',
    'assets/cards/sublime_text.png',
    'assets/cards/sublime_text.png',
    'assets/cards/visualcode.png',
    'assets/cards/visualcode.png',
    'assets/cards/oracle.png',
    'assets/cards/oracle.png',
    'assets/cards/coda.png',
    'assets/cards/coda.png',
    'assets/cards/webstorm.jpg',
    'assets/cards/webstorm.jpg',
    'assets/cards/photoshop.png',
    'assets/cards/photoshop.png',
    'assets/cards/appcode.jpg',
    'assets/cards/appcode.jpg',
    'assets/cards/dataspell.png',
    'assets/cards/dataspell.png',
    'assets/cards/pycharm.png',
    'assets/cards/pycharm.png',
    'assets/cards/rider.jpg',
    'assets/cards/rider.jpg',
    'assets/cards/bbedit.png',
    'assets/cards/bbedit.png',
    'assets/cards/brackets.png',
    'assets/cards/brackets.png',
    'assets/cards/espresso.png',
    'assets/cards/espresso.png',
    'assets/cards/notepad.png',
    'assets/cards/notepad.png',
    'assets/cards/datagrip.png',
    'assets/cards/datagrip.png',
    'assets/cards/ultraedit.png',
    'assets/cards/ultraedit.png',
    'assets/cards/rubymine.png',
    'assets/cards/rubymine.png',
  ];
}

List getSourceArray(
  Level level,
) {
  List<String> levelAndKindList = <String>[];
  List sourceArray = fillSourceArray();
  if (level == Level.Easy) {
    for (int i = 0; i < 16; i++) {
      levelAndKindList.add(sourceArray[i]);
    }
  } else if (level == Level.Hard) {
    List sourceArray = HardsourceArray();
    for (int i = 0; i < 36; i++) {
      levelAndKindList.add(sourceArray[i]);
    }
  }

  levelAndKindList.shuffle();
  return levelAndKindList;
}

List<bool> getInitialItemState(Level level) {
  List<bool> initialItemState = <bool>[];
  if (level == Level.Easy) {
    for (int i = 0; i < 16; i++) {
      initialItemState.add(true);
    }
  } else if (level == Level.Hard) {
    for (int i = 0; i < 36; i++) {
      initialItemState.add(true);
    }
  }
  return initialItemState;
}

List<GlobalKey<FlipCardState>> getCardStateKeys(Level level) {
  List<GlobalKey<FlipCardState>> cardStateKeys =
      // ignore: deprecated_member_use
      <GlobalKey<FlipCardState>>[];

  if (level == Level.Easy) {
    for (int i = 0; i < 16; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  } else if (level == Level.Hard) {
    for (int i = 0; i < 36; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  }
  return cardStateKeys;
}
