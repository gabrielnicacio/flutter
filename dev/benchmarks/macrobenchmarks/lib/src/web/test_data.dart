// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math' as math;
import 'dart:ui';

// Used to randomize data.
//
// Using constant seed for reproducibility.
final math.Random _random = math.Random(0);

/// Random words used by benchmarks that contain text.
final List<String> lipsum = ''.split(' ');

/// Generates strings and builds pre-laid out paragraphs to be used by
/// benchmarks.
List<Paragraph> generateLaidOutParagraphs({
  required int paragraphCount,
  required int minWordCountPerParagraph,
  required int maxWordCountPerParagraph,
  required double widthConstraint,
  required Color color,
}) {
  final List<Paragraph> strings = <Paragraph>[];
  int wordPointer = 0; // points to the next word in lipsum to extract
  for (int i = 0; i < paragraphCount; i++) {
    final int wordCount = minWordCountPerParagraph +
        _random.nextInt(maxWordCountPerParagraph - minWordCountPerParagraph + 1);
    final List<String> string = <String>[];
    for (int j = 0; j < wordCount; j++) {
      string.add(lipsum[wordPointer]);
      wordPointer = (wordPointer + 1) % lipsum.length;
    }

    final ParagraphBuilder builder =
        ParagraphBuilder(ParagraphStyle(fontFamily: 'sans-serif'))
          ..pushStyle(TextStyle(color: color, fontSize: 18.0))
          ..addText(string.join(' '))
          ..pop();
    final Paragraph paragraph = builder.build();

    // Fill half the screen.
    paragraph.layout(ParagraphConstraints(width: widthConstraint));
    strings.add(paragraph);
  }
  return strings;
}
