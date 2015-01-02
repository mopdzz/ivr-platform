/*var gcToggle = "#ffff00";
var gcBG = "#CCCCFF";

function IOFFICE_GetSelected(aCell)
{

  		window.returnValue = aCell.innerText;
		window.close();

}


function fPopUpDlg(dialogType,ctl,WINname,WINwidth,WINheight){

	var endtarget;
	if(dialogType == "POPUPLIST_MEETINGPRESIDIALDEPTNAME"){
        	endtarget = "../masterref/popup_meetingPresidialDeptName.jsp";
	}else if(dialogType == "POPUPLIST_MEETINGADDRESS"){
        	endtarget = "../masterref/popup_meetingAddress.jsp";
	}else if(dialogType == "POPUPLIST_MEETINGTITLE"){
        	endtarget = "../masterref/popup_meetingTitle.jsp";
	}else if(dialogType == "POPUPLIST_REMARK"){
		endtarget = "../masterref/popup_docr.jsp";
	}else if(dialogType == "POPUPLIST_POSITION"){
		endtarget = "../masterref/popup_position.jsp";
	}else if(dialogType == "POPUPLIST_UNIVERSITY"){
		endtarget = "../masterref/popup_university.jsp";
	}else if(dialogType == "POPUPLIST_MAJOR"){
		endtarget = "../masterref/popup_major.jsp";
	}else if(dialogType == "POPUPLIST_ORGAN"){
		endtarget = "../masterref/popup_organ.jsp";
	}else if(dialogType == "POPUPLIST_PROBLEMTYPE"){
		endtarget = "../masterref/popup_problemtype.jsp";
	}else if(dialogType == "POPUPLIST_CERTIFICATION"){
		endtarget = "../masterref/popup_certification.jsp";
	}else if(dialogType == "POPUPLIST_SCHEDULETYPE"){
		endtarget = "../masterref/popup_scheduletype.jsp";
	}else if(dialogType == "POPUPLIST_PLACE"){
		endtarget = "../masterref/popup_place.jsp";
	}else if(dialogType == "POPUPLIST_CONTRACTSTOP"){
		endtarget = "../masterref/popup_contractstop.jsp";
	}else if(dialogType == "POPUPLIST_WHITHER"){
		endtarget = "../masterref/popup_whither.jsp";
	}else if(dialogType == "POPUPLIST_MESSAGETITLE"){
		endtarget = "../masterref/popup_messagetitle.jsp";
	}else if(dialogType == "POPUPLIST_BOOKPURPOSE"){
		endtarget = "../masterref/popup_bookpurpose.jsp";
	} else if(dialogType == "POPUPLIST_CONTRACTSTOP"){
		endtarget = "../masterref/popup_contractstop.jsp";
	}else if(dialogType == "POPUPLIST_APPLICATIONTITLE"){
		endtarget = "../masterref/popup_applicationtitle.jsp";
	}else if(dialogType == "POPUPLIST_DDNAPPLICATIONTITLE"){
		endtarget = "../ddn/popup_ddnApplicationtitle.jsp";
	}else if(dialogType == "POPUPLIST_EMPCURPOSITION"){
		endtarget = "../masterref/popup_empcurposition.jsp";
	}else if(dialogType == "POPUPLIST_SHOWMESSAGETITLE"){
		endtarget = "../masterref/popup_showmessagetitle.jsp";
	}else if(dialogType == "POPUPLIST_COMPANYNAME"){
		endtarget = "../masterref/popup_companyname.jsp";
	}else if(dialogType == "POPUPLIST_BOOKPUBLISHER"){
		endtarget = "../masterref/popup_bookpublisher.jsp";
	}else if(dialogType == "POPUPLIST_BOOKLANGUAGE"){
		endtarget = "../masterref/popup_booklanguage.jsp";
	}else if(dialogType == "POPUPLIST_BOOKCLASSIFY"){
		endtarget = "../masterref/popup_bookclassify.jsp";
	}else if(dialogType == "POPUPLIST_PROVINCE"){
		endtarget = "../masterref/popup_province.jsp";
	}else if(dialogType == "POPUPLIST_RELATIONSHIP"){
		endtarget = "../masterref/popup_relationship.jsp";
	}else if(dialogType == "POPUPLIST_INDUSTRYTYPE"){
		endtarget = "../masterref/popup_industrytype.jsp";
	}else if(dialogType == "POPUPLIST_ENTERPRISETYPE"){
		endtarget = "../masterref/popup_enterprisetype.jsp";
	}else if(dialogType == "POPUPLIST_OPPRSTAGE"){
		endtarget = "../masterref/popup_opprstage.jsp";
	}else if(dialogType == "POPUPLIST_OPPRROLE"){
		endtarget = "../masterref/popup_opprrole.jsp";
	}else if(dialogType == "POPUPLIST_OPPRDOCTYPE"){
		endtarget = "../masterref/popup_opprdoctype.jsp";
	}else if(dialogType == "POPUPLIST_MEASUREUNIT"){
		endtarget = "../masterref/popup_measureunit.jsp";
	}else if(dialogType == "POPUPLIST_GERINFOTYPE"){
		endtarget = "../masterref/popup_gerinfotype.jsp";
	}else {
		endtarget = "../masterref/popup_posincharge.htm";
	}
	showx = event.screenX - event.offsetX - 4 - WINwidth ; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;

	if (dialogType == "POPUPLIST_CONTRACTSTOP"){
	    showx = event.screenX - event.offsetX - WINwidth + 150;
  	    showy = event.screenY - event.offsetY + 20;


	}

	newWINwidth = WINwidth + 4 + 18;
	var features =
		'dialogWidth:'  + newWINwidth  + 'px;' +
		'dialogHeight:' + WINheight + 'px;' +
		'dialogLeft:'   + showx     + 'px;' +
		'dialogTop:'    + showy     + 'px;' +
		'directories:no; localtion:no; menubar:no; status=no; toolbar=no;scrollbars:no;Resizeable=no';



	retval = window.showModalDialog(endtarget, " ", features );
	retval = trim(retval);
	if( retval != null ){
		if( dialogType == "POPUPLIST_ORGAN" && ctl.value.length > 0 ){		//在原来的String上增加
			ctl.value += "," + retval;
		}else{
			ctl.value = retval;
		}
	}else{
		//alert("canceled");
	}
}
*/
function fPopUpCalendarDlg(ctrlobj)
{
	showx = event.screenX - event.offsetX - 4 - 210 ; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	newWINwidth = 210 + 4 + 18;

	retval = window.showModalDialog("js/CalendarDlg.htm", "", "dialogWidth:197px; dialogHeight:210px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
	if( retval != null ){
		ctrlobj.value = retval;
	}else{
		//alert("canceled");
	}
}


var gdCtrl = new Object();
var goSelectTag = new Array();
var gcGray = "#808080";
var gcToggle = "#ffff00";
var gcBG = "#99CCFF";
var previousObject = null;

var gdCurDate = new Date();
var giYear = gdCurDate.getFullYear();
var giMonth = gdCurDate.getMonth()+1;
var giDay = gdCurDate.getDate();

var gCalMode = "";
var gCalDefDate = "";

var CAL_MODE_NOBLANK = "2";

function fSetDate(iYear, iMonth, iDay){
  //VicPopCal.style.visibility = "hidden";
  if ((iYear == 0) && (iMonth == 0) && (iDay == 0)){
  	gdCtrl.value = "";
  }else{
  	iMonth = iMonth + 100 + "";
  	iMonth = iMonth.substring(1);
  	iDay   = iDay + 100 + "";
  	iDay   = iDay.substring(1);
  	gdCtrl.value = iYear+"-"+iMonth+"-"+iDay;
  }

  for (i in goSelectTag)
  	goSelectTag[i].style.visibility = "visible";
  goSelectTag.length = 0;

  window.returnValue=gdCtrl.value;
  window.close();
}

function HiddenDiv()
{
	var i;
  VicPopCal.style.visibility = "hidden";
  for (i in goSelectTag)
  	goSelectTag[i].style.visibility = "visible";
  goSelectTag.length = 0;

}
function fSetSelected(aCell){
  var iOffset = 0;
  var iYear = parseInt(tbSelYear.value);
  var iMonth = parseInt(tbSelMonth.value);

  aCell.bgColor = gcBG;
  with (aCell.children["cellText"]){
  	var iDay = parseInt(innerText);
  	if (color==gcGray)
		iOffset = (Victor<10)?-1:1;

	/*** below temp patch by maxiang ***/
	if( color == gcGray ){
		iOffset = (iDay < 15 )?1:-1;
	}
	/*** above temp patch by maxiang ***/

	iMonth += iOffset;
	if (iMonth<1) {
		iYear--;
		iMonth = 12;
	}else if (iMonth>12){
		iYear++;
		iMonth = 1;
	}
  }
  fSetDate(iYear, iMonth, iDay);
}

function Point(iX, iY){
	this.x = iX;
	this.y = iY;
}

function fBuildCal(iYear, iMonth) {
  var aMonth=new Array();
  for(i=1;i<7;i++)
  	aMonth[i]=new Array(i);

  var dCalDate=new Date(iYear, iMonth-1, 1);
  var iDayOfFirst=dCalDate.getDay();
  var iDaysInMonth=new Date(iYear, iMonth, 0).getDate();
  var iOffsetLast=new Date(iYear, iMonth-1, 0).getDate()-iDayOfFirst+1;
  var iDate = 1;
  var iNext = 1;

  for (d = 0; d < 7; d++)
	aMonth[1][d] = (d<iDayOfFirst)?-(iOffsetLast+d):iDate++;
  for (w = 2; w < 7; w++)
  	for (d = 0; d < 7; d++)
		aMonth[w][d] = (iDate<=iDaysInMonth)?iDate++:-(iNext++);
  return aMonth;
}

function fDrawCal(iYear, iMonth, iCellHeight, sDateTextSize) {
  var WeekDay = new Array("日","一","二","三","四","五","六");
  var styleTD = " bgcolor='"+gcBG+"' bordercolor='"+gcBG+"' valign='middle' align='center' height='"+iCellHeight+"' style='font-size:12px; ";

  with (document) {
	write("<tr>");
	for(i=0; i<7; i++)
		write("<td "+styleTD+" color:#990099' >" + WeekDay[i] + "</td>");
	write("</tr>");

  	for (w = 1; w < 7; w++) {
		write("<tr>");
		for (d = 0; d < 7; d++) {
			write("<td id=calCell "+styleTD+"cursor:hand;' onMouseOver='this.bgColor=gcToggle' onMouseOut='this.bgColor=gcBG' onclick='fSetSelected(this)'>");
			write("<font id=cellText ><b> </b></font>");
			write("</td>")
		}
		write("</tr>");
	}
  }
}

function fUpdateCal(iYear, iMonth) {
  myMonth = fBuildCal(iYear, iMonth);
  var i = 0;
  for (w = 0; w < 6; w++)
	for (d = 0; d < 7; d++)
		with (cellText[(7*w)+d]) {
			Victor = i++;
			if (myMonth[w+1][d]<0) {
				color = gcGray;
				innerText = -myMonth[w+1][d];
			}else{
				// Modified by maxiang for we need
				// Saturday displayed in blue font color.
				//color = ((d==0)||(d==6))?"red":"black";
				if( d == 0 ){
					color = "red";
				}else if( d == 6 ){
					color = "blue";
				}else{
					color = "black";
				}
				// End of above maxiang
				innerText = myMonth[w+1][d];
			}
		}
}

function fSetYearMon(iYear, iMon){
  tbSelMonth.options[iMon-1].selected = true;
  for (i = 0; i < tbSelYear.length; i++)
	if (tbSelYear.options[i].value == iYear)
		tbSelYear.options[i].selected = true;
  fUpdateCal(iYear, iMon);
}

function fPrevMonth(){
  var iMon = tbSelMonth.value;
  var iYear = tbSelYear.value;

  if (--iMon<1) {
	  iMon = 12;
	  iYear--;
  }

  fSetYearMon(iYear, iMon);
}

function fNextMonth(){
  var iMon = tbSelMonth.value;
  var iYear = tbSelYear.value;

  if (++iMon>12) {
	  iMon = 1;
	  iYear++;
  }

  fSetYearMon(iYear, iMon);
}

function fToggleTags(){
  with (document.all.tags("SELECT")){
 	for (i=0; i<length; i++)
 		if ((item(i).Victor!="Won")&&fTagInBound(item(i))){
 			item(i).style.visibility = "hidden";
 			goSelectTag[goSelectTag.length] = item(i);
 		}
  }
}

function fTagInBound(aTag){
  with (VicPopCal.style){
  	var l = parseInt(left);
  	var t = parseInt(top);
  	var r = l+parseInt(width);
  	var b = t+parseInt(height);
	var ptLT = fGetXY(aTag);
	return !((ptLT.x>r)||(ptLT.x+aTag.offsetWidth<l)||(ptLT.y>b)||(ptLT.y+aTag.offsetHeight<t));
  }
}

function fGetXY(aTag){
  var oTmp = aTag;
  var pt = new Point(0,0);
  do {
  	pt.x += oTmp.offsetLeft;
  	pt.y += oTmp.offsetTop;
  	oTmp = oTmp.offsetParent;
  } while(oTmp.tagName!="BODY");
  return pt;
}

// Main: popCtrl is the widget beyond which you want this calendar to appear;
//       dateCtrl is the widget into which you want to put the selected date.
// i.e.: <input type="text" name="dc" style="text-align:center" readonly><INPUT type="button" value="V" onclick="fPopCalendar(dc,dc);return false">
function fPopCalendar(popCtrl, dateCtrl, mode, defDate){
	gCalMode = mode;
	gCalDefDate = defDate;

  if (popCtrl == previousObject){
	  	if (VicPopCal.style.visibility == "visible"){
  		//HiddenDiv();
  		return true;
  	}

  }
  previousObject = popCtrl;
  gdCtrl = dateCtrl;
  fSetYearMon(giYear, giMonth);
  var point = fGetXY(popCtrl);

	if( gCalMode == CAL_MODE_NOBLANK ){
		document.all.CAL_B_BLANK.style.visibility = "hidden";
	}else{
		document.all.CAL_B_BLANK.style.visibility = "visible";
	}

  with (VicPopCal.style) {
  	left = point.x;
	top  = point.y+popCtrl.offsetHeight;
	width = VicPopCal.offsetWidth;
	height = VicPopCal.offsetHeight;
	fToggleTags(point);
	visibility = 'visible';
  }
}

var gMonths = new Array("1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月");

with (document) {
write("<Div id='VicPopCal' style='OVERFLOW:hidden;POSITION:absolute;VISIBILITY:hidden;border:0px ridge;width:100%;height:100%;top:0;left:0;z-index:100;overflow:hidden'>");
write("<table border='0' bgcolor='#3366CC'>");
write("<TR>");
write("<td valign='middle' align='center'><input type='button' name='PrevMonth' value='<' style='height:20;width:20;FONT:bold' onClick='fPrevMonth()'>");
write("&nbsp;<SELECT name='tbSelYear' onChange='fUpdateCal(tbSelYear.value, tbSelMonth.value)' Victor='Won'>");
for(i=1950;i<2021;i++)
	write("<OPTION value='"+i+"'>"+i+"年</OPTION>");
write("</SELECT>");
write("&nbsp;<select name='tbSelMonth' onChange='fUpdateCal(tbSelYear.value, tbSelMonth.value)' Victor='Won'>");
for (i=0; i<12; i++)
	write("<option value='"+(i+1)+"'>"+gMonths[i]+"</option>");
write("</SELECT>");
write("&nbsp;<input type='button' name='PrevMonth' value='>' style='height:20;width:20;FONT:bold' onclick='fNextMonth()'>");
write("</td>");
write("</TR><TR>");
write("<td align='center'>");
write("<DIV style='background-color:#000066'><table width='100%' border='0'>");
fDrawCal(giYear, giMonth, 8, '12');
write("</table></DIV>");
write("</td>");
write("</TR><TR><TD align='center'>");
write("<TABLE width='100%'><TR><TD align='center'>");
write("<B ID=\"CAL_B_BLANK\" style='color:"+gcBG+"; visibility:visible; cursor:hand; font-size:12px' onclick='fSetDate(0,0,0)' onMouseOver='this.style.color=gcToggle' onMouseOut='this.style.color=gcBG'>清空</B>");
write("</td><td algin='center'>");
write("<B style='color:"+gcBG+";cursor:hand; font-size:12px' onclick='fSetDate(giYear,giMonth,giDay)' onMouseOver='this.style.color=gcToggle' onMouseOut='this.style.color=gcBG'>选择: "+giYear+"/"+giMonth+"/"+giDay+"</B>");
write("</td></tr></table>");
write("</TD></TR>");
write("</TABLE></Div>");
}
