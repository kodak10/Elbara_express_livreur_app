import 'package:deliverzler/core/presentation/helpers/localization_helper.dart';
import 'package:deliverzler/core/presentation/styles/styles.dart';
import 'package:deliverzler/core/presentation/widgets/cached_network_image_circular.dart';
import 'package:deliverzler/features/orders/domain/order.dart';
import 'package:flutter/material.dart';


class CardUserDetailsComponent extends StatelessWidget {
  const CardUserDetailsComponent({
    required this.order,
    super.key,
  });
  final AppOrder order;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CachedNetworkImageCircular(
          imageUrl: order.userImage,
          radius: Sizes.imageR28,
        ),
        const SizedBox(
          width: Sizes.marginH8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                order.userName.isEmpty
                    ? tr(context).user + order.userId.substring(0, 6)
                    : order.userName,
                style: TextStyles.f14(context).copyWith(fontWeight: FontStyles.fontWeightBold),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                order.address!.mobile,
                style: TextStyles.f12(context),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
