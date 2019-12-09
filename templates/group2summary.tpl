<div id='groups' style="display: none">
  <div class='crm-summary-row groups'>
    <div class='crm-label'>{ts}Groups{/ts}</div>
    <div class='crm-content'>
      <span id="load_groups" class="crm-button">show me<span>
    </div>
  </div>
</div>

{* 
var data={crmAPI entity='GroupContact' action='get' sequential=1 contact_id=$contactId};
to avoid creating javascript global variables, wrap them in an anonymous function and assign the parameters from smarty variables on the last line before
*}

{literal}
<style>
.groups .crm-label,#group_add li {cursor:pointer;}
</style>

<script>
(function(contact_id,data){

cj(function($){
  if ($(".crm-contact_type_label").length == 0) {
    CRM.console('log', 'group2summary:', "Someone has changed the summary layout, groups can't be displayed properly");
    return;
  }
  $(".crm-contact_type_label").parent().parent().prepend($("#groups").html());
  $("#groups").remove();

  var groups=[];
  $.each(data.values, function(key) {
    groups.push(data.values[key].title);
  });
  $(".groups .crm-content").html(groups.join(","));

    
  $(".groups .crm-label").click(function(){
    CRM.api3('Group', 'get', {'sequential': 1},false)
    .done(function(data) {
      var groups= "<ul id='group_add'>";
      $.each(data.values, function(key) {
        groups = groups + "<li data-id='"+data.values[key].id+"'>"+data.values[key].title+"</li>";
      });
      groups = groups + "<ul>";
      CRM.alert(groups,"add to a group","info",{expires:0});
      $("#group_add li").click(function(){
        var id = $(this).data("id");
        var name = $(this).html();
        CRM.api3('GroupContact', 'create', {'sequential': 1, 'group_id':id,'contact_id': contact_id},"added to group "+name)
        .done(function(data) {
          var groups =$(".groups .crm-content").html();
          $(".groups .crm-content").html(groups+","+name);
         });
      }); 
    });
  });

});

}
{/literal}
({$contactId},
{crmAPI entity='GroupContact' action='get' sequential=1 contact_id=$contactId}
));
</script>
