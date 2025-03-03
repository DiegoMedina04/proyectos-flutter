import 'package:flutter/material.dart';

class MenuItems {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItems({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItems>[
  MenuItems(
    title: 'Botones',
    subtitle: 'Varios botones en flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItems(
    title: 'Tarjetas',
    subtitle: 'Un contenedor estilizado',
    link: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItems(
    title: 'ProgressIndicators',
    subtitle: 'Indicadores de progreso',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),
  MenuItems(
    title: 'Snackbar y dialogos',
    subtitle: 'Indicadores de progreso',
    link: '/snackbar',
    icon: Icons.info_outline,
  ),
  MenuItems(
    title: 'Animated container',
    subtitle: 'Statefull widget animado',
    link: '/animated',
    icon: Icons.check_box_outlined,
  ),
  MenuItems(
    title: 'UI Controls',
    subtitle: 'Controles de usuario',
    link: '/ui-controls',
    icon: Icons.car_crash_rounded,
  ),
  MenuItems(
    title: 'Introduccion a la app',
    subtitle: 'Tutorial de flutter',
    link: '/tutorial',
    icon: Icons.accessibility_new_outlined,
  ),
  MenuItems(
    title: 'Infinite y pull',
    subtitle: 'Lista infinita y pull to refresh',
    link: '/infinite',
    icon: Icons.list_alt_rounded,
  ),
  MenuItems(
    title: 'Riverd Counter',
    subtitle: 'Introduccion a riverpod',
    link: '/counter-river',
    icon: Icons.list_alt_rounded,
  ),
  MenuItems(
    title: 'Cambiar tema',
    subtitle: 'Cambiar tema de la aplicacion',
    link: '/theme-changer',
    icon: Icons.color_lens_outlined,
  ),
];
