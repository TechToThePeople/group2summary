<?php

function group2summary_civicrm_summary( $contactID, &$content) {
//beware, exceptions thrown. you should add a try catch
$group = civicrm_api3('GroupContact', 'get', array("sequential"=>true,"contact_id"=>$contactID ));
$content = "<div id='groups'><div class='crm-summary-row'><div class='crm-label'>Groups</div><div class='crm-content'>";

foreach ($group["values"] as $g) {
  $content .= $g["title"] .", ";
}
$content .= "</div></div></div>";

$content .=  <<< EOT
<script>
cj(function($){
  if ($(".crm-contact_type_label").length == 0) {
    CRM.alert("Someone has changed the summary layout, groups can't be displayed properly");
    return;
  }
  $(".crm-contact_type_label").parent().parent().prepend($("#groups").html());
});
</script>
EOT;
 
}

