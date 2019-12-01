/*<script>*/	// color coding

var oForm = eval("document.forms['frmList']");
if ( oForm == null ) oForm = eval("document.forms[0]");

var obj = oForm['cate[]'];
var st = 0 + 1;

for (i=st;i<obj.length;i++){
	for (j=obj[i].options.length;j>0;j--) obj[i].remove(j);
	obj[i].options.selectedIndex = 0;
}

function category_update(ob,ret,category,val)
{
	var idx = category.length / 3;
	var obj = oForm[ob][idx];
	var div2 = new Array();

	if (typeof(obj)=="object" && ret){
		div = eval("("+ret+")");
		if( obj.options.length != "undefined" ){
			for (i=obj.options.length;i>0;i--) obj.remove(1);
			for (i=0;i<div.length;i++){
				div2 = div[i];
				obj.options[i+1] = new Option(div2[0],div2[1]);
				if (div2[1]==val.substring(0,div2[1].length)) obj.selectedIndex = i+1;
			}
		}
	}
}

category_update("cate[]","[[\"집반찬\",\"001\"],[\"집반찬 간편분류\",\"002\"],[\"집반찬 추천\",\"003\"]]","","");
