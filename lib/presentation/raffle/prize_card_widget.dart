import 'package:flutter/material.dart';
import 'package:skidata/models/prize_model.dart';
import 'package:skidata/presentation/app_card.dart';
import 'package:skidata/utils/constants.dart';

class PrizeCardWidget extends StatelessWidget {
  final Prize prize;
  final int entries;
  const PrizeCardWidget({
    super.key,
    required this.prize,
    required this.entries,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: CustomCard(
        hasBorder: false,
        padding: EdgeInsets.zero,
        hasMinHeight: true,
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(4)),
                  child: SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/${prize.imageUrl}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      padding: const EdgeInsets.all(0.8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.75),
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4),
            child: Row(
              children: [
                Text(
                  Prize.getPrizeIcon(entries, prize.tier)
                      ? 'Tier unlocked'
                      : 'Tier locked',
                  style: const TextStyle(
                      fontSize: 14,
                      color: kprimaryColor,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 4,
                ),
                Icon(
                  Prize.getPrizeIcon(entries, prize.tier)
                      ? Icons.lock_open_sharp
                      : Icons.lock,
                  size: 15,
                  color: kprimaryColor,
                ),
                const Spacer(),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
            height: 0,
            thickness: 0.2,
          ),
          Row(
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  child: Text(
                    prize.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      color: kTextGrey,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Text(
              prize.description,
              style: const TextStyle(color: kTextGrey, fontSize: 12),
              textAlign: TextAlign.justify,
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          kSBox30V,
        ],
      ),
    );
  }
}
