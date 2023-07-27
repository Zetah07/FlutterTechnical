import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
  title: 'Botones',
  subTitle: 'Botones en Flutter',
  link: '/buttons',
  icon: Icons.smart_button_outlined,
  ),
  MenuItem(
  title: 'Tarjetas',
  subTitle: 'contenedor estilizado',
  link: '/cards',
  icon: Icons.credit_card,
  ),
  MenuItem(
    title: 'Progress Indicators',
    subTitle: 'Progress Indicators en Flutter',
    link: '/progress',
    icon: Icons.hourglass_empty_outlined,
  ),
  MenuItem(
    title: 'Snackbar y Dialogs',
    subTitle: 'indicadores en pantalla',
    link: '/snackbar',
    icon: Icons.notifications_active_outlined,
  ),
  MenuItem(
    title: 'Animated container',
    subTitle: 'animaciones en Flutter',
    link: '/animated',
    icon: Icons.animation_outlined,
  ),

];