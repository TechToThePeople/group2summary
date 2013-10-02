{* tip: add {debug} to get the list of available variables in the template *}


{crmAPI var='result' entity='GroupContact' action='get' sequential=1 contact_id=$contactId}

<div id='groups'>
  <div class='crm-summary-row'>
    <div class='crm-label'>Groups</div>
    <div class='crm-content'>
      {foreach from=$result.values item=g}
        {$g.title}, 
      {/foreach}
    </div>
  </div>
</div>


{literal}
<script>
cj(function($){
  if ($(".crm-contact_type_label").length == 0) {
    CRM.notify("Someone has changed the summary layout, groups can't be displayed properly");
    return;
  }
  $(".crm-contact_type_label").parent().parent().prepend($("#groups").html());
  $("#groups").remove();
});
</script>
{/literal}
