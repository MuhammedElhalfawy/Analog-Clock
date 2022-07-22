import 'package:clock_app/shared/components/clock.dart';
import 'package:clock_app/shared/components/time_in_hour_and_minute.dart';
import 'package:clock_app/shared/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              'El_Beheira | EGP',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const TimeInHourAndMinute(),
            const Spacer(),
            const Clock(),
            const Spacer(),
            SizedBox(
              width: getProportionateScreenWidth(233),
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Theme.of(context).primaryIconTheme.color!,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                        DateFormat.yMMMd().format(DateTime.now()),
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w200
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
