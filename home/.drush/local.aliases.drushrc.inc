<?php
/**
 * @file local.aliases.drushrc.inc
 * Legacy multi-sites (required by local.aliases.drushrc.php)
 */
$aliases['agb'] = array(
  'parent' => '@local.parent',
  'root'   => "/home/fen/workspace/drupal-6",
  'uri'    => "agb.6.net",
);
$aliases['agbsearch'] = array(
  'parent' => '@local.parent',
  'root'   => "/home/fen/workspace/drupal-6",
  'uri'    => "agbsearch.6.net",
);
$aliases['cnu'] = array(
  'parent' => '@local.parent',
  'root'   => "/home/fen/workspace/drupal-6",
  'uri'    => "cnu.6.net",
);
$aliases['dnow'] = array(
  'parent' => '@local.parent',
  'root'   => "/home/fen/workspace/drupal-6",
  'uri'    => "dnow.6.net",
);
$aliases['sacnas'] = array(
  'parent' => '@local.parent',
  'root'   => "/home/fen/workspace/drupal-6",
  'uri'    => "sacnas.6.net",
);
$aliases['sedona'] = array(
  'parent' => '@local.parent',
  'root'   => "/home/fen/workspace/drupal-6",
  'uri'    => "sedona.6.net",
);
# CiviCRM sites
$aliases['cnu-civicrm'] = array(
  'parent'   => '@local.cnu',
  'database' => 'civicrm',
);
$aliases['dnow-civicrm'] = array(
  'parent'   => '@local.dnow',
  'database' => 'civicrm',
);
$aliases['sacnas-civicrm'] = array(
  'parent'   => '@local.sacnas',
  'database' => 'civicrm',
);
$aliases['sedona-civicrm'] = array(
  'parent'   => '@local.sedona',
  'database' => 'civicrm',
);
