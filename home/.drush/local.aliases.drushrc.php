<?php
$my_home_dir = getenv('HOME');

if (!is_dir($my_home_dir)) {
  drush_die("Could not find home: '\$HOME'.");
}
$aliases['parent'] = array(
  'path-aliases' => array(
    '%dump-dir' => $my_home_dir . '/nobackup',
  ),
  'command-specific' => array (
    'sql-sync' => array (
      'mode' => 'avz',
      'no-cache' => TRUE,
    ),
  ),
);

/**
 * Create local aliases for standard docroot-based sites
 */
if (!function_exists("make_local_drush_aliases")) {
  function make_local_drush_aliases($my_home_dir, &$aliases) {
    // Set local sites directory (usually ~/workspace)
    $sitesdir = $my_home_dir . '/workspace';
    if (!is_dir($sitesdir)) {
      drush_die("Could not find $my_home_dir/workspace.");
    }
    // Look in sites directory for directories
    $sitesall = scandir($sitesdir);
    foreach ($sitesall as $site) {
      if (! is_dir($sitesdir .'/'. $site) || $site == 'default') {
        continue;
      }
      // if we find a settings.php file, add the alias
      if (file_exists("$sitesdir/$site/docroot/sites/default/settings.php")) {
        $aliases[$site] = array(
          'parent' => '@local.parent',
          'root' => "$sitesdir/$site/docroot",
          'uri' => "${site}.localhost",
        );
        if (file_exists("$sitesdir/$site/docroot/sites/default/civicrm.settings.php")) {
          $aliases[$site . '-civicrm'] = array(
            'parent' => '@local.' . $site,
            'database' => 'civicrm',
          );
        }
      }
    }
  }
}
make_local_drush_aliases($my_home_dir, $aliases);

// Random non-standard sites
$aliases['marin'] = array(
  'parent' => '@local.parent',
  'root'   => "/home/fen/workspace/marin",
  'uri'    => "marin.localhost",
);
$aliases['sacnas'] = array(
  'parent' => '@local.parent',
  'root'   => "/home/fen/workspace/drupal-6",
  'uri'    => "sacnas.6.net",
);
// from pantheon
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
