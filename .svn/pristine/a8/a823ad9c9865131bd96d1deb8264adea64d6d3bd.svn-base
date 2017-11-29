function tab$(id) { return document.getElementById(id);}
document.createTabCtrl = function(tabs, panels, tabclass, tabselclass,mousestate,ontabindexchange) {
    var o = new Object();
    o.tabs = tabs;
    o.panels = panels||null;
    o.tabclass = tabclass;
    o.tabselclass = tabselclass;
    o.ontabindexchange = ontabindexchange;
    o.tabindex = 0;

    for (var i = 0; i < tabs.length; i++) {
        tabs[i]._index = i;
        tabs[i]._tabctrl = o;
		if(mousestate=="onclick"){
        tabs[i].onclick = function() {
            this._tabctrl.show(this._index);
            return false;
        };}
		if(mousestate=="onmouseover"){
        tabs[i].onmouseover = function() {
            this._tabctrl.show(this._index);
            return false;
        };}
        panels[i]._inited = false;
        if (panels[i].style.display != 'none') {
            o.tabindex = i;
            tabs[i].className = tabselclass;
        }
        else {
            tabs[i].className = tabclass;
        }
    }

    o.show = function(index, url) {
        if (index == null) index = this.tabindex;
        var oindex = this.tabindex;
        this.tabindex = index;
        for (var i = 0; i < this.tabs.length; i++) {
            if (i == index) {
                this.tabs[i].className = this.tabselclass;
                this.panels[i].style.display = '';
                if (this.panels[i].tagName.toLowerCase() == 'iframe') {
                    if (url) {
                        this.panels[i].src = 'loading.htm?' + escape(url);
                        this.panels[i]._inited = true;
                    }
                    else if (!this.panels[i]._inited) {
                        this.panels[i].src = 'loading.htm?' + escape(this.tabs[i].href);
                        this.panels[i]._inited = true;
                    }
                }
            }
            else {
                this.tabs[i].className = this.tabclass;
                this.panels[i].style.display = 'none';
            }
        }
        if (this.ontabindexchange) this.ontabindexchange({ fromindex: oindex, toindex: index });
    };

    return o;
};