<?php
/**
 * @file .drushrc.php
 * Drush aliases from example.aliases.drushrc.php and other places.
 */
$options['shell-aliases']['pull'] = '!git pull'; // We've all done it
$options['shell-aliases']['noncore'] = 'pm-list --no-core';
$options['shell-aliases']['unsuck'] = 'pm-disable -y overlay,dashboard';
$options['shell-aliases']['offline'] = 'variable-set -y --always-set maintenance_mode 1';
$options['shell-aliases']['online'] = 'variable-delete -y --exact maintenance_mode';
$options['shell-aliases']['self-alias'] = 'site-alias @self --with-db --alias-name=new';
$options['shell-aliases']['site-get'] = '@none php-eval "return drush_sitealias_site_get();"';
// Add a 'pm-clone' to simplify git cloning from drupal.org.
$options['shell-aliases']['pm-clone'] = 'pm-download --gitusername=fen --package-handler=git_drupalorg';

// Show database passwords in 'status' and 'sql-conf' commands.
$options['show-passwords'] = 1;

// Options added by Fen (thanks to David & Owen)
$options['shell-aliases']['h'] = 'help';
$options['shell-aliases']['ulif'] = 'uli --browser=firefox';
$options['shell-aliases']['ulic'] = 'uli --browser=chromium-browser';

// Change new Drupal 7 site to use the admin_menu_toolbar
$options['shell-aliases']['retool'] = '!drush pm-download admin_menu && drush pm-disable -y toolbar && drush pm-enable -y admin_menu_toolbar';

// List of tables whose *data* is skipped by the 'sql-dump' and 'sql-sync'
$options['structure-tables']['common'] = array('cache', 'cache_*', 'history', 'search_*', 'sessions', 'watchdog');

// List of tables to be omitted entirely from SQL dumps made by the 'sql-dump'
// and 'sql-sync' with the "--skip-tables-key=common" option
$options['skip-tables']['common'] = array('migration_*');

// Values to use for `drush si`.
$command_specific['site-install'] = array(
  'account-name' => 'admin',
  'account-pass' => 'root',
  'account-mail' => 'fen@openprivacy.org',
  'site-mail'    => 'fen@openprivacy.org',
);
