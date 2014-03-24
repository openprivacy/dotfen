<?php
$options['shell-aliases']['h'] = 'help';
$options['shell-aliases']['noncore'] = 'pm-list --no-core';
$options['shell-aliases']['unsuck'] = 'pm-disable -y overlay,dashboard';
$options['shell-aliases']['clone'] = 'dl --package-handler=git_drupalorg';
$options['shell-aliases']['self-alias'] = 'site-alias @self --with-db --alias-name=new';
$options['shell-aliases']['site-get'] = '@none php-eval "return drush_sitealias_site_get();"';
$options['shell-aliases']['ulif'] = 'uli --browser=firefox';
$options['shell-aliases']['ulic'] = 'uli --browser=chromium-browser';

# change to the admin_menu_toolbar
$options['shell-aliases']['retool'] = '!drush pm-download admin_menu && drush pm-disable -y toolbar && drush pm-enable -y admin_menu_toolbar';

// Add a 'pm-clone' to simplify git cloning from drupal.org.
$options['shell-aliases']['pm-clone'] = 'pm-download --gitusername=fen --package-handler=git_drupalorg';

// Local cache of all projects checked out using --package-handler=git_drupalorg
$options['cache'] = TRUE;

// Clone extensions (modules, themes, etc.) from drupal.org via 'pm-download'.
// $options['package-handler'] = 'git_drupalorg';

// Show database passwords in 'status' and 'sql-conf' commands.
$options['show-passwords'] = 1;

// List of tables whose *data* is skipped by the 'sql-dump' and 'sql-sync'
$options['structure-tables']['common'] = array('cache', 'cache_*', 'history', 'search_*', 'sessions', 'watchdog');

// List of tables to be omitted entirely from SQL dumps made by the 'sql-dump'
// and 'sql-sync' with the "--skip-tables-key=common" option
$options['skip-tables']['common'] = array('migration_*');

// Help Drush find your Drupal root from your sandbox project directories.
// I've started converting my sandbox directories to use the .fen.net extension
// so that Chrome can properly address them.  But I have a mishmash of sandboxes
// some with, some without that extension.  Using explode() is heavy, but works.
function get_multisite_docroot($sitename, $base) {
  list($site,$version,$net) = explode('.',$sitename);
  $corelist = array('5' => 'drupal-5',
              '5r' => 'drupal-5r',
              '6'  => 'drupal-6',
              '6p' => 'pressflow-6',
              '7'  => 'drupal-7',
              '7c' => 'commons-7',
  );
  // echo "sitename=$sitename, base=$base, version=$version, core=$corelist[$version]\n";
  if (isset($corelist[$version])) {
    return $base .'/'. $corelist[$version];
  }
}
// set local sites directory (usually ~/workspace)
/*
if (file_exists("settings.php")) {
  $cwd = getcwd();
  $pos = strrpos($cwd, '/');
  $site = substr($cwd, $pos + 1);
  $base = substr($cwd, 0, $pos);
  // if not a multi-site instance, return
  if ($site == 'default' || substr($site, -10) == '.localhost') return;
  $docroot = get_multisite_docroot($site, $base);
  if ($docroot) {
    $options['r'] = $docroot;
    // if an alias is already set, return
    if (isset($aliases[$sitename])) return;
    $aliases[$sitename] = array(
      'path-aliases' => array(
        '%dump-dir' => 'nobackup',
      ),
      'root' => "$docroot",
      'uri' => "http://$site",
    );
  }
  //print_r($aliases);
}
*/
// Tell drush we're using svn to manage our local codebase. Further, when updating
// a module/theme, tell drush to issue the necessary 'svn add' and 'svn rm' commands
// to sync files that have been added to / deleted from the module. Note that this does
// not automatically commit the updated module to svn, you're encouraged to test the
// updated module first and run 'svn st' to inspect the changes before committing.
//$options['version-control'] = 'svn';
//$options['svnsync'] = TRUE;

$command_specific['site-install'] = array(
  'account-name' => 'admin',
  'account-pass' => 'root',
  'account-mail' => 'fen@openprivacy.org',
  'site-mail'    => 'fen@openprivacy.org',
);
