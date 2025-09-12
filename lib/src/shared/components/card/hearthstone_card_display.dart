import 'package:do_you_know_hearthstone/src/core/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:do_you_know_hearthstone/src/shared/models/hearthstone_card.dart';
import 'package:do_you_know_hearthstone/src/shared/models/enums.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HearthstoneCardDisplay extends StatelessWidget {
  final HearthstoneCard card;
  final double elevation;
  final EdgeInsetsGeometry padding;

  const HearthstoneCardDisplay({
    super.key,
    required this.card,
    this.elevation = 4.0,
    this.padding = const EdgeInsets.all(12.0),
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Card image placeholder
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 4.0,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          if (card.rarity != null)
                            Tooltip(
                              message: card.rarity.toString().split('.').last,
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: _rarityColor(card.rarity!),
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    color: Colors.black26,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                          Text(
                            card.name,
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      if (card.cost != null)
                        Text(
                          'Cost: ${card.cost}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),

                      if (card.cardClass != null)
                        Text(
                          'Class: ${card.cardClass.toString().split('.').last[0].toUpperCase()}${card.cardClass.toString().split('.').last.substring(1)}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      if (card.set != null)
                        Text(
                          'Set: ${card.set.toString().split('.').last[0].toUpperCase()}${card.set.toString().split('.').last.substring(1)}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (card.text != null) Html(data: card.text!),
            const SizedBox(height: 8),
            if (card.race != null ||
                card.type != null ||
                card.spellSchool != null)
              Align(
                alignment: Alignment.center,
                child: Wrap(
                  spacing: 8.0,
                  children: [
                    if (card.type != null)
                      Chip(
                        label: Text(
                          card.type
                                  .toString()
                                  .split('.')
                                  .last[0]
                                  .toUpperCase() +
                              card.type.toString().split('.').last.substring(1),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        backgroundColor: Colors.grey[200],
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    if (card.race != null)
                      Chip(
                        label: Text(
                          card.race
                                  .toString()
                                  .split('.')
                                  .last[0]
                                  .toUpperCase() +
                              card.race.toString().split('.').last.substring(1),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        backgroundColor: HearthstoneCardDisplay._raceColor(
                          card.race,
                        ),
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    if (card.spellSchool != null &&
                        card.spellSchool != SpellSchool.none &&
                        card.spellSchool != SpellSchool.invalid)
                      Chip(
                        label: Text(
                          card.spellSchool
                                  .toString()
                                  .split('.')
                                  .last[0]
                                  .toUpperCase() +
                              card.spellSchool
                                  .toString()
                                  .split('.')
                                  .last
                                  .substring(1),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        backgroundColor:
                            HearthstoneCardDisplay._spellSchoolColor(
                              card.spellSchool,
                            ),
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                  ],
                ),
              ),
            const SizedBox(height: Dimens.spacing),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: Row(
                    children: [
                      // if (card.armor != null)
                      //   _StatIcon(
                      //     icon: Icons.shield,
                      //     value: card.armor.toString(),
                      //   ),
                      // if (card.durability != null)
                      //   _StatIcon(
                      //     icon: Icons.build,
                      //     value: card.durability.toString(),
                      //   ),
                    ],
                  ),
                ),
                if (card.attack != null)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: _StatIcon(
                      icon: FontAwesomeIcons.handFist,
                      value: card.attack.toString(),
                    ),
                  ),
                if (card.health != null)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: _StatIcon(
                      icon: FontAwesomeIcons.heart,
                      value: card.health.toString(),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: Dimens.tripleSpacing),
            if (card.flavor != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  '"${card.flavor}"',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey[600],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Hearthstone spell school color mapping
  static Color _spellSchoolColor(SpellSchool? school) {
    if (school == null) return Colors.grey[200]!;
    switch (school) {
      case SpellSchool.arcane:
        return Colors.purple[300]!;
      case SpellSchool.fire:
        return Colors.red[400]!;
      case SpellSchool.frost:
        return Colors.blue[200]!;
      case SpellSchool.nature:
        return Colors.green[400]!;
      case SpellSchool.holy:
        return Colors.yellow[300]!;
      case SpellSchool.shadow:
        return Colors.deepPurple[900]!;
      case SpellSchool.fel:
        return Colors.green[900]!;
      default:
        return Colors.grey[200]!;
    }
  }

  // Hearthstone rarity color mapping
  static Color _rarityColor(Rarity rarity) {
    switch (rarity) {
      case Rarity.common:
        return Colors.grey;
      case Rarity.rare:
        return Colors.blue;
      case Rarity.epic:
        return Colors.purple;
      case Rarity.legendary:
        return Colors.orange;
      default:
        return Colors.transparent;
    }
  }

  // Hearthstone tribe/race color mapping
  static Color _raceColor(race) {
    final raceStr = race.toString().split('.').last.toLowerCase();
    switch (raceStr) {
      case 'beast':
        return Colors.brown[300]!;
      case 'demon':
        return Colors.deepPurple[400]!;
      case 'dragon':
        return Colors.blue[300]!;
      case 'elemental':
        return Colors.orange[300]!;
      case 'mech':
        return Colors.grey[400]!;
      case 'murloc':
        return Colors.cyan[300]!;
      case 'pirate':
        return Colors.red[300]!;
      case 'totem':
        return Colors.lightBlue[300]!;
      case 'undead':
        return Colors.green[300]!;
      case 'quilboar':
        return Colors.pink[200]!;
      case 'naga':
        return Colors.teal[300]!;
      case 'all':
        return Colors.amber[300]!;
      case 'none':
        return Colors.grey[200]!;
      default:
        return Colors.teal[100]!;
    }
  }
}

class _StatIcon extends StatelessWidget {
  final IconData icon;
  final String value;

  const _StatIcon({required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey[700]),
          const SizedBox(width: 4),
          Text(value, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
