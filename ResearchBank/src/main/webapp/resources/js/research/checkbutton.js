CheckButtonModel = function(checked, label) {
	this.listeners = new Array();
	this.checked = checked;
	this.label = label;
}
CheckButtonModel.prototype = {
	addListener: function(listener) {
		this.listeners[this.listeners.length] = listener;
	},
	removeListener: function(listener) {
		if (this.listeners.length == 0) return;
		
		var newListeners = new Array();
		for (var i = 0 ; i < this.listeners.length ; i++) {
			if (this.listeners[i] != listener) {
				newListeners[newListeners.length] =
					this.listeners[i];
			}
		}
		this.listeners = newListeners;
	},
	notify: function() {
		for (var i = 0 ; i < this.listeners.length ; i++) {
			this.listeners[i].changed(this);
		}
	},
	setChecked: function(checked) {
		this.checked = checked;
		this.notify();
	},
	toggle: function() {
		if (this.checked) {
			this.checked = false;
		} else {
			this.checked = true;
		}
		this.notify();
	},
	isChecked: function() {
		return this.checked;
	},
	getLabel: function() {
		return this.label;
	}
}

CheckButton = function(model, ui) {
	this.model = model;
	this.ui = ui;
	
	this.model.addListener(this);
	this.ui.setCheckButton(this);
	
	this.ui.render();
}
CheckButton.prototype = {
	setChecked: function(checked) {
		this.model.setChecked(checked);
	},
	toggle: function() {
		this.model.toggle();
	},
	isChecked: function() {
		return this.model.isChecked();
	},
	getLabel: function() {
		return this.model.getLabel();
	},
	changed: function() {
		this.ui.update();
	}
}

CheckButtonUI = function(elementId) {
	this.element = document.getElementById(elementId);
	this.checkButton = null;
}
CheckButtonUI.prototype = {
	setCheckButton: function(checkButton) {
		this.checkButton = checkButton;
	},
	render: function() {
		var html = "<img src='";
		if (this.checkButton.isChecked()) {
			html += "images/check_on.gif'>";
		} else {
			html += "images/check_off.gif'>";
		}
		html += "&nbsp;"+this.checkButton.getLabel();
		
		this.element.style.cursor = 'hand';
		
		this.element.innerHTML = html;
		
		ajax.Event.addListener(this.element,
			"click",
			ajax.Event.bindAsListener(this.doClick, this));
	},
	doClick: function(e) {
		this.checkButton.toggle();
	},
	update: function() {
		var img = this.element.getElementsByTagName("img").item(0);
		if (this.checkButton.isChecked()) {
			img.src = "images/check_on.gif";
		} else {
			img.src = "images/check_off.gif";
		}
	}
}

CheckButtonUI2 = function(elementId) {
	this.element = document.getElementById(elementId);
	this.checkButton = null;
}
CheckButtonUI2.prototype = {
	setCheckButton: function(checkButton) {
		this.checkButton = checkButton;
	},
	render: function() {
		var html = "<img src='";
		if (this.checkButton.isChecked()) {
			html += "images/check2_on.gif'>";
		} else {
			html += "images/check2_off.gif'>";
		}
		html += "&nbsp;"+this.checkButton.getLabel();
		
		this.element.style.cursor = 'hand';
		this.element.style.fontSize = "10px";
		this.element.innerHTML = html;
		
		ajax.Event.addListener(this.element,
			"click",
			ajax.Event.bindAsListener(this.doClick, this));
	},
	doClick: function(e) {
		this.checkButton.toggle();
	},
	update: function() {
		var img = this.element.getElementsByTagName("img").item(0);
		if (this.checkButton.isChecked()) {
			img.src = "images/check2_on.gif";
		} else {
			img.src = "images/check2_off.gif";
		}
	}
}