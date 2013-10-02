<?php

require_once 'group2summary.civix.php';
require_once ("api/class.api.php");

function group2summary_civicrm_summary( $contactID, &$content) {
$api = new civicrm_api3();

$api->GroupContact->get(array("contact_id"=>$contactID ));

$content = "<div id='groups'><div class='crm-summary-row'><div class='crm-label'>Groups</div><div class='crm-content'>";

foreach ($api->values as $g) {
  $content .= $g->title .", ";
}
$content .= "</div></div></div>";

$content .=  <<< EOT
<script>
cj(function($){
  if ($(".crm-contact_type_label").length == 0) {
    CRM.notify("Someone has changed the summary layout, groups can't be displayed properly");
    return;
  }
  $(".crm-contact_type_label").parent().parent().prepend($("#groups").html());
});
</script>
EOT;
 
}




/* default behaviour */

/**
 * Implementation of hook_civicrm_config
 */
function group2summary_civicrm_config(&$config) {
  _group2summary_civix_civicrm_config($config);
}

/**
 * Implementation of hook_civicrm_xmlMenu
 *
 * @param $files array(string)
 */
function group2summary_civicrm_xmlMenu(&$files) {
  _group2summary_civix_civicrm_xmlMenu($files);
}

/**
 * Implementation of hook_civicrm_install
 */
function group2summary_civicrm_install() {
  return _group2summary_civix_civicrm_install();
}

/**
 * Implementation of hook_civicrm_uninstall
 */
function group2summary_civicrm_uninstall() {
  return _group2summary_civix_civicrm_uninstall();
}

/**
 * Implementation of hook_civicrm_enable
 */
function group2summary_civicrm_enable() {
  return _group2summary_civix_civicrm_enable();
}

/**
 * Implementation of hook_civicrm_disable
 */
function group2summary_civicrm_disable() {
  return _group2summary_civix_civicrm_disable();
}

/**
 * Implementation of hook_civicrm_upgrade
 *
 * @param $op string, the type of operation being performed; 'check' or 'enqueue'
 * @param $queue CRM_Queue_Queue, (for 'enqueue') the modifiable list of pending up upgrade tasks
 *
 * @return mixed  based on op. for 'check', returns array(boolean) (TRUE if upgrades are pending)
 *                for 'enqueue', returns void
 */
function group2summary_civicrm_upgrade($op, CRM_Queue_Queue $queue = NULL) {
  return _group2summary_civix_civicrm_upgrade($op, $queue);
}

/**
 * Implementation of hook_civicrm_managed
 *
 * Generate a list of entities to create/deactivate/delete when this module
 * is installed, disabled, uninstalled.
 */
function group2summary_civicrm_managed(&$entities) {
  return _group2summary_civix_civicrm_managed($entities);
}
