ajax.uicombo = {}

ajax.uicombo.CB_ADD = 1;
ajax.uicombo.CB_REMOVE = 2;
ajax.uicombo.CB_SELECT = 4;
ajax.uicombo.CB_DESELECT = 8;

ajax.uicombo.ComboBoxModelItem = function(text, value) {
	this.textValue = text;
	this.value = value;
}
ajax.uicombo.ComboBoxModelItem.prototype = {
	getText: function() {
		return this.textValue;
	},
	getValue: function() {
		return this.value;
	}
}

ajax.uicombo.ComboBoxModel = function() {
	this.listeners = new Array();
	this.items = new Array();
	this.selectedIndex = -1;
}
ajax.uicombo.ComboBoxModel.prototype = {
	getSelectedIndex: function() {
		return this.selectedIndex;
	},
	select: function(idx) {
		if (idx > this.items.length - 1) return;
		
		this.selectedIndex = idx;
		this.notify(ajax.uicombo.CB_SELECT, idx, null, null);
	},
	deselect: function() {
		this.selectedIndex = -1;
		this.notify(ajax.uicombo.CB_DESELECT, -1, null, null);
	},
	getSelectedItem: function() {
		if (this.selectedIndex == -1) return null;
		return this.items[this.selectedIndex];
	},
	getText: function() {
		var item = this.getSelectedItem();
		if (item == null) return null;
		return item.getText();
	},
	getValue: function() {
		var item = this.getSelectedItem();
		if (item == null) return null;
		return item.getValue();
	},
	getItem: function(idx) {
		return this.items[idx];
	},
	addItem: function(item) {
		this.items[this.items.length] = item;
		this.notify(ajax.uicombo.CB_ADD,
		           this.selectedIndex,
		           [this.items.length-1], [item]);
	},
	removeItem: function(idx) {
		if (idx > this.items.length - 1 || idx < 0) return;
		
		var tempItems = new Array();
		var removedItem = null;
		for (var i = 0 ; i < this.items.length ; i++) {
			if (i != idx) {
				tempItems[tempItems.length] = this.items[i];
			} else {
				removedItem = this.items[i];
			}
		}
		this.items = tempItems;
		
		var oldSelectedIndex = this.selectedIndex;
		if (this.selectedIndex == idx) this.selectedIndex = -1;
		else if (this.selectedIndex > idx) this.selectedIndex--;
		
		var eventType = ajax.uicombo.CB_REMOVE;
		if (oldSelectedIndex != this.selectedIndex) {
			eventType += ajax.uicombo.CB_SELECT;
		}
		this.notify(eventType,
		            this.selectedIndex,
		            [idx], [removedItem]);
	},
	size: function() {
		return this.items.length;
	},
	addListener: function(listener) {
		this.listeners[this.listeners.length] = listener;
	},
	removeListener: function(listener) {
		var tempListeners = new Array();
		for (var i = 0 ; i < this.listeners.length ; i++) {
			if (this.listeners[i] != listener) {
				tempListeners.add(this.listeners[i]);
			}
		}
		this.listeners = tempListeners;
	},
	notify: function(type, newSelIdx, idxList, itemList) {
		for (var i = 0 ; i < this.listeners.length ; i++) {
			this.listeners[i].changed(
				type, newSelIdx, idxList, itemList);
		}
	}
}

ajax.uicombo.ComboBox = function(elementId, jsonValues, selectedIdx) {
	this.ui = new ajax.uicombo.ComboBoxUI(elementId);
	this.ui.setComboBox(this);
	
	this.model = new ajax.uicombo.ComboBoxModel();
	if (jsonValues) {
		for (var i = 0 ; i < jsonValues.length ; i++) {
			var item = new ajax.uicombo.ComboBoxModelItem(
				jsonValues[i].text,
				jsonValues[i].value
			);
			this.model.addItem(item);
		}
	}
	if (selectedIdx != null) this.model.select(selectedIdx);	
	this.model.addListener(this);
	
	this.ui.render();
}

ajax.uicombo.ComboBox.prototype = {
	getSelectedIndex: function() {
		return this.model.getSelectedIndex();
	},
	select: function(idx) {
		this.model.select(idx);
	},
	deselect: function() {
		this.model.deselect();
	},
	getSelectedItem: function() {
		return this.model.getSelectedItem();
	},
	getText: function() {
		return this.model.getText();
	},
	getValue: function() {
		return this.model.getValue();
	},
	getItem: function(idx) {
		return this.model.getItem(idx);
	},
	addItem: function(text, value) {
		var item = new ajax.uicombo.ComboBoxModelItem(
			text, value);
		this.model.addItem(item);
	},
	removeItem: function(idx) {
		this.model.removeItem(idx);
	},
	size: function() {
		return this.model.size();
	},
	clickOnItem: function(idx) {
		return this.model.select(idx);
	},
	changed: function(type, newSelIdx, idxList, itemList) {
		if (type & ajax.uicombo.CB_ADD) {
			this.ui.changedAdded(idxList);
		} else if (type & ajax.uicombo.CB_REMOVE) {
			this.ui.changedRemoved(idxList);
		}
		if ((type & ajax.uicombo.CB_SELECT) != 0 ||
		    (type & ajax.uicombo.CB_DESELECT) != 0) {
			this.ui.chagedSelection(newSelIdx);
		}
	}
}

ajax.uicombo.ComboBoxUI = function(elementId) {
	this.element = document.getElementById(elementId);
	this.titleDIV = null;
	this.listDIV = null;

	this.comboBox = null;
}
ajax.uicombo.ComboBoxUI.prototype = {
	setComboBox: function(comboBox) {
		this.comboBox = comboBox;
	},
	render: function() {
		this.element.style.border = "1px solid #333";
		
		this.titleDIV = this.makeTitle();
		this.element.appendChild(this.titleDIV);
		
		this.listDIV = this.makeList();
		this.element.appendChild(this.listDIV);
		
		ajax.Event.addListener(this.titleDIV, "mouseover",
			ajax.Event.bindAsListener(this.mouseoverOnElement, this));
		ajax.Event.addListener(this.titleDIV, "mouseout",
			ajax.Event.bindAsListener(this.mouseoutOnElement, this));

		ajax.Event.addListener(this.listDIV, "mouseover",
			ajax.Event.bindAsListener(this.mouseoverOnList, this));
		ajax.Event.addListener(this.listDIV, "mouseout",
			ajax.Event.bindAsListener(this.mouseoutOnList, this));
	},
	makeTitle: function() {
		var bounds = ajax.GUI.getBounds(this.element);
		
		var titleDIV = document.createElement("div");
		var html = "<table width='100%' border='0' cellpadding='0' cellspacing='0'>";
		html += "<tr><td><span>"
		if (this.comboBox.getSelectedIndex() == -1) {
			html += "선택하세요";
		} else {
			html += this.comboBox.getText();
		}
		html += "</span></td><td align='right'>";
		html += "<img src='images/cb_arrow.gif' border='0'/>";
		html += "</td></tr></table>";
		titleDIV.style.padding = "2px";
		titleDIV.style.cursor = "hand";
		titleDIV.innerHTML = html;
		return titleDIV;
	},
	makeList: function() {
		var listDIV = document.createElement("div");
		var bounds = ajax.GUI.getBounds(this.element);
		
		listDIV.style.cursor = "hand";
		listDIV.style.overflow = "auto";
		listDIV.style.position = "absolute";
		listDIV.style.left = bounds.x + "px";
		listDIV.style.top = (bounds.y + bounds.height - 4) + "px";
		listDIV.style.width = bounds.width + "px";
		listDIV.style.height = "90px";
		listDIV.style.visibility = "hidden";
		listDIV.style.backgroundColor = "#fff";
		listDIV.style.border = "1px solid #000";
		listDIV.style.zIndex = 10;

		for (var i = 0 ; i < this.comboBox.size() ; i++) {
			var item = this.comboBox.getItem(i);
			var itemDIV = this.makeItemDIV(item);
			listDIV.appendChild(itemDIV);
		}
		return listDIV;
	},
	makeItemDIV: function(item) {
		var itemDIV = document.createElement("div");
		itemDIV.innerHTML = item.getText();
		
		ajax.Event.addListener(itemDIV, "mouseover",
			ajax.Event.bindAsListener(this.mouseoverOnItem, this));
		ajax.Event.addListener(itemDIV, "mouseout",
			ajax.Event.bindAsListener(this.mouseoutOnItem, this));
		ajax.Event.addListener(itemDIV, "click",
			ajax.Event.bindAsListener(this.clickOnItem, this));
		
		return itemDIV;
	},
	mouseoverOnElement: function(e) {
		this.listDIV.style.visibility = "visible";
	},
	mouseoutOnElement: function(e) {
		this.listDIV.style.visibility = "hidden";
	},
	mouseoverOnList: function(e) {
		this.listDIV.style.visibility = "visible";
	},
	mouseoutOnList: function(e) {
		this.listDIV.style.visibility = "hidden";
	},
	mouseoverOnItem: function(e) {
		var event = window.event || e;
		var target = ajax.Event.getTarget(event);
		target.style.backgroundColor = "#eee";
	},
	mouseoutOnItem: function(e) {
		var event = window.event || e;
		var target = ajax.Event.getTarget(event);
		target.style.backgroundColor = "#fff";
	},
	clickOnItem: function(e) {
		var event = window.event || e;
		var target = ajax.Event.getTarget(event);
		var childs = target.parentNode.childNodes;
		var idx = -1;
		for (var i = 0 ; i < childs.length ; i++) {
			if (childs.item(i) == target) {
				idx = i;
				break;
			}
		}
		if (idx >= 0) {
			this.comboBox.clickOnItem(idx);
			this.listDIV.style.visibility = "hidden";
		}
	},
	chagedSelection: function(newIdx) {
		var span = this.titleDIV.getElementsByTagName("span").item(0);
		if (this.comboBox.getSelectedIndex() == -1) {
			span.innerHTML = "선택하세요";
		} else {
			span.innerHTML = this.comboBox.getText();
		}
	},
	changedAdded: function(idxs) {
		for (var i = 0 ; i < idxs.length ; i++) {
			var item = this.comboBox.getItem(idxs[i]);
			var itemDIV = this.makeItemDIV(item);
			this.listDIV.appendChild(itemDIV);
		}
	},
	changedRemoved: function(idxs) {
		var childs = this.listDIV.childNodes;
		for (var i = idxs.length - 1 ; i >= 0  ; i--) {
			var child = childs.item(idxs[i]);
			child.parentNode.removeChild(child);
		}
	}
}