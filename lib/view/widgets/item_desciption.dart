import 'package:flutter/material.dart';

import '../styles/styles.dart';

class ItemDescription extends StatelessWidget {
  const ItemDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
      decoration: BoxDecoration(
        color: netralCardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 12,
              left: 12,
              right: 12,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Item Description',
                      style: heading7.copyWith(color: blackTextColor),
                    ),
                    const Spacer(),
                    Text(
                      "Laptop",
                      style: paragraph4.copyWith(color: blackTextColor),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      'Quantity',
                      style: heading7.copyWith(color: blackTextColor),
                    ),
                    const Spacer(),
                    Text(
                      "2 pcs",
                      style: paragraph4.copyWith(color: blackTextColor),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      'Price',
                      style: heading7.copyWith(color: blackTextColor),
                    ),
                    const Spacer(),
                    Text(
                      "5.000.000",
                      style: paragraph4.copyWith(color: blackTextColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          Container(
            padding: const EdgeInsets.only(
              top: 8,
              left: 12,
              right: 12,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Total',
                      style: heading5.copyWith(color: primaryBackground),
                    ),
                    const Spacer(),
                    Text(
                      "10.000.000",
                      style: subhead2.copyWith(color: primaryBackground),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
