<?php
$my_home = '/home/fen/';

$aliases['parent'] = array(
  'path-aliases' => array(
    '%dump-dir' => $my_home . 'nobackup',
  ),
  'command-specific' => array (
    'sql-sync' => array (
      'mode' => 'avz',
      'no-cache' => TRUE,
    ),
  ),
);
$aliases['dscadev'] = array(
  'parent' => '@local.parent',
  'root'   => "/home/fen/workspace/dscadev/docroot",
  'uri'    => "dscadev.localhost",
);
$aliases['dscac'] = array(
  'parent' => '@local.parent',
  'root'   => "/home/fen/workspace/dscac/docroot",
  'uri'    => "dscac.localhost",
);
# acquia hosting: fen subscription
$aliases['dsca7'] = array(
  'parent' => '@local.parent',
  'root'   => "/home/fen/workspace/dsca7/docroot",
  'uri'    => "dsca7.localhost",
);
# from pantheon
$aliases['protodsca'] = array(
  'parent' => '@local.parent',
  'root'   => "/home/fen/workspace/protodsca",
  'uri'    => "protodsca.localhost",
);
$aliases['dscacommons'] = array(
  'parent' => '@local.parent',
  'root'   => "/home/fen/workspace/protodsca",
  'uri'    => "protodsca.localhost",
);
$aliases['dsca6'] = array(
  'parent' => '@local.parent',
  'root'   => "/home/fen/workspace/dsca6/docroot",
  'uri'    => "dsca6.localhost",
);
$aliases['pki7'] = array(
  'parent' => '@local.parent',
  'root'   => "/home/fen/workspace/pki7/docroot",
  'uri'    => "pki7.localhost",
);
# random localhost sites
$aliases['crmcore'] = array(
  'parent' => '@local.parent',
  'root'   => "/home/fen/workspace/crmcore/docroot",
  'uri'    => "crmcore.localhost",
);
$aliases['crm44'] = array(
  'parent' => '@local.parent',
  'root'   => "/home/fen/workspace/crm44/docroot",
  'uri'    => "crm44.localhost",
);
$aliases['ejusa'] = array(
  'parent' => '@local.parent',
  'root'   => "/home/fen/workspace/ejusa/docroot",
  'uri'    => "ejusa.localhost",
);
$aliases['ejusa-civicrm'] = array(
  'parent'   => '@local.ejusa',
  'database' => 'civicrm',
);
$aliases['dli'] = array(
  'parent' => '@local.parent',
  'root'   => "/home/fen/workspace/dli/docroot",
  'uri'    => "dli.localhost",
);
$aliases['gg'] = array(
  'parent' => '@local.parent',
  'root'   => "/home/fen/workspace/gg/docroot",
  'uri'    => "gg.localhost",
);
$aliases['fosterclub'] = array(
  'parent' => '@local.parent',
  'root'   => "/home/fen/workspace/fosterclub/docroot",
  'uri'    => "fosterclub.localhost",
);
$aliases['marin'] = array(
  'parent' => '@local.parent',
  'root'   => "/home/fen/workspace/marin",
  'uri'    => "marin.localhost",
);
$aliases['entity'] = array(
  'parent' => '@local.parent',
  'root'   => "/home/fen/workspace/entity/docroot",
  'uri'    => "entity.localhost",
);
# random multisites (.#.net)
$aliases['sacnas'] = array(
  'parent' => '@local.parent',
  'root'   => "/home/fen/workspace/drupal-6",
  'uri'    => "sacnas.6.net",
);
