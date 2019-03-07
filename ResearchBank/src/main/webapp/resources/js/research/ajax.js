var ajax = {};
ajax.xhr = {};

ajax.xhr.Request = function(url, params, callback, method) {
	this.url = url;
	this.params = params;
	this.callback = callback;
	this.method = method;
	this.send();
}
ajax.xhr.Request.prototype = {
	getXMLHttpRequest: function() {
		if (window.ActiveXObject) {
			try {
				return new ActiveXObject("Msxml2.XMLHTTP");
			} catch(e) {
				try {
					return new ActiveXObject("Microsoft.XMLHTTP");
				} catch(e1) { return null; }
			}
		} else if (window.XMLHttpRequest) {
			return new XMLHttpRequest();
		} else {
			return null;
		}		
	},
	send: function() {
		this.req = this.getXMLHttpRequest();
		
		var httpMethod = this.method ? this.method : 'GET';
		if (httpMethod != 'GET' && httpMethod != 'POST') {
			httpMethod = 'GET';
		}
		var httpParams = (this.params == null || this.params == '') ? 
		                 null : this.params;
		var httpUrl = this.url;
		if (httpMethod == 'GET' && httpParams != null) {
			httpUrl = httpUrl + "?" + httpParams;
		}
		this.req.open(httpMethod, httpUrl, true);
		this.req.setRequestHeader(
			'Content-Type', 'application/x-www-form-urlencoded');
		var request = this;
		this.req.onreadystatechange = function() {
			request.onStateChange.call(request);
		}
		this.req.send(httpMethod == 'POST' ? httpParams : null);
	},
	onStateChange: function() {
		this.callback(this.req);
	}
}

ajax.Event = {};
ajax.Event.addListener = function(element, name, observer, useCapture) {
    useCapture = useCapture || false;

	if (element.addEventListener) {
		element.addEventListener(name, observer, useCapture);
	} else if (element.attachEvent) {
		element.attachEvent('on' + name, observer);
	}
}
ajax.Event.removeListener = function(element, name, observer, useCapture) {
	useCapture = useCapture || false;
	
	if (element.removeEventListener) {
		element.removeEventListener(name, observer, useCapture);
	} else if (element.detachEvent) {
		element.detachEvent('on' + name, observer);
	}
}
ajax.Event.getTarget = function(event) {
	if (event == null) return null;
	if (event.target) return event.target;
	else if (event.srcElement) return event.srcElement;
	return null;
}
ajax.Event.getMouseXY = function(event) {
	var mouseX = event.clientX;
	var mouseY = event.clientY;
	
	var dd = document.documentElement;
	var db = document.body;
	if (dd) {
		mouseX += dd.scrollLeft;
		mouseY += dd.scrollTop;
	} else if (db) {
		mouseX += db.scrollLeft;
		mouseY += db.scrollTop;
	}
	return {x: mouseX, y: mouseY};
}
ajax.Event.isLeftButton= function(event) {
	return (event.which) ? 
	       event.which == 1 && event.button == 0 :
	       (event.type == 'click') ? event.button == 0 : event.button == 1;
}
ajax.Event.isRightButton = function(event) {
	return event.button == 2;
}
ajax.Event.stopPropagation = function(event) {
	if (event.stopPropagation) {
	    event.stopPropagation();
	} else {
	    event.cancelBubble = true;
	}
}
ajax.Event.preventDefault = function(event) {
	if (event.preventDefault) {
	    event.preventDefault();
	} else {
	    event.returnValue = false;
	}
}
ajax.Event.stopEvent = function(event) {
	ajax.Event.stopPropagation(event);
	ajax.Event.preventDefault(event);
}
ajax.Event.bindAsListener = function(func, obj) {
	return function() {
		return func.apply(obj, arguments);
	}
}

ajax.GUI = {};
ajax.GUI.setOpacity = function(el, opacity) {
	if (el.filters) {
		el.style.filter = 'alpha(opacity=' + opacity * 100 + ')';
	} else {
		el.style.opacity = opacity;
	}
}
ajax.GUI.getStyle = function(el, property) {
	var value = null;
	var dv = document.defaultView;
	
	if (property == 'opacity' && el.filters) {// IE opacity
		value = 1;
		try {
			value = el.filters.item('alpha').opacity / 100;
		} catch(e) {}
	} else if (el.style[property]) {
		value = el.style[property];
	} else if (el.currentStyle && el.currentStyle[property]) {
		value = el.currentStyle[property];
	} else if ( dv && dv.getComputedStyle ) {
		// 대문자를 소문자로 변환하고 그 앞에 '-'를 붙인다.
		var converted = '';
		for(i = 0, len = property.length;i < len; ++i) {
			if (property.charAt(i) == property.charAt(i).toUpperCase()) {
				converted = converted + '-' + 
				            property.charAt(i).toLowerCase();
			} else {
				converted = converted + property.charAt(i);
			}
		}
		if (dv.getComputedStyle(el, '').getPropertyValue(converted)) {
			value = dv.getComputedStyle(el, '').getPropertyValue(converted);
		}
	}
	return value;
}

ajax.GUI.getXY = function(el) {
	// el은 문서에 포함되어 있어야 하고, 화면에 보여야 한다.
	if (el.parentNode === null || el.style.display == 'none') {
		return false;
	}
	
	var parent = null;
	var pos = [];
	var box;
	
	if (document.getBoxObjectFor) { // gecko 엔진 기반
		box = document.getBoxObjectFor(el);
		pos = [box.x, box.y];
	} else { // 기타 브라우저
		pos = [el.offsetLeft, el.offsetTop];
		parent = el.offsetParent;
		if (parent != el) {
			while (parent) {
				pos[0] += parent.offsetLeft;
				pos[1] += parent.offsetTop;
				parent = parent.offsetParent;
			}
		}
		// 오페라와 사파리의 'absolute' postion의 경우
		// body의 offsetTop을 잘못 계산하므로 보정해야 한다.
		var ua = navigator.userAgent.toLowerCase();
		if (
			ua.indexOf('opera') != -1
			|| ( ua.indexOf('safari') != -1 && this.getStyle(el, 'position') == 'absolute' )
		) {
			pos[1] -= document.body.offsetTop;
		}
	}
	
	if (el.parentNode) { parent = el.parentNode; }
	else { parent = null; }
	
	// body 또는 html 이외의 부모 노드 중에 스크롤되어 있는
	// 영역이 있다면 알맞게 처리한다.
	while (parent && parent.tagName != 'BODY' && parent.tagName != 'HTML') {
		pos[0] -= parent.scrollLeft;
		pos[1] -= parent.scrollTop;
		
		if (parent.parentNode) { parent = parent.parentNode; }
		else { parent = null; }
	}
	return {x: pos[0], y: pos[1]};
}
ajax.GUI.getX = function(el) {
	return ajax.GUI.getXY(el).x;
}
ajax.GUI.getY = function(el) {
	return ajax.GUI.getXY(el).y;
}
ajax.GUI.getBounds = function(el) {
	var xy = ajax.GUI.getXY(el);
	return {
		x: xy.x,
		y: xy.y,
		width: el.offsetWidth,
		height: el.offsetHeight
	};
}
ajax.GUI.setXY = function(el, x, y) {
	var pageXY = ajax.GUI.getXY(el);
	if (pageXY === false) { return false; }
	var position = ajax.GUI.getStyle(el, 'position');
	if (!position || position == 'static') {
		el.style.position = 'relative';
	}
	var delta = {
		x: parseInt( ajax.GUI.getStyle(el, 'left'), 10 ),
		y: parseInt( ajax.GUI.getStyle(el, 'top'), 10 )
	};
	if ( isNaN(delta.x) ) { delta.x = 0; }
	if ( isNaN(delta.y) ) { delta.y = 0; }
	
	if (x != null) {
		el.style.left = (x - pageXY.x + delta.x) + 'px';
	}
	if (y != null) {
		el.style.top = (y - pageXY.y + delta.y) + 'px';
	}
	
	return true;
}