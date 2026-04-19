import 'package:flutter/material.dart';

const red = Colors.red;
const green = Colors.green;
const blue = Colors.blue;
const big = TextStyle(fontSize: 30);

abstract class Example extends StatelessWidget {
  const Example({super.key});
  String get code;
  String get explanation;
}

// ══════════════════════════════════════════════════════════════════
class Exercicio3 extends StatefulWidget {
  const Exercicio3({super.key});
  @override
  State<Exercicio3> createState() => _Exercicio3State();
}

class _Exercicio3State extends State<Exercicio3> {
  int _current = 1;

  static const List<Example> _examples = [
    Ex1(), Ex2(), Ex3(), Ex4(), Ex5(), Ex6(), Ex7(), Ex8(), Ex9(), Ex10(),
    Ex11(), Ex12(), Ex13(), Ex14(), Ex15(), Ex16(), Ex17(), Ex18(), Ex19(),
    Ex20(), Ex21(), Ex22(), Ex23(), Ex24(), Ex25(), Ex26(), Ex27(), Ex28(),
    Ex29(),
  ];

  @override
  Widget build(BuildContext context) {
    final ex = _examples[_current - 1];
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Exercício 3 — Constraints'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                color: const Color(0xFFCCCCCC),
                width: double.infinity,
                child: ex,
              ),
            ),
            Container(
              height: 48,
              color: Colors.black,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(_examples.length, (i) {
                    final n = i + 1;
                    final selected = _current == n;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 6),
                      child: SizedBox(
                        width: 44,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: selected ? Colors.grey : Colors.grey[800],
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                          ),
                          onPressed: () => setState(() => _current = n),
                          child: Text('$n', style: const TextStyle(fontSize: 13)),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                color: Colors.grey[50],
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(ex.code,
                          style: const TextStyle(fontFamily: 'monospace', fontSize: 12)),
                      const SizedBox(height: 10),
                      Text(ex.explanation,
                          style: TextStyle(
                              color: Colors.blue[900],
                              fontStyle: FontStyle.italic,
                              fontSize: 12)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════
// EXEMPLOS 1–29
// ══════════════════════════════════════════════════════════════════

class Ex1 extends Example {
  const Ex1({super.key});
  @override final code = 'Container(color: red)';
  @override final explanation = 'The screen is the parent of the Container, and it forces the Container to be exactly the same size as the screen.\n\nSo the Container fills the screen and paints it red.';
  @override Widget build(BuildContext context) => Container(color: red);
}

class Ex2 extends Example {
  const Ex2({super.key});
  @override final code = 'Container(width: 100, height: 100, color: red)';
  @override final explanation = 'The red Container wants to be 100x100, but it can\'t, because the screen forces it to be exactly the same size as the screen.\n\nSo the Container fills the screen.';
  @override Widget build(BuildContext context) => Container(width: 100, height: 100, color: red);
}

class Ex3 extends Example {
  const Ex3({super.key});
  @override final code = 'Center(\n   child: Container(width: 100, height: 100, color: red))';
  @override final explanation = 'The screen forces the Center to be exactly the same size as the screen, so the Center fills the screen.\n\nThe Center tells the Container that it can be any size it wants, but not bigger than the screen. Now the Container can indeed be 100x100.';
  @override Widget build(BuildContext context) => Center(child: Container(width: 100, height: 100, color: red));
}

class Ex4 extends Example {
  const Ex4({super.key});
  @override final code = 'Align(\n   alignment: Alignment.bottomRight,\n   child: Container(width: 100, height: 100, color: red))';
  @override final explanation = 'This is different from the previous example in that it uses Align instead of Center.\n\nAlign also tells the Container that it can be any size it wants, but if there is empty space it won\'t center the Container. Instead, it aligns the Container to the bottom-right of the available space.';
  @override Widget build(BuildContext context) => Align(alignment: Alignment.bottomRight, child: Container(width: 100, height: 100, color: red));
}

class Ex5 extends Example {
  const Ex5({super.key});
  @override final code = 'Center(\n   child: Container(\n      color: red,\n      width: double.infinity,\n      height: double.infinity))';
  @override final explanation = 'The screen forces the Center to be exactly the same size as the screen, so the Center fills the screen.\n\nThe Center tells the Container that it can be any size it wants, but not bigger than the screen. The Container wants to be of infinite size, but since it can\'t be bigger than the screen, it just fills the screen.';
  @override Widget build(BuildContext context) => Center(child: Container(width: double.infinity, height: double.infinity, color: red));
}

class Ex6 extends Example {
  const Ex6({super.key});
  @override final code = 'Center(child: Container(color: red))';
  @override final explanation = 'The screen forces the Center to be exactly the same size as the screen, so the Center fills the screen.\n\nThe Center tells the Container that it can be any size it wants, but not bigger than the screen.\n\nSince the Container has no child and no fixed size, it decides it wants to be as big as possible, so it fills the whole screen.';
  @override Widget build(BuildContext context) => Center(child: Container(color: red));
}

class Ex7 extends Example {
  const Ex7({super.key});
  @override final code = 'Center(\n   child: Container(color: red,\n      child: Container(color: green, width: 30, height: 30)))';
  @override final explanation = 'The Center tells the red Container that it can be any size it wants, but not bigger than the screen. Since the red Container has no size but has a child, it decides it wants to be the same size as its child.\n\nThe child is a green Container that wants to be 30x30. The red color isn\'t visible, since the green Container entirely covers the red Container.';
  @override Widget build(BuildContext context) => Center(child: Container(color: red, child: Container(color: green, width: 30, height: 30)));
}

class Ex8 extends Example {
  const Ex8({super.key});
  @override final code = 'Center(\n   child: Container(color: red,\n      padding: const EdgeInsets.all(20.0),\n      child: Container(color: green, width: 30, height: 30)))';
  @override final explanation = 'The red Container sizes itself to its children size, but it takes its own padding into consideration. So it is also 30x30 plus padding. The red color is visible because of the padding, and the green Container has the same size as in the previous example.';
  @override Widget build(BuildContext context) => Center(child: Container(padding: const EdgeInsets.all(20.0), color: red, child: Container(color: green, width: 30, height: 30)));
}

class Ex9 extends Example {
  const Ex9({super.key});
  @override final code = 'ConstrainedBox(\n   constraints: BoxConstraints(\n      minWidth: 70, minHeight: 70,\n      maxWidth: 150, maxHeight: 150),\n   child: Container(color: red, width: 10, height: 10))';
  @override final explanation = 'You might guess that the Container has to be between 70 and 150 pixels, but you would be wrong. The ConstrainedBox only imposes ADDITIONAL constraints from those it receives from its parent.\n\nHere, the screen forces the ConstrainedBox to be exactly the same size as the screen, so it tells its child Container to also assume the size of the screen, thus ignoring its \'constraints\' parameter.';
  @override Widget build(BuildContext context) => ConstrainedBox(constraints: const BoxConstraints(minWidth: 70, minHeight: 70, maxWidth: 150, maxHeight: 150), child: Container(color: red, width: 10, height: 10));
}

class Ex10 extends Example {
  const Ex10({super.key});
  @override final code = 'Center(\n   child: ConstrainedBox(\n      constraints: BoxConstraints(\n         minWidth: 70, minHeight: 70,\n         maxWidth: 150, maxHeight: 150),\n      child: Container(color: red, width: 10, height: 10)))';
  @override final explanation = 'Now, Center allows ConstrainedBox to be any size up to the screen size.\n\nThe ConstrainedBox imposes ADDITIONAL constraints from its \'constraints\' parameter onto its child.\n\nThe Container must be between 70 and 150 pixels. It wants to have 10 pixels, so it will end up having 70 (the MINIMUM).';
  @override Widget build(BuildContext context) => Center(child: ConstrainedBox(constraints: const BoxConstraints(minWidth: 70, minHeight: 70, maxWidth: 150, maxHeight: 150), child: Container(color: red, width: 10, height: 10)));
}

class Ex11 extends Example {
  const Ex11({super.key});
  @override final code = 'Center(\n   child: ConstrainedBox(\n      constraints: BoxConstraints(\n         minWidth: 70, minHeight: 70,\n         maxWidth: 150, maxHeight: 150),\n      child: Container(color: red, width: 1000, height: 1000)))';
  @override final explanation = 'Center allows ConstrainedBox to be any size up to the screen size. The ConstrainedBox imposes ADDITIONAL constraints from its \'constraints\' parameter onto its child.\n\nThe Container must be between 70 and 150 pixels. It wants to have 1000 pixels, so it ends up having 150 (the MAXIMUM).';
  @override Widget build(BuildContext context) => Center(child: ConstrainedBox(constraints: const BoxConstraints(minWidth: 70, minHeight: 70, maxWidth: 150, maxHeight: 150), child: Container(color: red, width: 1000, height: 1000)));
}

class Ex12 extends Example {
  const Ex12({super.key});
  @override final code = 'Center(\n   child: ConstrainedBox(\n      constraints: BoxConstraints(\n         minWidth: 70, minHeight: 70,\n         maxWidth: 150, maxHeight: 150),\n      child: Container(color: red, width: 100, height: 100)))';
  @override final explanation = 'Center allows ConstrainedBox to be any size up to the screen size. ConstrainedBox imposes ADDITIONAL constraints from its \'constraints\' parameter onto its child.\n\nThe Container must be between 70 and 150 pixels. It wants to have 100 pixels, and that\'s the size it has, since that\'s between 70 and 150.';
  @override Widget build(BuildContext context) => Center(child: ConstrainedBox(constraints: const BoxConstraints(minWidth: 70, minHeight: 70, maxWidth: 150, maxHeight: 150), child: Container(color: red, width: 100, height: 100)));
}

class Ex13 extends Example {
  const Ex13({super.key});
  @override final code = 'UnconstrainedBox(\n   child: Container(color: red, width: 20, height: 50));';
  @override final explanation = 'The screen forces the UnconstrainedBox to be exactly the same size as the screen. However, the UnconstrainedBox lets its child Container be any size it wants.';
  @override Widget build(BuildContext context) => UnconstrainedBox(child: Container(color: red, width: 20, height: 50));
}

class Ex14 extends Example {
  const Ex14({super.key});
  @override final code = 'UnconstrainedBox(\n   child: Container(color: red, width: 4000, height: 50));';
  @override final explanation = 'The screen forces the UnconstrainedBox to be exactly the same size as the screen, and UnconstrainedBox lets its child Container be any size it wants.\n\nUnfortunately, in this case the Container has 4000 pixels of width and is too big to fit in the UnconstrainedBox, so the UnconstrainedBox displays the much dreaded "overflow warning".';
  @override Widget build(BuildContext context) => UnconstrainedBox(child: Container(color: red, width: 4000, height: 50));
}

class Ex15 extends Example {
  const Ex15({super.key});
  @override final code = 'OverflowBox(\n   minWidth: 0.0, minHeight: 0.0,\n   maxWidth: double.infinity,\n   maxHeight: double.infinity,\n   child: Container(color: red, width: 4000, height: 50));';
  @override final explanation = 'The screen forces the OverflowBox to be exactly the same size as the screen, and OverflowBox lets its child Container be any size it wants.\n\nOverflowBox is similar to UnconstrainedBox, but it won\'t display any warnings if the child doesn\'t fit the space.\n\nIn this case the Container is 4000 pixels wide, and the OverflowBox simply shows as much as it can, with no warnings given.';
  @override Widget build(BuildContext context) => OverflowBox(minWidth: 0.0, minHeight: 0.0, maxWidth: double.infinity, maxHeight: double.infinity, child: Container(color: red, width: 4000, height: 50));
}

class Ex16 extends Example {
  const Ex16({super.key});
  @override final code = 'UnconstrainedBox(\n   child: Container(color: Colors.red,\n      width: double.infinity, height: 100));';
  @override final explanation = 'This won\'t render anything, and you\'ll see an error in the console.\n\nThe UnconstrainedBox lets its child be any size it wants, however its child is a Container with infinite size.\n\nFlutter can\'t render infinite sizes, so it throws an error: "BoxConstraints forces an infinite width."';
  @override Widget build(BuildContext context) => UnconstrainedBox(child: Container(color: Colors.red, width: double.infinity, height: 100));
}

class Ex17 extends Example {
  const Ex17({super.key});
  @override final code = 'UnconstrainedBox(\n   child: LimitedBox(maxWidth: 100,\n      child: Container(color: Colors.red,\n         width: double.infinity, height: 100)));';
  @override final explanation = 'Here, unlike the previous example, the Container has a maximum width of 100.\n\nLimitedBox only limits its child when it gets an unbounded constraint from its parent — in this case, the UnconstrainedBox provides an unbounded constraint, so LimitedBox limits the Container to 100 wide.';
  @override Widget build(BuildContext context) => UnconstrainedBox(child: LimitedBox(maxWidth: 100, child: Container(color: Colors.red, width: double.infinity, height: 100)));
}

class Ex18 extends Example {
  const Ex18({super.key});
  @override final code = 'FittedBox(\n   child: Text(\'Some Example Text.\'));';
  @override final explanation = 'The screen forces the FittedBox to be exactly the same size as the screen. The Text has some natural width that depends on the amount of text, its font size, and so on.\n\nThe FittedBox lets the Text be any size it wants, but after the Text tells its size to the FittedBox, the FittedBox scales the Text until it fills all of the available width.';
  @override Widget build(BuildContext context) => const FittedBox(child: Text('Some Example Text.'));
}

class Ex19 extends Example {
  const Ex19({super.key});
  @override final code = 'Center(\n   child: FittedBox(\n      child: Text(\'Some Example Text.\')));';
  @override final explanation = 'But what happens if you put the FittedBox inside of a Center widget? The Center lets the FittedBox be any size it wants, up to the screen size.\n\nThe FittedBox then sizes itself to the Text, and lets the Text be any size it wants.\n\nSince both FittedBox and the Text have the same size, no scaling happens.';
  @override Widget build(BuildContext context) => const Center(child: FittedBox(child: Text('Some Example Text.')));
}

class Ex20 extends Example {
  const Ex20({super.key});
  @override final code = 'Center(\n   child: FittedBox(\n      child: Text(\'…very large text…\')));';
  @override final explanation = 'However, what happens if FittedBox is inside of a Center widget, but the Text is too large to fit the screen?\n\nFittedBox tries to size itself to the Text, but it can\'t be bigger than the screen. It then assumes the screen size, and resizes Text so that it fits the screen too.';
  @override Widget build(BuildContext context) => const Center(child: FittedBox(child: Text('This is some very very very large text that will not fit on screen')));
}

class Ex21 extends Example {
  const Ex21({super.key});
  @override final code = 'Center(\n   child: Text(\'…very large text…\'));';
  @override final explanation = 'If, however, you remove the FittedBox, the Text gets its maximum width from the screen, and breaks the line so that it fits the screen.';
  @override Widget build(BuildContext context) => const Center(child: Text('This is some very very very large text that will not fit on screen'));
}

class Ex22 extends Example {
  const Ex22({super.key});
  @override final code = 'FittedBox(\n   child: Container(\n      height: 20.0, width: double.infinity));';
  @override final explanation = 'FittedBox can only scale a widget that is BOUNDED (has non-infinite width and height). Otherwise, it won\'t render anything, and you\'ll see an error in the console.';
  @override Widget build(BuildContext context) => FittedBox(child: Container(height: 20.0, width: double.infinity, color: Colors.red));
}

class Ex23 extends Example {
  const Ex23({super.key});
  @override final code = 'Row(\n   children:[\n      Container(color: red, child: Text(\'Hello!\', style: big)),\n      Container(color: green, child: Text(\'Goodbye!\', style: big)),\n   ])';
  @override final explanation = 'The screen forces the Row to be exactly the same size as the screen.\n\nJust like an UnconstrainedBox, the Row won\'t impose any constraints onto its children, and instead lets them be any size they want.\n\nThe Row then puts them side-by-side, and any extra space remains empty.';
  @override Widget build(BuildContext context) => Row(children: [Container(color: red, child: const Text('Hello!', style: big)), Container(color: green, child: const Text('Goodbye!', style: big))]);
}

class Ex24 extends Example {
  const Ex24({super.key});
  @override final code = 'Row(\n   children:[\n      Container(color: red, child: Text(\'…long text…\', style: big)),\n      Container(color: green, child: Text(\'Goodbye!\', style: big)),\n   ])';
  @override final explanation = 'Since the Row won\'t impose any constraints onto its children, it\'s quite possible that the children might be too big to fit the available width of the Row. In this case, just like an UnconstrainedBox, the Row displays the "overflow warning".';
  @override Widget build(BuildContext context) => Row(children: [Container(color: red, child: const Text('This is a very long text that won\'t fit the line.', style: big)), Container(color: green, child: const Text('Goodbye!', style: big))]);
}

class Ex25 extends Example {
  const Ex25({super.key});
  @override final code = 'Row(\n   children:[\n      Expanded(\n         child: Container(color: red, child: Text(\'…\', style: big))),\n      Container(color: green, child: Text(\'Goodbye!\', style: big)),\n   ])';
  @override final explanation = 'When a Row\'s child is wrapped in an Expanded widget, the Row won\'t let this child define its own width anymore.\n\nInstead, it defines the Expanded width according to the other children, and only then the Expanded widget forces the original child to have the Expanded\'s width.\n\nIn other words, once you use Expanded, the original child\'s width becomes irrelevant, and is ignored.';
  @override Widget build(BuildContext context) => Row(children: [Expanded(child: Container(color: red, child: const Text('This is a very long text that won\'t fit the line.', style: big))), Container(color: green, child: const Text('Goodbye!', style: big))]);
}

class Ex26 extends Example {
  const Ex26({super.key});
  @override final code = 'Row(\n   children:[\n      Expanded(child: Container(color: red, child: Text(\'…\', style: big))),\n      Expanded(child: Container(color: green, child: Text(\'Goodbye!\', style: big))),\n   ])';
  @override final explanation = 'If all of Row\'s children are wrapped in Expanded widgets, each Expanded has a size proportional to its flex parameter, and only then each Expanded widget forces its original child to have the Expanded\'s width.\n\nIn other words, Expanded ignores the preferred width of its children.';
  @override Widget build(BuildContext context) => Row(children: [Expanded(child: Container(color: red, child: const Text('This is a very long text that won\'t fit the line.', style: big))), Expanded(child: Container(color: green, child: const Text('Goodbye!', style: big)))]);
}

class Ex27 extends Example {
  const Ex27({super.key});
  @override final code = 'Row(\n   children:[\n      Flexible(child: Container(color: red, child: Text(\'…\', style: big))),\n      Flexible(child: Container(color: green, child: Text(\'Goodbye!\', style: big))),\n   ])';
  @override final explanation = 'The only difference if you use Flexible instead of Expanded, is that Flexible lets its child be SMALLER than the Flexible width, while Expanded forces its child to have the same width of the Expanded.\n\nBut both Expanded and Flexible ignore their children\'s width when sizing themselves.\n\nIn other words, it\'s impossible to use Expanded or Flexible to size their children.';
  @override Widget build(BuildContext context) => Row(children: [Flexible(child: Container(color: red, child: const Text('This is a very long text that won\'t fit the line.', style: big))), Flexible(child: Container(color: green, child: const Text('Goodbye!', style: big)))]);
}

class Ex28 extends Example {
  const Ex28({super.key});
  @override final code = 'Scaffold(\n   body: Container(\n      color: blue,\n      child: const Column(\n         children: [Text(\'Hello!\'), Text(\'Goodbye!\')],\n      ),\n   ),\n)';
  @override final explanation = 'The screen forces the Scaffold to be exactly the same size as the screen, so the Scaffold fills the screen.\n\nThe Scaffold tells the Container that it can be any size it wants, but not bigger than the screen.\n\nNote: When a widget tells its child that it can be smaller than a certain size, we say the widget supplies loose constraints to its child.';
  @override Widget build(BuildContext context) => Container(color: blue, child: const Column(children: [Text('Hello!'), Text('Goodbye!')]));
}

class Ex29 extends Example {
  const Ex29({super.key});
  @override final code = 'Scaffold(\n   body: SizedBox.expand(\n      child: Container(\n         color: blue,\n         child: const Column(\n            children: [Text(\'Hello!\'), Text(\'Goodbye!\')],\n         ),\n      ),\n   ),\n)';
  @override final explanation = 'If you want the Scaffold\'s child to be exactly the same size as the Scaffold itself, you can wrap its child with SizedBox.expand.';
  @override Widget build(BuildContext context) => SizedBox.expand(child: Container(color: blue, child: const Column(children: [Text('Hello!'), Text('Goodbye!')])));
}
