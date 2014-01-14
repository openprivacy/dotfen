<?php
$aliases['parent'] = array(
  'path-aliases' => array(
    '%dump-dir' => 'nobackup',
  ),
  'source-command-specific' => array (
    'sql-sync' => array (
      'no-cache' => TRUE,
      'structure-tables-key' => 'common',
    ),
  ),
  'command-specific' => array (
    'sql-sync' => array (
      'no-ordered-dump' => TRUE,
      'structure-tables-list' => array(
        'common' => array(
          'cache', 'cache_filter', 'cache_menu', 'cache_page',
          'history', 'sessions', 'watchdog',
        ),
      ),
    ),
  ),
);
$aliases['dscadev'] = array(
  'parent' => '@local.parent',
  'root'   => "/home/fen/workspace/dscadev/docroot",
  'uri'    => "dscadev.fen.net",
);
$aliases['gg'] = array(
  'parent' => '@local.parent',
  'root'   => "/home/fen/workspace/gg/docroot",
  'uri'    => "gg.localhost",
);
$aliases['fosterclub'] = array(
  'parent' => '@local.parent',
  'root'   => "/home/fen/workspace/fosterclub/docroot",
  'uri'    => "fosterclub.fen.net",
);
$aliases['marin'] = array(
  'parent' => '@local.parent',
  'root'   => "/home/fen/workspace/marin",
  'uri'    => "marin.localhost",
);
