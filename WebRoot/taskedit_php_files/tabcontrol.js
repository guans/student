function TabControl(name,active)
{
	this.name = name;
	this.tabName = new Array();
	this.tabDiv = new Array();
	this.contentDiv = new Array();
	this.activeTab = active;
	return this;
}

function AddTabItem(tbCtrl,name,tabDiv,contentDiv)
{
	tbCtrl.tabName[tbCtrl.tabName.length] = name;
	tbCtrl.tabDiv[tbCtrl.tabDiv.length] = tabDiv;
	tbCtrl.contentDiv[tbCtrl.contentDiv.length] = contentDiv;
}

function SetActiveTab(tbCtrl,name)
{
	var i;
	for (i=0;i<tbCtrl.tabName.length;i++){
		if (tbCtrl.tabName[i]==name)
			break;
	}
	if (i>=tbCtrl.tabName.length)
		return false;
	document.all[tbCtrl.tabDiv[tbCtrl.activeTab]].className = "normalTab";
	document.all[tbCtrl.contentDiv[tbCtrl.activeTab]].style.display = "none";
	document.all[tbCtrl.tabDiv[i]].className = "activeTab";
	document.all[tbCtrl.contentDiv[i]].style.display = "block";
	tbCtrl.activeTab = i;
	
	return false;
}

function SetActiveVTab(tbCtrl,name)
{
	var i;
	for (i=0;i<tbCtrl.tabName.length;i++){
		if (tbCtrl.tabName[i]==name)
			break;
	}
	if (i>=tbCtrl.tabName.length)
		return false;
	document.all[tbCtrl.tabDiv[tbCtrl.activeTab]].className = "normalVTab";
	document.all[tbCtrl.contentDiv[tbCtrl.activeTab]].style.display = "none";
	document.all[tbCtrl.tabDiv[i]].className = "activeVTab";
	document.all[tbCtrl.contentDiv[i]].style.display = "block";
	tbCtrl.activeTab = i;
	
	return false;
}

