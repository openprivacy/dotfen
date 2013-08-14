<?php
// how to reliably cache the created aliases, then support refresh
if (!function_exists("sbox_make_alias")) {
  function sbox_make_alias(&$aliases) {
    // set local sites directory (usually ~/workspace)
    $sitesdir = getenv('WORKSPACE');
    if (!$sitesdir) {
      $sitesdir = getenv('HOME') .'/workspace';
    }
    if (!is_dir($sitesdir)) {
      drush_die("Could not find \$HOME.  Please set WORKSPACE envariable.");
    }
    // look in sites directory for directories
    $sitesall = scandir($sitesdir);
    foreach ($sitesall as $site) {
      if (! is_dir($sitesdir .'/'. $site) || $site == 'default') {
        continue;
      }
      // if we find a settings.php file, add the alias
      if (file_exists("$sitesdir/$site/settings.php") && $docroot = get_multisite_docroot($site, $sitesdir)) {
        $aliases[$site] = array(
          'path-aliases' => array(
            '%dump-dir' => 'nobackup',
          ),
          'root' => $docroot,
          'uri' => "http://$site",
        );
        // echo "multisite aliases[$site]: "; print_r($aliases[$site]);
      }
      // if we find a SITENAME/sites/SITENAME*.local/settings.php file, add the alias
      elseif (file_exists("$sitesdir/$site/sites/${site}.localhost/settings.php")) {
        $aliases[$site] = array(
          'path-aliases' => array(
            '%dump-dir' => 'nobackup',
          ),
          'root' => "$sitesdir/$site/sites/${site}.localhost",
          'uri' => "http://${site}.localhost",
        );
        // echo "localhost aliases[$site]: "; print_r($aliases[$site]);
      }
      // if we find a SITENAME/docroot/sites/default/settings.php file, add the alias
      elseif (file_exists("$sitesdir/$site/docroot/sites/default/settings.php")) {
        $aliases[$site] = array(
          'path-aliases' => array(
            '%dump-dir' => 'nobackup',
          ),
          'root' => "$sitesdir/$site/docroot",
          'uri' => "http://${site}.fen.net",
        );
        // echo "docroot aliases[$site]: "; print_r($aliases[$site]);
      }
      else {
        drush_log("no settings.php in @s", array('@s' => $site), 'warning');
      }
    }
  }
}
sbox_make_alias($aliases);
// echo "all aliases: "; print_r($aliases);
