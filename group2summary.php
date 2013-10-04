<?php
require_once 'group2summary.civix.php';
 
function group2summary_civicrm_summary( $contactID, &$content) {
  CRM_Core_Region::instance('page-body')->add(array(
    'template' => 'group2summary.tpl'
  ));
}

function group2summary_civicrm_config(&$config) {
  _group2summary_civix_civicrm_config($config);
}
