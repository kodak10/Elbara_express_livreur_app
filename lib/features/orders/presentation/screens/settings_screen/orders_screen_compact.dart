import 'package:deliverzler/features/orders/presentation/components/app_settings_section_component.dart';
import 'package:deliverzler/features/orders/presentation/components/orders_component.dart';
import 'package:flutter/material.dart';

import '../../../../../core/presentation/screens/nested_screen_scaffold.dart';
import '../../../../../core/presentation/styles/styles.dart';

class OrdersScreenCompact extends StatelessWidget {
  const OrdersScreenCompact({Key? key});

  @override
  Widget build(BuildContext context) {
    return NestedScreenScaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          // vertical: Sizes.screenPaddingV20,
          // horizontal: Sizes.screenPaddingH36,
          vertical: 0,
          horizontal: 0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: OrdersComponent(),
            ),
            SizedBox(height: Sizes.marginV12),
          ],
        ),
      ),
    );

    
  }
}
