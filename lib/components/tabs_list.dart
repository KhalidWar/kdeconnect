import 'package:flutter/material.dart';
import 'package:sample/constants.dart';
import 'package:sample/screens/media_control_tab.dart';
import 'package:sample/screens/remote_input_tab.dart';
import 'package:sample/screens/run_command_tab.dart';
import 'package:sample/screens/send_files_tab.dart';
import 'package:sample/screens/slideshow_remote_tab.dart';

class Tabs {
  Tabs({
    this.title,
    this.widget,
    this.function,
  });

  String title;
  Widget widget;
  Function function;
}

List tabsList = [
  Tabs(
    title: kSendFilesIDText,
    widget: SendFilesTab(),
    function: () {
      print('Send Files Function ACCESSED!!!!');
    },
  ),
  Tabs(
    title: kSlideshowRemoteIDText,
    widget: SlideshowRemoteTab(),
    function: () {
      print('Slideshow Function ACCESSED!!!!');
    },
  ),
  Tabs(
    title: kMediaControlIDText,
    widget: MediaControlTab(),
    function: () {
      print('Media Control Function ACCESSED!!!!');
    },
  ),
  Tabs(
    title: kRemoteInputIDText,
    widget: RemoteInputTab(),
    function: () {
      print('Remote Input Function ACCESSED!!!!');
    },
  ),
  Tabs(
    title: kRunCommandIDText,
    widget: RunCommandTab(),
    function: () {
      print('Run Command Function ACCESSED!!!!');
    },
  ),
];
