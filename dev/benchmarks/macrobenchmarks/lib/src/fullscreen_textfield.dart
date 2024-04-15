// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

const String textLotsOfText = '';

class TextFieldPage extends StatelessWidget {
  const TextFieldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: TextField(
        maxLines: null,
        controller: TextEditingController(text: textLotsOfText),
        key: const Key('fullscreen-textfield'),
      ),
    );
  }
}
