$(document).ready(function(){ 
	var Kind = $("#Kind").val();
	$("#selectKind option[value="+Kind+"] ").attr("selected",true);
	
	var Status = $("#Status").val();
	$("#selectStatus option[value="+Status+"] ").attr("selected",true);
});