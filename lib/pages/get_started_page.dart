import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:meditation/utils/theme.dart';
import 'package:meditation/widgets/responsive_builder.dart';

import 'choose_topic_page.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;
    return Scaffold(
      backgroundColor: kColorPrimary,
      body: SafeArea(
          child: ResponsiveBuilder(
        portrait: Stack(
          children: [
            const GetStartedBackgroud(),
            const FractionallySizedBox(
              heightFactor: 0.35,
              child: GetStartedHeader(),
            ),
            Align(
              alignment: const Alignment(0.0, 0.8),
              child: GetStartedButton(
                fixedSize: MaterialStateProperty.all(
                  Size(
                    size.width * 0.9,
                    size.height * 0.07,
                  ),
                ),
                textStyle: MaterialStateProperty.all(
                  PrimaryFont.medium(size.height * 0.015),
                ),
              ),
            ),
          ],
        ),
        landscape: Row(
          children: [
            const Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: FractionallySizedBox(
                  heightFactor: 0.7,
                  child: GetStartedHeader(),
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  const GetStartedBackgroud(),
                  Align(
                    alignment: const Alignment(0.0, 0.8),
                    child: GetStartedButton(
                      fixedSize: MaterialStateProperty.all(
                        Size(
                          size.width * 0.4,
                          size.height * 0.07,
                        ),
                      ),
                      textStyle: MaterialStateProperty.all(
                        PrimaryFont.medium(size.height * 0.015),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({
    Key? key,
    this.fixedSize,
    this.textStyle,
  }) : super(key: key);

  final MaterialStateProperty<Size>? fixedSize;
  final MaterialStateProperty<TextStyle>? textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed('$ChooseTopicPage');
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kColorLightGray),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        elevation: MaterialStateProperty.all(0),
        foregroundColor: MaterialStateProperty.all(kColorDarkBlue),
        textStyle: textStyle,
        fixedSize: fixedSize,
      ),
      child: const Text('GET STARTED'),
    );
  }
}

class GetStartedBackgroud extends StatelessWidget {
  const GetStartedBackgroud({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: FractionallySizedBox(
            heightFactor:
                context.orientation == Orientation.portrait ? 0.6 : 0.9,
            widthFactor: 1,
            child: FittedBox(
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                clipBehavior: Clip.antiAlias,
                child: SvgPicture.asset('assets/images/bg_get_started.svg'))));
  }
}

class GetStartedHeader extends StatelessWidget {
  const GetStartedHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 2,
          fit: FlexFit.tight,
          child: SvgPicture.asset(
            'assets/images/ic_logo.svg',
            alignment: const Alignment(0.0, -0.8),
          ),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: FittedBox(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'Hi Afsar, Welcome\n',
                  style: PrimaryFont.medium(30.0).copyWith(
                    color: kColorLightYellow,
                    height: 1.3,
                  ),
                  children: [
                    TextSpan(
                      text: 'to Silent Moon',
                      style: PrimaryFont.thin(30.0)
                          .copyWith(color: kColorLightYellow),
                    )
                  ]),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: SizedBox.expand(
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: FittedBox(
                  child: Text(
                    'Explore the app, Find some peace of mind \n to prepare for meditation.',
                    style: PrimaryFont.light(16).copyWith(
                      color: kColorLightGray,
                      height: 1.3,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
