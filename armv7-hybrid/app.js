enyo.kind({
	name: "XApp",
	kind: "VFlexBox",
	components: [
		{kind: enyo.Hybrid, name: "plugin", executable: "hybridkeyboard_plugin", width: 1024, height: 690,
		style: "padding: 0px", takeKeyboardFocus: false},
		{kind: "Button", caption: "Open Keyboard", onclick: "focusPlugin"}
	],
	create: function() {
		this.inherited(arguments);
	},

	focusPlugin: function() {
		this.$.plugin.focus();
	}
});
