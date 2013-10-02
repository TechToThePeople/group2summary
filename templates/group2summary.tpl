<div id='groups'>
  <div class='crm-summary-row groups'>
    <div class='crm-label'>Groups</div>
    <div class='crm-content'>
      <span id="load_groups" class="crm-button">show me<span>
    </div>
  </div>
</div>

<script>
{* 
var data={crmAPI entity='GroupContact' action='get' sequential=1 contact_id=$contactId};
to avoid creating javascript global variables, wrap them in an anonymous function and assign the parameters from smarty variables on the last line before {/literal} 
*}

{literal}
(function(contact_id,data){

cj(function($){
  if ($(".crm-contact_type_label").length == 0) {
    CRM.notify("Someone has changed the summary layout, groups can't be displayed properly");
    return;
  }
  $(".crm-contact_type_label").parent().parent().prepend($("#groups").html());
  $("#groups").remove();

  var groups=[];
  $.each(data.values, function(key) {
    groups.push(data.values[key].title);
  });
  $(".groups .crm-content").html(groups);
    
  });

}
{/literal}
({$contactId},
{crmAPI entity='GroupContact' action='get' sequential=1 contact_id=$contactId}
));
</script>
