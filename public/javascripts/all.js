/*!
 * jQuery JavaScript Library v1.3.2
 * http://jquery.com/
 *
 * Copyright (c) 2009 John Resig
 * Dual licensed under the MIT and GPL licenses.
 * http://docs.jquery.com/License
 *
 * Date: 2009-02-19 17:34:21 -0500 (Thu, 19 Feb 2009)
 * Revision: 6246
 */
(function(){

var 
	// Will speed up references to window, and allows munging its name.
	window = this,
	// Will speed up references to undefined, and allows munging its name.
	undefined,
	// Map over jQuery in case of overwrite
	_jQuery = window.jQuery,
	// Map over the $ in case of overwrite
	_$ = window.$,

	jQuery = window.jQuery = window.$ = function( selector, context ) {
		// The jQuery object is actually just the init constructor 'enhanced'
		return new jQuery.fn.init( selector, context );
	},

	// A simple way to check for HTML strings or ID strings
	// (both of which we optimize for)
	quickExpr = /^[^<]*(<(.|\s)+>)[^>]*$|^#([\w-]+)$/,
	// Is it a simple selector
	isSimple = /^.[^:#\[\.,]*$/;

jQuery.fn = jQuery.prototype = {
	init: function( selector, context ) {
		// Make sure that a selection was provided
		selector = selector || document;

		// Handle $(DOMElement)
		if ( selector.nodeType ) {
			this[0] = selector;
			this.length = 1;
			this.context = selector;
			return this;
		}
		// Handle HTML strings
		if ( typeof selector === "string" ) {
			// Are we dealing with HTML string or an ID?
			var match = quickExpr.exec( selector );

			// Verify a match, and that no context was specified for #id
			if ( match && (match[1] || !context) ) {

				// HANDLE: $(html) -> $(array)
				if ( match[1] )
					selector = jQuery.clean( [ match[1] ], context );

				// HANDLE: $("#id")
				else {
					var elem = document.getElementById( match[3] );

					// Handle the case where IE and Opera return items
					// by name instead of ID
					if ( elem && elem.id != match[3] )
						return jQuery().find( selector );

					// Otherwise, we inject the element directly into the jQuery object
					var ret = jQuery( elem || [] );
					ret.context = document;
					ret.selector = selector;
					return ret;
				}

			// HANDLE: $(expr, [context])
			// (which is just equivalent to: $(content).find(expr)
			} else
				return jQuery( context ).find( selector );

		// HANDLE: $(function)
		// Shortcut for document ready
		} else if ( jQuery.isFunction( selector ) )
			return jQuery( document ).ready( selector );

		// Make sure that old selector state is passed along
		if ( selector.selector && selector.context ) {
			this.selector = selector.selector;
			this.context = selector.context;
		}

		return this.setArray(jQuery.isArray( selector ) ?
			selector :
			jQuery.makeArray(selector));
	},

	// Start with an empty selector
	selector: "",

	// The current version of jQuery being used
	jquery: "1.3.2",

	// The number of elements contained in the matched element set
	size: function() {
		return this.length;
	},

	// Get the Nth element in the matched element set OR
	// Get the whole matched element set as a clean array
	get: function( num ) {
		return num === undefined ?

			// Return a 'clean' array
			Array.prototype.slice.call( this ) :

			// Return just the object
			this[ num ];
	},

	// Take an array of elements and push it onto the stack
	// (returning the new matched element set)
	pushStack: function( elems, name, selector ) {
		// Build a new jQuery matched element set
		var ret = jQuery( elems );

		// Add the old object onto the stack (as a reference)
		ret.prevObject = this;

		ret.context = this.context;

		if ( name === "find" )
			ret.selector = this.selector + (this.selector ? " " : "") + selector;
		else if ( name )
			ret.selector = this.selector + "." + name + "(" + selector + ")";

		// Return the newly-formed element set
		return ret;
	},

	// Force the current matched set of elements to become
	// the specified array of elements (destroying the stack in the process)
	// You should use pushStack() in order to do this, but maintain the stack
	setArray: function( elems ) {
		// Resetting the length to 0, then using the native Array push
		// is a super-fast way to populate an object with array-like properties
		this.length = 0;
		Array.prototype.push.apply( this, elems );

		return this;
	},

	// Execute a callback for every element in the matched set.
	// (You can seed the arguments with an array of args, but this is
	// only used internally.)
	each: function( callback, args ) {
		return jQuery.each( this, callback, args );
	},

	// Determine the position of an element within
	// the matched set of elements
	index: function( elem ) {
		// Locate the position of the desired element
		return jQuery.inArray(
			// If it receives a jQuery object, the first element is used
			elem && elem.jquery ? elem[0] : elem
		, this );
	},

	attr: function( name, value, type ) {
		var options = name;

		// Look for the case where we're accessing a style value
		if ( typeof name === "string" )
			if ( value === undefined )
				return this[0] && jQuery[ type || "attr" ]( this[0], name );

			else {
				options = {};
				options[ name ] = value;
			}

		// Check to see if we're setting style values
		return this.each(function(i){
			// Set all the styles
			for ( name in options )
				jQuery.attr(
					type ?
						this.style :
						this,
					name, jQuery.prop( this, options[ name ], type, i, name )
				);
		});
	},

	css: function( key, value ) {
		// ignore negative width and height values
		if ( (key == 'width' || key == 'height') && parseFloat(value) < 0 )
			value = undefined;
		return this.attr( key, value, "curCSS" );
	},

	text: function( text ) {
		if ( typeof text !== "object" && text != null )
			return this.empty().append( (this[0] && this[0].ownerDocument || document).createTextNode( text ) );

		var ret = "";

		jQuery.each( text || this, function(){
			jQuery.each( this.childNodes, function(){
				if ( this.nodeType != 8 )
					ret += this.nodeType != 1 ?
						this.nodeValue :
						jQuery.fn.text( [ this ] );
			});
		});

		return ret;
	},

	wrapAll: function( html ) {
		if ( this[0] ) {
			// The elements to wrap the target around
			var wrap = jQuery( html, this[0].ownerDocument ).clone();

			if ( this[0].parentNode )
				wrap.insertBefore( this[0] );

			wrap.map(function(){
				var elem = this;

				while ( elem.firstChild )
					elem = elem.firstChild;

				return elem;
			}).append(this);
		}

		return this;
	},

	wrapInner: function( html ) {
		return this.each(function(){
			jQuery( this ).contents().wrapAll( html );
		});
	},

	wrap: function( html ) {
		return this.each(function(){
			jQuery( this ).wrapAll( html );
		});
	},

	append: function() {
		return this.domManip(arguments, true, function(elem){
			if (this.nodeType == 1)
				this.appendChild( elem );
		});
	},

	prepend: function() {
		return this.domManip(arguments, true, function(elem){
			if (this.nodeType == 1)
				this.insertBefore( elem, this.firstChild );
		});
	},

	before: function() {
		return this.domManip(arguments, false, function(elem){
			this.parentNode.insertBefore( elem, this );
		});
	},

	after: function() {
		return this.domManip(arguments, false, function(elem){
			this.parentNode.insertBefore( elem, this.nextSibling );
		});
	},

	end: function() {
		return this.prevObject || jQuery( [] );
	},

	// For internal use only.
	// Behaves like an Array's method, not like a jQuery method.
	push: [].push,
	sort: [].sort,
	splice: [].splice,

	find: function( selector ) {
		if ( this.length === 1 ) {
			var ret = this.pushStack( [], "find", selector );
			ret.length = 0;
			jQuery.find( selector, this[0], ret );
			return ret;
		} else {
			return this.pushStack( jQuery.unique(jQuery.map(this, function(elem){
				return jQuery.find( selector, elem );
			})), "find", selector );
		}
	},

	clone: function( events ) {
		// Do the clone
		var ret = this.map(function(){
			if ( !jQuery.support.noCloneEvent && !jQuery.isXMLDoc(this) ) {
				// IE copies events bound via attachEvent when
				// using cloneNode. Calling detachEvent on the
				// clone will also remove the events from the orignal
				// In order to get around this, we use innerHTML.
				// Unfortunately, this means some modifications to
				// attributes in IE that are actually only stored
				// as properties will not be copied (such as the
				// the name attribute on an input).
				var html = this.outerHTML;
				if ( !html ) {
					var div = this.ownerDocument.createElement("div");
					div.appendChild( this.cloneNode(true) );
					html = div.innerHTML;
				}

				return jQuery.clean([html.replace(/ jQuery\d+="(?:\d+|null)"/g, "").replace(/^\s*/, "")])[0];
			} else
				return this.cloneNode(true);
		});

		// Copy the events from the original to the clone
		if ( events === true ) {
			var orig = this.find("*").andSelf(), i = 0;

			ret.find("*").andSelf().each(function(){
				if ( this.nodeName !== orig[i].nodeName )
					return;

				var events = jQuery.data( orig[i], "events" );

				for ( var type in events ) {
					for ( var handler in events[ type ] ) {
						jQuery.event.add( this, type, events[ type ][ handler ], events[ type ][ handler ].data );
					}
				}

				i++;
			});
		}

		// Return the cloned set
		return ret;
	},

	filter: function( selector ) {
		return this.pushStack(
			jQuery.isFunction( selector ) &&
			jQuery.grep(this, function(elem, i){
				return selector.call( elem, i );
			}) ||

			jQuery.multiFilter( selector, jQuery.grep(this, function(elem){
				return elem.nodeType === 1;
			}) ), "filter", selector );
	},

	closest: function( selector ) {
		var pos = jQuery.expr.match.POS.test( selector ) ? jQuery(selector) : null,
			closer = 0;

		return this.map(function(){
			var cur = this;
			while ( cur && cur.ownerDocument ) {
				if ( pos ? pos.index(cur) > -1 : jQuery(cur).is(selector) ) {
					jQuery.data(cur, "closest", closer);
					return cur;
				}
				cur = cur.parentNode;
				closer++;
			}
		});
	},

	not: function( selector ) {
		if ( typeof selector === "string" )
			// test special case where just one selector is passed in
			if ( isSimple.test( selector ) )
				return this.pushStack( jQuery.multiFilter( selector, this, true ), "not", selector );
			else
				selector = jQuery.multiFilter( selector, this );

		var isArrayLike = selector.length && selector[selector.length - 1] !== undefined && !selector.nodeType;
		return this.filter(function() {
			return isArrayLike ? jQuery.inArray( this, selector ) < 0 : this != selector;
		});
	},

	add: function( selector ) {
		return this.pushStack( jQuery.unique( jQuery.merge(
			this.get(),
			typeof selector === "string" ?
				jQuery( selector ) :
				jQuery.makeArray( selector )
		)));
	},

	is: function( selector ) {
		return !!selector && jQuery.multiFilter( selector, this ).length > 0;
	},

	hasClass: function( selector ) {
		return !!selector && this.is( "." + selector );
	},

	val: function( value ) {
		if ( value === undefined ) {			
			var elem = this[0];

			if ( elem ) {
				if( jQuery.nodeName( elem, 'option' ) )
					return (elem.attributes.value || {}).specified ? elem.value : elem.text;
				
				// We need to handle select boxes special
				if ( jQuery.nodeName( elem, "select" ) ) {
					var index = elem.selectedIndex,
						values = [],
						options = elem.options,
						one = elem.type == "select-one";

					// Nothing was selected
					if ( index < 0 )
						return null;

					// Loop through all the selected options
					for ( var i = one ? index : 0, max = one ? index + 1 : options.length; i < max; i++ ) {
						var option = options[ i ];

						if ( option.selected ) {
							// Get the specifc value for the option
							value = jQuery(option).val();

							// We don't need an array for one selects
							if ( one )
								return value;

							// Multi-Selects return an array
							values.push( value );
						}
					}

					return values;				
				}

				// Everything else, we just grab the value
				return (elem.value || "").replace(/\r/g, "");

			}

			return undefined;
		}

		if ( typeof value === "number" )
			value += '';

		return this.each(function(){
			if ( this.nodeType != 1 )
				return;

			if ( jQuery.isArray(value) && /radio|checkbox/.test( this.type ) )
				this.checked = (jQuery.inArray(this.value, value) >= 0 ||
					jQuery.inArray(this.name, value) >= 0);

			else if ( jQuery.nodeName( this, "select" ) ) {
				var values = jQuery.makeArray(value);

				jQuery( "option", this ).each(function(){
					this.selected = (jQuery.inArray( this.value, values ) >= 0 ||
						jQuery.inArray( this.text, values ) >= 0);
				});

				if ( !values.length )
					this.selectedIndex = -1;

			} else
				this.value = value;
		});
	},

	html: function( value ) {
		return value === undefined ?
			(this[0] ?
				this[0].innerHTML.replace(/ jQuery\d+="(?:\d+|null)"/g, "") :
				null) :
			this.empty().append( value );
	},

	replaceWith: function( value ) {
		return this.after( value ).remove();
	},

	eq: function( i ) {
		return this.slice( i, +i + 1 );
	},

	slice: function() {
		return this.pushStack( Array.prototype.slice.apply( this, arguments ),
			"slice", Array.prototype.slice.call(arguments).join(",") );
	},

	map: function( callback ) {
		return this.pushStack( jQuery.map(this, function(elem, i){
			return callback.call( elem, i, elem );
		}));
	},

	andSelf: function() {
		return this.add( this.prevObject );
	},

	domManip: function( args, table, callback ) {
		if ( this[0] ) {
			var fragment = (this[0].ownerDocument || this[0]).createDocumentFragment(),
				scripts = jQuery.clean( args, (this[0].ownerDocument || this[0]), fragment ),
				first = fragment.firstChild;

			if ( first )
				for ( var i = 0, l = this.length; i < l; i++ )
					callback.call( root(this[i], first), this.length > 1 || i > 0 ?
							fragment.cloneNode(true) : fragment );
		
			if ( scripts )
				jQuery.each( scripts, evalScript );
		}

		return this;
		
		function root( elem, cur ) {
			return table && jQuery.nodeName(elem, "table") && jQuery.nodeName(cur, "tr") ?
				(elem.getElementsByTagName("tbody")[0] ||
				elem.appendChild(elem.ownerDocument.createElement("tbody"))) :
				elem;
		}
	}
};

// Give the init function the jQuery prototype for later instantiation
jQuery.fn.init.prototype = jQuery.fn;

function evalScript( i, elem ) {
	if ( elem.src )
		jQuery.ajax({
			url: elem.src,
			async: false,
			dataType: "script"
		});

	else
		jQuery.globalEval( elem.text || elem.textContent || elem.innerHTML || "" );

	if ( elem.parentNode )
		elem.parentNode.removeChild( elem );
}

function now(){
	return +new Date;
}

jQuery.extend = jQuery.fn.extend = function() {
	// copy reference to target object
	var target = arguments[0] || {}, i = 1, length = arguments.length, deep = false, options;

	// Handle a deep copy situation
	if ( typeof target === "boolean" ) {
		deep = target;
		target = arguments[1] || {};
		// skip the boolean and the target
		i = 2;
	}

	// Handle case when target is a string or something (possible in deep copy)
	if ( typeof target !== "object" && !jQuery.isFunction(target) )
		target = {};

	// extend jQuery itself if only one argument is passed
	if ( length == i ) {
		target = this;
		--i;
	}

	for ( ; i < length; i++ )
		// Only deal with non-null/undefined values
		if ( (options = arguments[ i ]) != null )
			// Extend the base object
			for ( var name in options ) {
				var src = target[ name ], copy = options[ name ];

				// Prevent never-ending loop
				if ( target === copy )
					continue;

				// Recurse if we're merging object values
				if ( deep && copy && typeof copy === "object" && !copy.nodeType )
					target[ name ] = jQuery.extend( deep, 
						// Never move original objects, clone them
						src || ( copy.length != null ? [ ] : { } )
					, copy );

				// Don't bring in undefined values
				else if ( copy !== undefined )
					target[ name ] = copy;

			}

	// Return the modified object
	return target;
};

// exclude the following css properties to add px
var	exclude = /z-?index|font-?weight|opacity|zoom|line-?height/i,
	// cache defaultView
	defaultView = document.defaultView || {},
	toString = Object.prototype.toString;

jQuery.extend({
	noConflict: function( deep ) {
		window.$ = _$;

		if ( deep )
			window.jQuery = _jQuery;

		return jQuery;
	},

	// See test/unit/core.js for details concerning isFunction.
	// Since version 1.3, DOM methods and functions like alert
	// aren't supported. They return false on IE (#2968).
	isFunction: function( obj ) {
		return toString.call(obj) === "[object Function]";
	},

	isArray: function( obj ) {
		return toString.call(obj) === "[object Array]";
	},

	// check if an element is in a (or is an) XML document
	isXMLDoc: function( elem ) {
		return elem.nodeType === 9 && elem.documentElement.nodeName !== "HTML" ||
			!!elem.ownerDocument && jQuery.isXMLDoc( elem.ownerDocument );
	},

	// Evalulates a script in a global context
	globalEval: function( data ) {
		if ( data && /\S/.test(data) ) {
			// Inspired by code by Andrea Giammarchi
			// http://webreflection.blogspot.com/2007/08/global-scope-evaluation-and-dom.html
			var head = document.getElementsByTagName("head")[0] || document.documentElement,
				script = document.createElement("script");

			script.type = "text/javascript";
			if ( jQuery.support.scriptEval )
				script.appendChild( document.createTextNode( data ) );
			else
				script.text = data;

			// Use insertBefore instead of appendChild  to circumvent an IE6 bug.
			// This arises when a base node is used (#2709).
			head.insertBefore( script, head.firstChild );
			head.removeChild( script );
		}
	},

	nodeName: function( elem, name ) {
		return elem.nodeName && elem.nodeName.toUpperCase() == name.toUpperCase();
	},

	// args is for internal usage only
	each: function( object, callback, args ) {
		var name, i = 0, length = object.length;

		if ( args ) {
			if ( length === undefined ) {
				for ( name in object )
					if ( callback.apply( object[ name ], args ) === false )
						break;
			} else
				for ( ; i < length; )
					if ( callback.apply( object[ i++ ], args ) === false )
						break;

		// A special, fast, case for the most common use of each
		} else {
			if ( length === undefined ) {
				for ( name in object )
					if ( callback.call( object[ name ], name, object[ name ] ) === false )
						break;
			} else
				for ( var value = object[0];
					i < length && callback.call( value, i, value ) !== false; value = object[++i] ){}
		}

		return object;
	},

	prop: function( elem, value, type, i, name ) {
		// Handle executable functions
		if ( jQuery.isFunction( value ) )
			value = value.call( elem, i );

		// Handle passing in a number to a CSS property
		return typeof value === "number" && type == "curCSS" && !exclude.test( name ) ?
			value + "px" :
			value;
	},

	className: {
		// internal only, use addClass("class")
		add: function( elem, classNames ) {
			jQuery.each((classNames || "").split(/\s+/), function(i, className){
				if ( elem.nodeType == 1 && !jQuery.className.has( elem.className, className ) )
					elem.className += (elem.className ? " " : "") + className;
			});
		},

		// internal only, use removeClass("class")
		remove: function( elem, classNames ) {
			if (elem.nodeType == 1)
				elem.className = classNames !== undefined ?
					jQuery.grep(elem.className.split(/\s+/), function(className){
						return !jQuery.className.has( classNames, className );
					}).join(" ") :
					"";
		},

		// internal only, use hasClass("class")
		has: function( elem, className ) {
			return elem && jQuery.inArray( className, (elem.className || elem).toString().split(/\s+/) ) > -1;
		}
	},

	// A method for quickly swapping in/out CSS properties to get correct calculations
	swap: function( elem, options, callback ) {
		var old = {};
		// Remember the old values, and insert the new ones
		for ( var name in options ) {
			old[ name ] = elem.style[ name ];
			elem.style[ name ] = options[ name ];
		}

		callback.call( elem );

		// Revert the old values
		for ( var name in options )
			elem.style[ name ] = old[ name ];
	},

	css: function( elem, name, force, extra ) {
		if ( name == "width" || name == "height" ) {
			var val, props = { position: "absolute", visibility: "hidden", display:"block" }, which = name == "width" ? [ "Left", "Right" ] : [ "Top", "Bottom" ];

			function getWH() {
				val = name == "width" ? elem.offsetWidth : elem.offsetHeight;

				if ( extra === "border" )
					return;

				jQuery.each( which, function() {
					if ( !extra )
						val -= parseFloat(jQuery.curCSS( elem, "padding" + this, true)) || 0;
					if ( extra === "margin" )
						val += parseFloat(jQuery.curCSS( elem, "margin" + this, true)) || 0;
					else
						val -= parseFloat(jQuery.curCSS( elem, "border" + this + "Width", true)) || 0;
				});
			}

			if ( elem.offsetWidth !== 0 )
				getWH();
			else
				jQuery.swap( elem, props, getWH );

			return Math.max(0, Math.round(val));
		}

		return jQuery.curCSS( elem, name, force );
	},

	curCSS: function( elem, name, force ) {
		var ret, style = elem.style;

		// We need to handle opacity special in IE
		if ( name == "opacity" && !jQuery.support.opacity ) {
			ret = jQuery.attr( style, "opacity" );

			return ret == "" ?
				"1" :
				ret;
		}

		// Make sure we're using the right name for getting the float value
		if ( name.match( /float/i ) )
			name = styleFloat;

		if ( !force && style && style[ name ] )
			ret = style[ name ];

		else if ( defaultView.getComputedStyle ) {

			// Only "float" is needed here
			if ( name.match( /float/i ) )
				name = "float";

			name = name.replace( /([A-Z])/g, "-$1" ).toLowerCase();

			var computedStyle = defaultView.getComputedStyle( elem, null );

			if ( computedStyle )
				ret = computedStyle.getPropertyValue( name );

			// We should always get a number back from opacity
			if ( name == "opacity" && ret == "" )
				ret = "1";

		} else if ( elem.currentStyle ) {
			var camelCase = name.replace(/\-(\w)/g, function(all, letter){
				return letter.toUpperCase();
			});

			ret = elem.currentStyle[ name ] || elem.currentStyle[ camelCase ];

			// From the awesome hack by Dean Edwards
			// http://erik.eae.net/archives/2007/07/27/18.54.15/#comment-102291

			// If we're not dealing with a regular pixel number
			// but a number that has a weird ending, we need to convert it to pixels
			if ( !/^\d+(px)?$/i.test( ret ) && /^\d/.test( ret ) ) {
				// Remember the original values
				var left = style.left, rsLeft = elem.runtimeStyle.left;

				// Put in the new values to get a computed value out
				elem.runtimeStyle.left = elem.currentStyle.left;
				style.left = ret || 0;
				ret = style.pixelLeft + "px";

				// Revert the changed values
				style.left = left;
				elem.runtimeStyle.left = rsLeft;
			}
		}

		return ret;
	},

	clean: function( elems, context, fragment ) {
		context = context || document;

		// !context.createElement fails in IE with an error but returns typeof 'object'
		if ( typeof context.createElement === "undefined" )
			context = context.ownerDocument || context[0] && context[0].ownerDocument || document;

		// If a single string is passed in and it's a single tag
		// just do a createElement and skip the rest
		if ( !fragment && elems.length === 1 && typeof elems[0] === "string" ) {
			var match = /^<(\w+)\s*\/?>$/.exec(elems[0]);
			if ( match )
				return [ context.createElement( match[1] ) ];
		}

		var ret = [], scripts = [], div = context.createElement("div");

		jQuery.each(elems, function(i, elem){
			if ( typeof elem === "number" )
				elem += '';

			if ( !elem )
				return;

			// Convert html string into DOM nodes
			if ( typeof elem === "string" ) {
				// Fix "XHTML"-style tags in all browsers
				elem = elem.replace(/(<(\w+)[^>]*?)\/>/g, function(all, front, tag){
					return tag.match(/^(abbr|br|col|img|input|link|meta|param|hr|area|embed)$/i) ?
						all :
						front + "></" + tag + ">";
				});

				// Trim whitespace, otherwise indexOf won't work as expected
				var tags = elem.replace(/^\s+/, "").substring(0, 10).toLowerCase();

				var wrap =
					// option or optgroup
					!tags.indexOf("<opt") &&
					[ 1, "<select multiple='multiple'>", "</select>" ] ||

					!tags.indexOf("<leg") &&
					[ 1, "<fieldset>", "</fieldset>" ] ||

					tags.match(/^<(thead|tbody|tfoot|colg|cap)/) &&
					[ 1, "<table>", "</table>" ] ||

					!tags.indexOf("<tr") &&
					[ 2, "<table><tbody>", "</tbody></table>" ] ||

				 	// <thead> matched above
					(!tags.indexOf("<td") || !tags.indexOf("<th")) &&
					[ 3, "<table><tbody><tr>", "</tr></tbody></table>" ] ||

					!tags.indexOf("<col") &&
					[ 2, "<table><tbody></tbody><colgroup>", "</colgroup></table>" ] ||

					// IE can't serialize <link> and <script> tags normally
					!jQuery.support.htmlSerialize &&
					[ 1, "div<div>", "</div>" ] ||

					[ 0, "", "" ];

				// Go to html and back, then peel off extra wrappers
				div.innerHTML = wrap[1] + elem + wrap[2];

				// Move to the right depth
				while ( wrap[0]-- )
					div = div.lastChild;

				// Remove IE's autoinserted <tbody> from table fragments
				if ( !jQuery.support.tbody ) {

					// String was a <table>, *may* have spurious <tbody>
					var hasBody = /<tbody/i.test(elem),
						tbody = !tags.indexOf("<table") && !hasBody ?
							div.firstChild && div.firstChild.childNodes :

						// String was a bare <thead> or <tfoot>
						wrap[1] == "<table>" && !hasBody ?
							div.childNodes :
							[];

					for ( var j = tbody.length - 1; j >= 0 ; --j )
						if ( jQuery.nodeName( tbody[ j ], "tbody" ) && !tbody[ j ].childNodes.length )
							tbody[ j ].parentNode.removeChild( tbody[ j ] );

					}

				// IE completely kills leading whitespace when innerHTML is used
				if ( !jQuery.support.leadingWhitespace && /^\s/.test( elem ) )
					div.insertBefore( context.createTextNode( elem.match(/^\s*/)[0] ), div.firstChild );
				
				elem = jQuery.makeArray( div.childNodes );
			}

			if ( elem.nodeType )
				ret.push( elem );
			else
				ret = jQuery.merge( ret, elem );

		});

		if ( fragment ) {
			for ( var i = 0; ret[i]; i++ ) {
				if ( jQuery.nodeName( ret[i], "script" ) && (!ret[i].type || ret[i].type.toLowerCase() === "text/javascript") ) {
					scripts.push( ret[i].parentNode ? ret[i].parentNode.removeChild( ret[i] ) : ret[i] );
				} else {
					if ( ret[i].nodeType === 1 )
						ret.splice.apply( ret, [i + 1, 0].concat(jQuery.makeArray(ret[i].getElementsByTagName("script"))) );
					fragment.appendChild( ret[i] );
				}
			}
			
			return scripts;
		}

		return ret;
	},

	attr: function( elem, name, value ) {
		// don't set attributes on text and comment nodes
		if (!elem || elem.nodeType == 3 || elem.nodeType == 8)
			return undefined;

		var notxml = !jQuery.isXMLDoc( elem ),
			// Whether we are setting (or getting)
			set = value !== undefined;

		// Try to normalize/fix the name
		name = notxml && jQuery.props[ name ] || name;

		// Only do all the following if this is a node (faster for style)
		// IE elem.getAttribute passes even for style
		if ( elem.tagName ) {

			// These attributes require special treatment
			var special = /href|src|style/.test( name );

			// Safari mis-reports the default selected property of a hidden option
			// Accessing the parent's selectedIndex property fixes it
			if ( name == "selected" && elem.parentNode )
				elem.parentNode.selectedIndex;

			// If applicable, access the attribute via the DOM 0 way
			if ( name in elem && notxml && !special ) {
				if ( set ){
					// We can't allow the type property to be changed (since it causes problems in IE)
					if ( name == "type" && jQuery.nodeName( elem, "input" ) && elem.parentNode )
						throw "type property can't be changed";

					elem[ name ] = value;
				}

				// browsers index elements by id/name on forms, give priority to attributes.
				if( jQuery.nodeName( elem, "form" ) && elem.getAttributeNode(name) )
					return elem.getAttributeNode( name ).nodeValue;

				// elem.tabIndex doesn't always return the correct value when it hasn't been explicitly set
				// http://fluidproject.org/blog/2008/01/09/getting-setting-and-removing-tabindex-values-with-javascript/
				if ( name == "tabIndex" ) {
					var attributeNode = elem.getAttributeNode( "tabIndex" );
					return attributeNode && attributeNode.specified
						? attributeNode.value
						: elem.nodeName.match(/(button|input|object|select|textarea)/i)
							? 0
							: elem.nodeName.match(/^(a|area)$/i) && elem.href
								? 0
								: undefined;
				}

				return elem[ name ];
			}

			if ( !jQuery.support.style && notxml &&  name == "style" )
				return jQuery.attr( elem.style, "cssText", value );

			if ( set )
				// convert the value to a string (all browsers do this but IE) see #1070
				elem.setAttribute( name, "" + value );

			var attr = !jQuery.support.hrefNormalized && notxml && special
					// Some attributes require a special call on IE
					? elem.getAttribute( name, 2 )
					: elem.getAttribute( name );

			// Non-existent attributes return null, we normalize to undefined
			return attr === null ? undefined : attr;
		}

		// elem is actually elem.style ... set the style

		// IE uses filters for opacity
		if ( !jQuery.support.opacity && name == "opacity" ) {
			if ( set ) {
				// IE has trouble with opacity if it does not have layout
				// Force it by setting the zoom level
				elem.zoom = 1;

				// Set the alpha filter to set the opacity
				elem.filter = (elem.filter || "").replace( /alpha\([^)]*\)/, "" ) +
					(parseInt( value ) + '' == "NaN" ? "" : "alpha(opacity=" + value * 100 + ")");
			}

			return elem.filter && elem.filter.indexOf("opacity=") >= 0 ?
				(parseFloat( elem.filter.match(/opacity=([^)]*)/)[1] ) / 100) + '':
				"";
		}

		name = name.replace(/-([a-z])/ig, function(all, letter){
			return letter.toUpperCase();
		});

		if ( set )
			elem[ name ] = value;

		return elem[ name ];
	},

	trim: function( text ) {
		return (text || "").replace( /^\s+|\s+$/g, "" );
	},

	makeArray: function( array ) {
		var ret = [];

		if( array != null ){
			var i = array.length;
			// The window, strings (and functions) also have 'length'
			if( i == null || typeof array === "string" || jQuery.isFunction(array) || array.setInterval )
				ret[0] = array;
			else
				while( i )
					ret[--i] = array[i];
		}

		return ret;
	},

	inArray: function( elem, array ) {
		for ( var i = 0, length = array.length; i < length; i++ )
		// Use === because on IE, window == document
			if ( array[ i ] === elem )
				return i;

		return -1;
	},

	merge: function( first, second ) {
		// We have to loop this way because IE & Opera overwrite the length
		// expando of getElementsByTagName
		var i = 0, elem, pos = first.length;
		// Also, we need to make sure that the correct elements are being returned
		// (IE returns comment nodes in a '*' query)
		if ( !jQuery.support.getAll ) {
			while ( (elem = second[ i++ ]) != null )
				if ( elem.nodeType != 8 )
					first[ pos++ ] = elem;

		} else
			while ( (elem = second[ i++ ]) != null )
				first[ pos++ ] = elem;

		return first;
	},

	unique: function( array ) {
		var ret = [], done = {};

		try {

			for ( var i = 0, length = array.length; i < length; i++ ) {
				var id = jQuery.data( array[ i ] );

				if ( !done[ id ] ) {
					done[ id ] = true;
					ret.push( array[ i ] );
				}
			}

		} catch( e ) {
			ret = array;
		}

		return ret;
	},

	grep: function( elems, callback, inv ) {
		var ret = [];

		// Go through the array, only saving the items
		// that pass the validator function
		for ( var i = 0, length = elems.length; i < length; i++ )
			if ( !inv != !callback( elems[ i ], i ) )
				ret.push( elems[ i ] );

		return ret;
	},

	map: function( elems, callback ) {
		var ret = [];

		// Go through the array, translating each of the items to their
		// new value (or values).
		for ( var i = 0, length = elems.length; i < length; i++ ) {
			var value = callback( elems[ i ], i );

			if ( value != null )
				ret[ ret.length ] = value;
		}

		return ret.concat.apply( [], ret );
	}
});

// Use of jQuery.browser is deprecated.
// It's included for backwards compatibility and plugins,
// although they should work to migrate away.

var userAgent = navigator.userAgent.toLowerCase();

// Figure out what browser is being used
jQuery.browser = {
	version: (userAgent.match( /.+(?:rv|it|ra|ie)[\/: ]([\d.]+)/ ) || [0,'0'])[1],
	safari: /webkit/.test( userAgent ),
	opera: /opera/.test( userAgent ),
	msie: /msie/.test( userAgent ) && !/opera/.test( userAgent ),
	mozilla: /mozilla/.test( userAgent ) && !/(compatible|webkit)/.test( userAgent )
};

jQuery.each({
	parent: function(elem){return elem.parentNode;},
	parents: function(elem){return jQuery.dir(elem,"parentNode");},
	next: function(elem){return jQuery.nth(elem,2,"nextSibling");},
	prev: function(elem){return jQuery.nth(elem,2,"previousSibling");},
	nextAll: function(elem){return jQuery.dir(elem,"nextSibling");},
	prevAll: function(elem){return jQuery.dir(elem,"previousSibling");},
	siblings: function(elem){return jQuery.sibling(elem.parentNode.firstChild,elem);},
	children: function(elem){return jQuery.sibling(elem.firstChild);},
	contents: function(elem){return jQuery.nodeName(elem,"iframe")?elem.contentDocument||elem.contentWindow.document:jQuery.makeArray(elem.childNodes);}
}, function(name, fn){
	jQuery.fn[ name ] = function( selector ) {
		var ret = jQuery.map( this, fn );

		if ( selector && typeof selector == "string" )
			ret = jQuery.multiFilter( selector, ret );

		return this.pushStack( jQuery.unique( ret ), name, selector );
	};
});

jQuery.each({
	appendTo: "append",
	prependTo: "prepend",
	insertBefore: "before",
	insertAfter: "after",
	replaceAll: "replaceWith"
}, function(name, original){
	jQuery.fn[ name ] = function( selector ) {
		var ret = [], insert = jQuery( selector );

		for ( var i = 0, l = insert.length; i < l; i++ ) {
			var elems = (i > 0 ? this.clone(true) : this).get();
			jQuery.fn[ original ].apply( jQuery(insert[i]), elems );
			ret = ret.concat( elems );
		}

		return this.pushStack( ret, name, selector );
	};
});

jQuery.each({
	removeAttr: function( name ) {
		jQuery.attr( this, name, "" );
		if (this.nodeType == 1)
			this.removeAttribute( name );
	},

	addClass: function( classNames ) {
		jQuery.className.add( this, classNames );
	},

	removeClass: function( classNames ) {
		jQuery.className.remove( this, classNames );
	},

	toggleClass: function( classNames, state ) {
		if( typeof state !== "boolean" )
			state = !jQuery.className.has( this, classNames );
		jQuery.className[ state ? "add" : "remove" ]( this, classNames );
	},

	remove: function( selector ) {
		if ( !selector || jQuery.filter( selector, [ this ] ).length ) {
			// Prevent memory leaks
			jQuery( "*", this ).add([this]).each(function(){
				jQuery.event.remove(this);
				jQuery.removeData(this);
			});
			if (this.parentNode)
				this.parentNode.removeChild( this );
		}
	},

	empty: function() {
		// Remove element nodes and prevent memory leaks
		jQuery(this).children().remove();

		// Remove any remaining nodes
		while ( this.firstChild )
			this.removeChild( this.firstChild );
	}
}, function(name, fn){
	jQuery.fn[ name ] = function(){
		return this.each( fn, arguments );
	};
});

// Helper function used by the dimensions and offset modules
function num(elem, prop) {
	return elem[0] && parseInt( jQuery.curCSS(elem[0], prop, true), 10 ) || 0;
}
var expando = "jQuery" + now(), uuid = 0, windowData = {};

jQuery.extend({
	cache: {},

	data: function( elem, name, data ) {
		elem = elem == window ?
			windowData :
			elem;

		var id = elem[ expando ];

		// Compute a unique ID for the element
		if ( !id )
			id = elem[ expando ] = ++uuid;

		// Only generate the data cache if we're
		// trying to access or manipulate it
		if ( name && !jQuery.cache[ id ] )
			jQuery.cache[ id ] = {};

		// Prevent overriding the named cache with undefined values
		if ( data !== undefined )
			jQuery.cache[ id ][ name ] = data;

		// Return the named cache data, or the ID for the element
		return name ?
			jQuery.cache[ id ][ name ] :
			id;
	},

	removeData: function( elem, name ) {
		elem = elem == window ?
			windowData :
			elem;

		var id = elem[ expando ];

		// If we want to remove a specific section of the element's data
		if ( name ) {
			if ( jQuery.cache[ id ] ) {
				// Remove the section of cache data
				delete jQuery.cache[ id ][ name ];

				// If we've removed all the data, remove the element's cache
				name = "";

				for ( name in jQuery.cache[ id ] )
					break;

				if ( !name )
					jQuery.removeData( elem );
			}

		// Otherwise, we want to remove all of the element's data
		} else {
			// Clean up the element expando
			try {
				delete elem[ expando ];
			} catch(e){
				// IE has trouble directly removing the expando
				// but it's ok with using removeAttribute
				if ( elem.removeAttribute )
					elem.removeAttribute( expando );
			}

			// Completely remove the data cache
			delete jQuery.cache[ id ];
		}
	},
	queue: function( elem, type, data ) {
		if ( elem ){
	
			type = (type || "fx") + "queue";
	
			var q = jQuery.data( elem, type );
	
			if ( !q || jQuery.isArray(data) )
				q = jQuery.data( elem, type, jQuery.makeArray(data) );
			else if( data )
				q.push( data );
	
		}
		return q;
	},

	dequeue: function( elem, type ){
		var queue = jQuery.queue( elem, type ),
			fn = queue.shift();
		
		if( !type || type === "fx" )
			fn = queue[0];
			
		if( fn !== undefined )
			fn.call(elem);
	}
});

jQuery.fn.extend({
	data: function( key, value ){
		var parts = key.split(".");
		parts[1] = parts[1] ? "." + parts[1] : "";

		if ( value === undefined ) {
			var data = this.triggerHandler("getData" + parts[1] + "!", [parts[0]]);

			if ( data === undefined && this.length )
				data = jQuery.data( this[0], key );

			return data === undefined && parts[1] ?
				this.data( parts[0] ) :
				data;
		} else
			return this.trigger("setData" + parts[1] + "!", [parts[0], value]).each(function(){
				jQuery.data( this, key, value );
			});
	},

	removeData: function( key ){
		return this.each(function(){
			jQuery.removeData( this, key );
		});
	},
	queue: function(type, data){
		if ( typeof type !== "string" ) {
			data = type;
			type = "fx";
		}

		if ( data === undefined )
			return jQuery.queue( this[0], type );

		return this.each(function(){
			var queue = jQuery.queue( this, type, data );
			
			 if( type == "fx" && queue.length == 1 )
				queue[0].call(this);
		});
	},
	dequeue: function(type){
		return this.each(function(){
			jQuery.dequeue( this, type );
		});
	}
});/*!
 * Sizzle CSS Selector Engine - v0.9.3
 *  Copyright 2009, The Dojo Foundation
 *  Released under the MIT, BSD, and GPL Licenses.
 *  More information: http://sizzlejs.com/
 */
(function(){

var chunker = /((?:\((?:\([^()]+\)|[^()]+)+\)|\[(?:\[[^[\]]*\]|['"][^'"]*['"]|[^[\]'"]+)+\]|\\.|[^ >+~,(\[\\]+)+|[>+~])(\s*,\s*)?/g,
	done = 0,
	toString = Object.prototype.toString;

var Sizzle = function(selector, context, results, seed) {
	results = results || [];
	context = context || document;

	if ( context.nodeType !== 1 && context.nodeType !== 9 )
		return [];
	
	if ( !selector || typeof selector !== "string" ) {
		return results;
	}

	var parts = [], m, set, checkSet, check, mode, extra, prune = true;
	
	// Reset the position of the chunker regexp (start from head)
	chunker.lastIndex = 0;
	
	while ( (m = chunker.exec(selector)) !== null ) {
		parts.push( m[1] );
		
		if ( m[2] ) {
			extra = RegExp.rightContext;
			break;
		}
	}

	if ( parts.length > 1 && origPOS.exec( selector ) ) {
		if ( parts.length === 2 && Expr.relative[ parts[0] ] ) {
			set = posProcess( parts[0] + parts[1], context );
		} else {
			set = Expr.relative[ parts[0] ] ?
				[ context ] :
				Sizzle( parts.shift(), context );

			while ( parts.length ) {
				selector = parts.shift();

				if ( Expr.relative[ selector ] )
					selector += parts.shift();

				set = posProcess( selector, set );
			}
		}
	} else {
		var ret = seed ?
			{ expr: parts.pop(), set: makeArray(seed) } :
			Sizzle.find( parts.pop(), parts.length === 1 && context.parentNode ? context.parentNode : context, isXML(context) );
		set = Sizzle.filter( ret.expr, ret.set );

		if ( parts.length > 0 ) {
			checkSet = makeArray(set);
		} else {
			prune = false;
		}

		while ( parts.length ) {
			var cur = parts.pop(), pop = cur;

			if ( !Expr.relative[ cur ] ) {
				cur = "";
			} else {
				pop = parts.pop();
			}

			if ( pop == null ) {
				pop = context;
			}

			Expr.relative[ cur ]( checkSet, pop, isXML(context) );
		}
	}

	if ( !checkSet ) {
		checkSet = set;
	}

	if ( !checkSet ) {
		throw "Syntax error, unrecognized expression: " + (cur || selector);
	}

	if ( toString.call(checkSet) === "[object Array]" ) {
		if ( !prune ) {
			results.push.apply( results, checkSet );
		} else if ( context.nodeType === 1 ) {
			for ( var i = 0; checkSet[i] != null; i++ ) {
				if ( checkSet[i] && (checkSet[i] === true || checkSet[i].nodeType === 1 && contains(context, checkSet[i])) ) {
					results.push( set[i] );
				}
			}
		} else {
			for ( var i = 0; checkSet[i] != null; i++ ) {
				if ( checkSet[i] && checkSet[i].nodeType === 1 ) {
					results.push( set[i] );
				}
			}
		}
	} else {
		makeArray( checkSet, results );
	}

	if ( extra ) {
		Sizzle( extra, context, results, seed );

		if ( sortOrder ) {
			hasDuplicate = false;
			results.sort(sortOrder);

			if ( hasDuplicate ) {
				for ( var i = 1; i < results.length; i++ ) {
					if ( results[i] === results[i-1] ) {
						results.splice(i--, 1);
					}
				}
			}
		}
	}

	return results;
};

Sizzle.matches = function(expr, set){
	return Sizzle(expr, null, null, set);
};

Sizzle.find = function(expr, context, isXML){
	var set, match;

	if ( !expr ) {
		return [];
	}

	for ( var i = 0, l = Expr.order.length; i < l; i++ ) {
		var type = Expr.order[i], match;
		
		if ( (match = Expr.match[ type ].exec( expr )) ) {
			var left = RegExp.leftContext;

			if ( left.substr( left.length - 1 ) !== "\\" ) {
				match[1] = (match[1] || "").replace(/\\/g, "");
				set = Expr.find[ type ]( match, context, isXML );
				if ( set != null ) {
					expr = expr.replace( Expr.match[ type ], "" );
					break;
				}
			}
		}
	}

	if ( !set ) {
		set = context.getElementsByTagName("*");
	}

	return {set: set, expr: expr};
};

Sizzle.filter = function(expr, set, inplace, not){
	var old = expr, result = [], curLoop = set, match, anyFound,
		isXMLFilter = set && set[0] && isXML(set[0]);

	while ( expr && set.length ) {
		for ( var type in Expr.filter ) {
			if ( (match = Expr.match[ type ].exec( expr )) != null ) {
				var filter = Expr.filter[ type ], found, item;
				anyFound = false;

				if ( curLoop == result ) {
					result = [];
				}

				if ( Expr.preFilter[ type ] ) {
					match = Expr.preFilter[ type ]( match, curLoop, inplace, result, not, isXMLFilter );

					if ( !match ) {
						anyFound = found = true;
					} else if ( match === true ) {
						continue;
					}
				}

				if ( match ) {
					for ( var i = 0; (item = curLoop[i]) != null; i++ ) {
						if ( item ) {
							found = filter( item, match, i, curLoop );
							var pass = not ^ !!found;

							if ( inplace && found != null ) {
								if ( pass ) {
									anyFound = true;
								} else {
									curLoop[i] = false;
								}
							} else if ( pass ) {
								result.push( item );
								anyFound = true;
							}
						}
					}
				}

				if ( found !== undefined ) {
					if ( !inplace ) {
						curLoop = result;
					}

					expr = expr.replace( Expr.match[ type ], "" );

					if ( !anyFound ) {
						return [];
					}

					break;
				}
			}
		}

		// Improper expression
		if ( expr == old ) {
			if ( anyFound == null ) {
				throw "Syntax error, unrecognized expression: " + expr;
			} else {
				break;
			}
		}

		old = expr;
	}

	return curLoop;
};

var Expr = Sizzle.selectors = {
	order: [ "ID", "NAME", "TAG" ],
	match: {
		ID: /#((?:[\w\u00c0-\uFFFF_-]|\\.)+)/,
		CLASS: /\.((?:[\w\u00c0-\uFFFF_-]|\\.)+)/,
		NAME: /\[name=['"]*((?:[\w\u00c0-\uFFFF_-]|\\.)+)['"]*\]/,
		ATTR: /\[\s*((?:[\w\u00c0-\uFFFF_-]|\\.)+)\s*(?:(\S?=)\s*(['"]*)(.*?)\3|)\s*\]/,
		TAG: /^((?:[\w\u00c0-\uFFFF\*_-]|\\.)+)/,
		CHILD: /:(only|nth|last|first)-child(?:\((even|odd|[\dn+-]*)\))?/,
		POS: /:(nth|eq|gt|lt|first|last|even|odd)(?:\((\d*)\))?(?=[^-]|$)/,
		PSEUDO: /:((?:[\w\u00c0-\uFFFF_-]|\\.)+)(?:\((['"]*)((?:\([^\)]+\)|[^\2\(\)]*)+)\2\))?/
	},
	attrMap: {
		"class": "className",
		"for": "htmlFor"
	},
	attrHandle: {
		href: function(elem){
			return elem.getAttribute("href");
		}
	},
	relative: {
		"+": function(checkSet, part, isXML){
			var isPartStr = typeof part === "string",
				isTag = isPartStr && !/\W/.test(part),
				isPartStrNotTag = isPartStr && !isTag;

			if ( isTag && !isXML ) {
				part = part.toUpperCase();
			}

			for ( var i = 0, l = checkSet.length, elem; i < l; i++ ) {
				if ( (elem = checkSet[i]) ) {
					while ( (elem = elem.previousSibling) && elem.nodeType !== 1 ) {}

					checkSet[i] = isPartStrNotTag || elem && elem.nodeName === part ?
						elem || false :
						elem === part;
				}
			}

			if ( isPartStrNotTag ) {
				Sizzle.filter( part, checkSet, true );
			}
		},
		">": function(checkSet, part, isXML){
			var isPartStr = typeof part === "string";

			if ( isPartStr && !/\W/.test(part) ) {
				part = isXML ? part : part.toUpperCase();

				for ( var i = 0, l = checkSet.length; i < l; i++ ) {
					var elem = checkSet[i];
					if ( elem ) {
						var parent = elem.parentNode;
						checkSet[i] = parent.nodeName === part ? parent : false;
					}
				}
			} else {
				for ( var i = 0, l = checkSet.length; i < l; i++ ) {
					var elem = checkSet[i];
					if ( elem ) {
						checkSet[i] = isPartStr ?
							elem.parentNode :
							elem.parentNode === part;
					}
				}

				if ( isPartStr ) {
					Sizzle.filter( part, checkSet, true );
				}
			}
		},
		"": function(checkSet, part, isXML){
			var doneName = done++, checkFn = dirCheck;

			if ( !part.match(/\W/) ) {
				var nodeCheck = part = isXML ? part : part.toUpperCase();
				checkFn = dirNodeCheck;
			}

			checkFn("parentNode", part, doneName, checkSet, nodeCheck, isXML);
		},
		"~": function(checkSet, part, isXML){
			var doneName = done++, checkFn = dirCheck;

			if ( typeof part === "string" && !part.match(/\W/) ) {
				var nodeCheck = part = isXML ? part : part.toUpperCase();
				checkFn = dirNodeCheck;
			}

			checkFn("previousSibling", part, doneName, checkSet, nodeCheck, isXML);
		}
	},
	find: {
		ID: function(match, context, isXML){
			if ( typeof context.getElementById !== "undefined" && !isXML ) {
				var m = context.getElementById(match[1]);
				return m ? [m] : [];
			}
		},
		NAME: function(match, context, isXML){
			if ( typeof context.getElementsByName !== "undefined" ) {
				var ret = [], results = context.getElementsByName(match[1]);

				for ( var i = 0, l = results.length; i < l; i++ ) {
					if ( results[i].getAttribute("name") === match[1] ) {
						ret.push( results[i] );
					}
				}

				return ret.length === 0 ? null : ret;
			}
		},
		TAG: function(match, context){
			return context.getElementsByTagName(match[1]);
		}
	},
	preFilter: {
		CLASS: function(match, curLoop, inplace, result, not, isXML){
			match = " " + match[1].replace(/\\/g, "") + " ";

			if ( isXML ) {
				return match;
			}

			for ( var i = 0, elem; (elem = curLoop[i]) != null; i++ ) {
				if ( elem ) {
					if ( not ^ (elem.className && (" " + elem.className + " ").indexOf(match) >= 0) ) {
						if ( !inplace )
							result.push( elem );
					} else if ( inplace ) {
						curLoop[i] = false;
					}
				}
			}

			return false;
		},
		ID: function(match){
			return match[1].replace(/\\/g, "");
		},
		TAG: function(match, curLoop){
			for ( var i = 0; curLoop[i] === false; i++ ){}
			return curLoop[i] && isXML(curLoop[i]) ? match[1] : match[1].toUpperCase();
		},
		CHILD: function(match){
			if ( match[1] == "nth" ) {
				// parse equations like 'even', 'odd', '5', '2n', '3n+2', '4n-1', '-n+6'
				var test = /(-?)(\d*)n((?:\+|-)?\d*)/.exec(
					match[2] == "even" && "2n" || match[2] == "odd" && "2n+1" ||
					!/\D/.test( match[2] ) && "0n+" + match[2] || match[2]);

				// calculate the numbers (first)n+(last) including if they are negative
				match[2] = (test[1] + (test[2] || 1)) - 0;
				match[3] = test[3] - 0;
			}

			// TODO: Move to normal caching system
			match[0] = done++;

			return match;
		},
		ATTR: function(match, curLoop, inplace, result, not, isXML){
			var name = match[1].replace(/\\/g, "");
			
			if ( !isXML && Expr.attrMap[name] ) {
				match[1] = Expr.attrMap[name];
			}

			if ( match[2] === "~=" ) {
				match[4] = " " + match[4] + " ";
			}

			return match;
		},
		PSEUDO: function(match, curLoop, inplace, result, not){
			if ( match[1] === "not" ) {
				// If we're dealing with a complex expression, or a simple one
				if ( match[3].match(chunker).length > 1 || /^\w/.test(match[3]) ) {
					match[3] = Sizzle(match[3], null, null, curLoop);
				} else {
					var ret = Sizzle.filter(match[3], curLoop, inplace, true ^ not);
					if ( !inplace ) {
						result.push.apply( result, ret );
					}
					return false;
				}
			} else if ( Expr.match.POS.test( match[0] ) || Expr.match.CHILD.test( match[0] ) ) {
				return true;
			}
			
			return match;
		},
		POS: function(match){
			match.unshift( true );
			return match;
		}
	},
	filters: {
		enabled: function(elem){
			return elem.disabled === false && elem.type !== "hidden";
		},
		disabled: function(elem){
			return elem.disabled === true;
		},
		checked: function(elem){
			return elem.checked === true;
		},
		selected: function(elem){
			// Accessing this property makes selected-by-default
			// options in Safari work properly
			elem.parentNode.selectedIndex;
			return elem.selected === true;
		},
		parent: function(elem){
			return !!elem.firstChild;
		},
		empty: function(elem){
			return !elem.firstChild;
		},
		has: function(elem, i, match){
			return !!Sizzle( match[3], elem ).length;
		},
		header: function(elem){
			return /h\d/i.test( elem.nodeName );
		},
		text: function(elem){
			return "text" === elem.type;
		},
		radio: function(elem){
			return "radio" === elem.type;
		},
		checkbox: function(elem){
			return "checkbox" === elem.type;
		},
		file: function(elem){
			return "file" === elem.type;
		},
		password: function(elem){
			return "password" === elem.type;
		},
		submit: function(elem){
			return "submit" === elem.type;
		},
		image: function(elem){
			return "image" === elem.type;
		},
		reset: function(elem){
			return "reset" === elem.type;
		},
		button: function(elem){
			return "button" === elem.type || elem.nodeName.toUpperCase() === "BUTTON";
		},
		input: function(elem){
			return /input|select|textarea|button/i.test(elem.nodeName);
		}
	},
	setFilters: {
		first: function(elem, i){
			return i === 0;
		},
		last: function(elem, i, match, array){
			return i === array.length - 1;
		},
		even: function(elem, i){
			return i % 2 === 0;
		},
		odd: function(elem, i){
			return i % 2 === 1;
		},
		lt: function(elem, i, match){
			return i < match[3] - 0;
		},
		gt: function(elem, i, match){
			return i > match[3] - 0;
		},
		nth: function(elem, i, match){
			return match[3] - 0 == i;
		},
		eq: function(elem, i, match){
			return match[3] - 0 == i;
		}
	},
	filter: {
		PSEUDO: function(elem, match, i, array){
			var name = match[1], filter = Expr.filters[ name ];

			if ( filter ) {
				return filter( elem, i, match, array );
			} else if ( name === "contains" ) {
				return (elem.textContent || elem.innerText || "").indexOf(match[3]) >= 0;
			} else if ( name === "not" ) {
				var not = match[3];

				for ( var i = 0, l = not.length; i < l; i++ ) {
					if ( not[i] === elem ) {
						return false;
					}
				}

				return true;
			}
		},
		CHILD: function(elem, match){
			var type = match[1], node = elem;
			switch (type) {
				case 'only':
				case 'first':
					while (node = node.previousSibling)  {
						if ( node.nodeType === 1 ) return false;
					}
					if ( type == 'first') return true;
					node = elem;
				case 'last':
					while (node = node.nextSibling)  {
						if ( node.nodeType === 1 ) return false;
					}
					return true;
				case 'nth':
					var first = match[2], last = match[3];

					if ( first == 1 && last == 0 ) {
						return true;
					}
					
					var doneName = match[0],
						parent = elem.parentNode;
	
					if ( parent && (parent.sizcache !== doneName || !elem.nodeIndex) ) {
						var count = 0;
						for ( node = parent.firstChild; node; node = node.nextSibling ) {
							if ( node.nodeType === 1 ) {
								node.nodeIndex = ++count;
							}
						} 
						parent.sizcache = doneName;
					}
					
					var diff = elem.nodeIndex - last;
					if ( first == 0 ) {
						return diff == 0;
					} else {
						return ( diff % first == 0 && diff / first >= 0 );
					}
			}
		},
		ID: function(elem, match){
			return elem.nodeType === 1 && elem.getAttribute("id") === match;
		},
		TAG: function(elem, match){
			return (match === "*" && elem.nodeType === 1) || elem.nodeName === match;
		},
		CLASS: function(elem, match){
			return (" " + (elem.className || elem.getAttribute("class")) + " ")
				.indexOf( match ) > -1;
		},
		ATTR: function(elem, match){
			var name = match[1],
				result = Expr.attrHandle[ name ] ?
					Expr.attrHandle[ name ]( elem ) :
					elem[ name ] != null ?
						elem[ name ] :
						elem.getAttribute( name ),
				value = result + "",
				type = match[2],
				check = match[4];

			return result == null ?
				type === "!=" :
				type === "=" ?
				value === check :
				type === "*=" ?
				value.indexOf(check) >= 0 :
				type === "~=" ?
				(" " + value + " ").indexOf(check) >= 0 :
				!check ?
				value && result !== false :
				type === "!=" ?
				value != check :
				type === "^=" ?
				value.indexOf(check) === 0 :
				type === "$=" ?
				value.substr(value.length - check.length) === check :
				type === "|=" ?
				value === check || value.substr(0, check.length + 1) === check + "-" :
				false;
		},
		POS: function(elem, match, i, array){
			var name = match[2], filter = Expr.setFilters[ name ];

			if ( filter ) {
				return filter( elem, i, match, array );
			}
		}
	}
};

var origPOS = Expr.match.POS;

for ( var type in Expr.match ) {
	Expr.match[ type ] = RegExp( Expr.match[ type ].source + /(?![^\[]*\])(?![^\(]*\))/.source );
}

var makeArray = function(array, results) {
	array = Array.prototype.slice.call( array );

	if ( results ) {
		results.push.apply( results, array );
		return results;
	}
	
	return array;
};

// Perform a simple check to determine if the browser is capable of
// converting a NodeList to an array using builtin methods.
try {
	Array.prototype.slice.call( document.documentElement.childNodes );

// Provide a fallback method if it does not work
} catch(e){
	makeArray = function(array, results) {
		var ret = results || [];

		if ( toString.call(array) === "[object Array]" ) {
			Array.prototype.push.apply( ret, array );
		} else {
			if ( typeof array.length === "number" ) {
				for ( var i = 0, l = array.length; i < l; i++ ) {
					ret.push( array[i] );
				}
			} else {
				for ( var i = 0; array[i]; i++ ) {
					ret.push( array[i] );
				}
			}
		}

		return ret;
	};
}

var sortOrder;

if ( document.documentElement.compareDocumentPosition ) {
	sortOrder = function( a, b ) {
		var ret = a.compareDocumentPosition(b) & 4 ? -1 : a === b ? 0 : 1;
		if ( ret === 0 ) {
			hasDuplicate = true;
		}
		return ret;
	};
} else if ( "sourceIndex" in document.documentElement ) {
	sortOrder = function( a, b ) {
		var ret = a.sourceIndex - b.sourceIndex;
		if ( ret === 0 ) {
			hasDuplicate = true;
		}
		return ret;
	};
} else if ( document.createRange ) {
	sortOrder = function( a, b ) {
		var aRange = a.ownerDocument.createRange(), bRange = b.ownerDocument.createRange();
		aRange.selectNode(a);
		aRange.collapse(true);
		bRange.selectNode(b);
		bRange.collapse(true);
		var ret = aRange.compareBoundaryPoints(Range.START_TO_END, bRange);
		if ( ret === 0 ) {
			hasDuplicate = true;
		}
		return ret;
	};
}

// Check to see if the browser returns elements by name when
// querying by getElementById (and provide a workaround)
(function(){
	// We're going to inject a fake input element with a specified name
	var form = document.createElement("form"),
		id = "script" + (new Date).getTime();
	form.innerHTML = "<input name='" + id + "'/>";

	// Inject it into the root element, check its status, and remove it quickly
	var root = document.documentElement;
	root.insertBefore( form, root.firstChild );

	// The workaround has to do additional checks after a getElementById
	// Which slows things down for other browsers (hence the branching)
	if ( !!document.getElementById( id ) ) {
		Expr.find.ID = function(match, context, isXML){
			if ( typeof context.getElementById !== "undefined" && !isXML ) {
				var m = context.getElementById(match[1]);
				return m ? m.id === match[1] || typeof m.getAttributeNode !== "undefined" && m.getAttributeNode("id").nodeValue === match[1] ? [m] : undefined : [];
			}
		};

		Expr.filter.ID = function(elem, match){
			var node = typeof elem.getAttributeNode !== "undefined" && elem.getAttributeNode("id");
			return elem.nodeType === 1 && node && node.nodeValue === match;
		};
	}

	root.removeChild( form );
})();

(function(){
	// Check to see if the browser returns only elements
	// when doing getElementsByTagName("*")

	// Create a fake element
	var div = document.createElement("div");
	div.appendChild( document.createComment("") );

	// Make sure no comments are found
	if ( div.getElementsByTagName("*").length > 0 ) {
		Expr.find.TAG = function(match, context){
			var results = context.getElementsByTagName(match[1]);

			// Filter out possible comments
			if ( match[1] === "*" ) {
				var tmp = [];

				for ( var i = 0; results[i]; i++ ) {
					if ( results[i].nodeType === 1 ) {
						tmp.push( results[i] );
					}
				}

				results = tmp;
			}

			return results;
		};
	}

	// Check to see if an attribute returns normalized href attributes
	div.innerHTML = "<a href='#'></a>";
	if ( div.firstChild && typeof div.firstChild.getAttribute !== "undefined" &&
			div.firstChild.getAttribute("href") !== "#" ) {
		Expr.attrHandle.href = function(elem){
			return elem.getAttribute("href", 2);
		};
	}
})();

if ( document.querySelectorAll ) (function(){
	var oldSizzle = Sizzle, div = document.createElement("div");
	div.innerHTML = "<p class='TEST'></p>";

	// Safari can't handle uppercase or unicode characters when
	// in quirks mode.
	if ( div.querySelectorAll && div.querySelectorAll(".TEST").length === 0 ) {
		return;
	}
	
	Sizzle = function(query, context, extra, seed){
		context = context || document;

		// Only use querySelectorAll on non-XML documents
		// (ID selectors don't work in non-HTML documents)
		if ( !seed && context.nodeType === 9 && !isXML(context) ) {
			try {
				return makeArray( context.querySelectorAll(query), extra );
			} catch(e){}
		}
		
		return oldSizzle(query, context, extra, seed);
	};

	Sizzle.find = oldSizzle.find;
	Sizzle.filter = oldSizzle.filter;
	Sizzle.selectors = oldSizzle.selectors;
	Sizzle.matches = oldSizzle.matches;
})();

if ( document.getElementsByClassName && document.documentElement.getElementsByClassName ) (function(){
	var div = document.createElement("div");
	div.innerHTML = "<div class='test e'></div><div class='test'></div>";

	// Opera can't find a second classname (in 9.6)
	if ( div.getElementsByClassName("e").length === 0 )
		return;

	// Safari caches class attributes, doesn't catch changes (in 3.2)
	div.lastChild.className = "e";

	if ( div.getElementsByClassName("e").length === 1 )
		return;

	Expr.order.splice(1, 0, "CLASS");
	Expr.find.CLASS = function(match, context, isXML) {
		if ( typeof context.getElementsByClassName !== "undefined" && !isXML ) {
			return context.getElementsByClassName(match[1]);
		}
	};
})();

function dirNodeCheck( dir, cur, doneName, checkSet, nodeCheck, isXML ) {
	var sibDir = dir == "previousSibling" && !isXML;
	for ( var i = 0, l = checkSet.length; i < l; i++ ) {
		var elem = checkSet[i];
		if ( elem ) {
			if ( sibDir && elem.nodeType === 1 ){
				elem.sizcache = doneName;
				elem.sizset = i;
			}
			elem = elem[dir];
			var match = false;

			while ( elem ) {
				if ( elem.sizcache === doneName ) {
					match = checkSet[elem.sizset];
					break;
				}

				if ( elem.nodeType === 1 && !isXML ){
					elem.sizcache = doneName;
					elem.sizset = i;
				}

				if ( elem.nodeName === cur ) {
					match = elem;
					break;
				}

				elem = elem[dir];
			}

			checkSet[i] = match;
		}
	}
}

function dirCheck( dir, cur, doneName, checkSet, nodeCheck, isXML ) {
	var sibDir = dir == "previousSibling" && !isXML;
	for ( var i = 0, l = checkSet.length; i < l; i++ ) {
		var elem = checkSet[i];
		if ( elem ) {
			if ( sibDir && elem.nodeType === 1 ) {
				elem.sizcache = doneName;
				elem.sizset = i;
			}
			elem = elem[dir];
			var match = false;

			while ( elem ) {
				if ( elem.sizcache === doneName ) {
					match = checkSet[elem.sizset];
					break;
				}

				if ( elem.nodeType === 1 ) {
					if ( !isXML ) {
						elem.sizcache = doneName;
						elem.sizset = i;
					}
					if ( typeof cur !== "string" ) {
						if ( elem === cur ) {
							match = true;
							break;
						}

					} else if ( Sizzle.filter( cur, [elem] ).length > 0 ) {
						match = elem;
						break;
					}
				}

				elem = elem[dir];
			}

			checkSet[i] = match;
		}
	}
}

var contains = document.compareDocumentPosition ?  function(a, b){
	return a.compareDocumentPosition(b) & 16;
} : function(a, b){
	return a !== b && (a.contains ? a.contains(b) : true);
};

var isXML = function(elem){
	return elem.nodeType === 9 && elem.documentElement.nodeName !== "HTML" ||
		!!elem.ownerDocument && isXML( elem.ownerDocument );
};

var posProcess = function(selector, context){
	var tmpSet = [], later = "", match,
		root = context.nodeType ? [context] : context;

	// Position selectors must be done after the filter
	// And so must :not(positional) so we move all PSEUDOs to the end
	while ( (match = Expr.match.PSEUDO.exec( selector )) ) {
		later += match[0];
		selector = selector.replace( Expr.match.PSEUDO, "" );
	}

	selector = Expr.relative[selector] ? selector + "*" : selector;

	for ( var i = 0, l = root.length; i < l; i++ ) {
		Sizzle( selector, root[i], tmpSet );
	}

	return Sizzle.filter( later, tmpSet );
};

// EXPOSE
jQuery.find = Sizzle;
jQuery.filter = Sizzle.filter;
jQuery.expr = Sizzle.selectors;
jQuery.expr[":"] = jQuery.expr.filters;

Sizzle.selectors.filters.hidden = function(elem){
	return elem.offsetWidth === 0 || elem.offsetHeight === 0;
};

Sizzle.selectors.filters.visible = function(elem){
	return elem.offsetWidth > 0 || elem.offsetHeight > 0;
};

Sizzle.selectors.filters.animated = function(elem){
	return jQuery.grep(jQuery.timers, function(fn){
		return elem === fn.elem;
	}).length;
};

jQuery.multiFilter = function( expr, elems, not ) {
	if ( not ) {
		expr = ":not(" + expr + ")";
	}

	return Sizzle.matches(expr, elems);
};

jQuery.dir = function( elem, dir ){
	var matched = [], cur = elem[dir];
	while ( cur && cur != document ) {
		if ( cur.nodeType == 1 )
			matched.push( cur );
		cur = cur[dir];
	}
	return matched;
};

jQuery.nth = function(cur, result, dir, elem){
	result = result || 1;
	var num = 0;

	for ( ; cur; cur = cur[dir] )
		if ( cur.nodeType == 1 && ++num == result )
			break;

	return cur;
};

jQuery.sibling = function(n, elem){
	var r = [];

	for ( ; n; n = n.nextSibling ) {
		if ( n.nodeType == 1 && n != elem )
			r.push( n );
	}

	return r;
};

return;

window.Sizzle = Sizzle;

})();
/*
 * A number of helper functions used for managing events.
 * Many of the ideas behind this code originated from
 * Dean Edwards' addEvent library.
 */
jQuery.event = {

	// Bind an event to an element
	// Original by Dean Edwards
	add: function(elem, types, handler, data) {
		if ( elem.nodeType == 3 || elem.nodeType == 8 )
			return;

		// For whatever reason, IE has trouble passing the window object
		// around, causing it to be cloned in the process
		if ( elem.setInterval && elem != window )
			elem = window;

		// Make sure that the function being executed has a unique ID
		if ( !handler.guid )
			handler.guid = this.guid++;

		// if data is passed, bind to handler
		if ( data !== undefined ) {
			// Create temporary function pointer to original handler
			var fn = handler;

			// Create unique handler function, wrapped around original handler
			handler = this.proxy( fn );

			// Store data in unique handler
			handler.data = data;
		}

		// Init the element's event structure
		var events = jQuery.data(elem, "events") || jQuery.data(elem, "events", {}),
			handle = jQuery.data(elem, "handle") || jQuery.data(elem, "handle", function(){
				// Handle the second event of a trigger and when
				// an event is called after a page has unloaded
				return typeof jQuery !== "undefined" && !jQuery.event.triggered ?
					jQuery.event.handle.apply(arguments.callee.elem, arguments) :
					undefined;
			});
		// Add elem as a property of the handle function
		// This is to prevent a memory leak with non-native
		// event in IE.
		handle.elem = elem;

		// Handle multiple events separated by a space
		// jQuery(...).bind("mouseover mouseout", fn);
		jQuery.each(types.split(/\s+/), function(index, type) {
			// Namespaced event handlers
			var namespaces = type.split(".");
			type = namespaces.shift();
			handler.type = namespaces.slice().sort().join(".");

			// Get the current list of functions bound to this event
			var handlers = events[type];
			
			if ( jQuery.event.specialAll[type] )
				jQuery.event.specialAll[type].setup.call(elem, data, namespaces);

			// Init the event handler queue
			if (!handlers) {
				handlers = events[type] = {};

				// Check for a special event handler
				// Only use addEventListener/attachEvent if the special
				// events handler returns false
				if ( !jQuery.event.special[type] || jQuery.event.special[type].setup.call(elem, data, namespaces) === false ) {
					// Bind the global event handler to the element
					if (elem.addEventListener)
						elem.addEventListener(type, handle, false);
					else if (elem.attachEvent)
						elem.attachEvent("on" + type, handle);
				}
			}

			// Add the function to the element's handler list
			handlers[handler.guid] = handler;

			// Keep track of which events have been used, for global triggering
			jQuery.event.global[type] = true;
		});

		// Nullify elem to prevent memory leaks in IE
		elem = null;
	},

	guid: 1,
	global: {},

	// Detach an event or set of events from an element
	remove: function(elem, types, handler) {
		// don't do events on text and comment nodes
		if ( elem.nodeType == 3 || elem.nodeType == 8 )
			return;

		var events = jQuery.data(elem, "events"), ret, index;

		if ( events ) {
			// Unbind all events for the element
			if ( types === undefined || (typeof types === "string" && types.charAt(0) == ".") )
				for ( var type in events )
					this.remove( elem, type + (types || "") );
			else {
				// types is actually an event object here
				if ( types.type ) {
					handler = types.handler;
					types = types.type;
				}

				// Handle multiple events seperated by a space
				// jQuery(...).unbind("mouseover mouseout", fn);
				jQuery.each(types.split(/\s+/), function(index, type){
					// Namespaced event handlers
					var namespaces = type.split(".");
					type = namespaces.shift();
					var namespace = RegExp("(^|\\.)" + namespaces.slice().sort().join(".*\\.") + "(\\.|$)");

					if ( events[type] ) {
						// remove the given handler for the given type
						if ( handler )
							delete events[type][handler.guid];

						// remove all handlers for the given type
						else
							for ( var handle in events[type] )
								// Handle the removal of namespaced events
								if ( namespace.test(events[type][handle].type) )
									delete events[type][handle];
									
						if ( jQuery.event.specialAll[type] )
							jQuery.event.specialAll[type].teardown.call(elem, namespaces);

						// remove generic event handler if no more handlers exist
						for ( ret in events[type] ) break;
						if ( !ret ) {
							if ( !jQuery.event.special[type] || jQuery.event.special[type].teardown.call(elem, namespaces) === false ) {
								if (elem.removeEventListener)
									elem.removeEventListener(type, jQuery.data(elem, "handle"), false);
								else if (elem.detachEvent)
									elem.detachEvent("on" + type, jQuery.data(elem, "handle"));
							}
							ret = null;
							delete events[type];
						}
					}
				});
			}

			// Remove the expando if it's no longer used
			for ( ret in events ) break;
			if ( !ret ) {
				var handle = jQuery.data( elem, "handle" );
				if ( handle ) handle.elem = null;
				jQuery.removeData( elem, "events" );
				jQuery.removeData( elem, "handle" );
			}
		}
	},

	// bubbling is internal
	trigger: function( event, data, elem, bubbling ) {
		// Event object or event type
		var type = event.type || event;

		if( !bubbling ){
			event = typeof event === "object" ?
				// jQuery.Event object
				event[expando] ? event :
				// Object literal
				jQuery.extend( jQuery.Event(type), event ) :
				// Just the event type (string)
				jQuery.Event(type);

			if ( type.indexOf("!") >= 0 ) {
				event.type = type = type.slice(0, -1);
				event.exclusive = true;
			}

			// Handle a global trigger
			if ( !elem ) {
				// Don't bubble custom events when global (to avoid too much overhead)
				event.stopPropagation();
				// Only trigger if we've ever bound an event for it
				if ( this.global[type] )
					jQuery.each( jQuery.cache, function(){
						if ( this.events && this.events[type] )
							jQuery.event.trigger( event, data, this.handle.elem );
					});
			}

			// Handle triggering a single element

			// don't do events on text and comment nodes
			if ( !elem || elem.nodeType == 3 || elem.nodeType == 8 )
				return undefined;
			
			// Clean up in case it is reused
			event.result = undefined;
			event.target = elem;
			
			// Clone the incoming data, if any
			data = jQuery.makeArray(data);
			data.unshift( event );
		}

		event.currentTarget = elem;

		// Trigger the event, it is assumed that "handle" is a function
		var handle = jQuery.data(elem, "handle");
		if ( handle )
			handle.apply( elem, data );

		// Handle triggering native .onfoo handlers (and on links since we don't call .click() for links)
		if ( (!elem[type] || (jQuery.nodeName(elem, 'a') && type == "click")) && elem["on"+type] && elem["on"+type].apply( elem, data ) === false )
			event.result = false;

		// Trigger the native events (except for clicks on links)
		if ( !bubbling && elem[type] && !event.isDefaultPrevented() && !(jQuery.nodeName(elem, 'a') && type == "click") ) {
			this.triggered = true;
			try {
				elem[ type ]();
			// prevent IE from throwing an error for some hidden elements
			} catch (e) {}
		}

		this.triggered = false;

		if ( !event.isPropagationStopped() ) {
			var parent = elem.parentNode || elem.ownerDocument;
			if ( parent )
				jQuery.event.trigger(event, data, parent, true);
		}
	},

	handle: function(event) {
		// returned undefined or false
		var all, handlers;

		event = arguments[0] = jQuery.event.fix( event || window.event );
		event.currentTarget = this;
		
		// Namespaced event handlers
		var namespaces = event.type.split(".");
		event.type = namespaces.shift();

		// Cache this now, all = true means, any handler
		all = !namespaces.length && !event.exclusive;
		
		var namespace = RegExp("(^|\\.)" + namespaces.slice().sort().join(".*\\.") + "(\\.|$)");

		handlers = ( jQuery.data(this, "events") || {} )[event.type];

		for ( var j in handlers ) {
			var handler = handlers[j];

			// Filter the functions by class
			if ( all || namespace.test(handler.type) ) {
				// Pass in a reference to the handler function itself
				// So that we can later remove it
				event.handler = handler;
				event.data = handler.data;

				var ret = handler.apply(this, arguments);

				if( ret !== undefined ){
					event.result = ret;
					if ( ret === false ) {
						event.preventDefault();
						event.stopPropagation();
					}
				}

				if( event.isImmediatePropagationStopped() )
					break;

			}
		}
	},

	props: "altKey attrChange attrName bubbles button cancelable charCode clientX clientY ctrlKey currentTarget data detail eventPhase fromElement handler keyCode metaKey newValue originalTarget pageX pageY prevValue relatedNode relatedTarget screenX screenY shiftKey srcElement target toElement view wheelDelta which".split(" "),

	fix: function(event) {
		if ( event[expando] )
			return event;

		// store a copy of the original event object
		// and "clone" to set read-only properties
		var originalEvent = event;
		event = jQuery.Event( originalEvent );

		for ( var i = this.props.length, prop; i; ){
			prop = this.props[ --i ];
			event[ prop ] = originalEvent[ prop ];
		}

		// Fix target property, if necessary
		if ( !event.target )
			event.target = event.srcElement || document; // Fixes #1925 where srcElement might not be defined either

		// check if target is a textnode (safari)
		if ( event.target.nodeType == 3 )
			event.target = event.target.parentNode;

		// Add relatedTarget, if necessary
		if ( !event.relatedTarget && event.fromElement )
			event.relatedTarget = event.fromElement == event.target ? event.toElement : event.fromElement;

		// Calculate pageX/Y if missing and clientX/Y available
		if ( event.pageX == null && event.clientX != null ) {
			var doc = document.documentElement, body = document.body;
			event.pageX = event.clientX + (doc && doc.scrollLeft || body && body.scrollLeft || 0) - (doc.clientLeft || 0);
			event.pageY = event.clientY + (doc && doc.scrollTop || body && body.scrollTop || 0) - (doc.clientTop || 0);
		}

		// Add which for key events
		if ( !event.which && ((event.charCode || event.charCode === 0) ? event.charCode : event.keyCode) )
			event.which = event.charCode || event.keyCode;

		// Add metaKey to non-Mac browsers (use ctrl for PC's and Meta for Macs)
		if ( !event.metaKey && event.ctrlKey )
			event.metaKey = event.ctrlKey;

		// Add which for click: 1 == left; 2 == middle; 3 == right
		// Note: button is not normalized, so don't use it
		if ( !event.which && event.button )
			event.which = (event.button & 1 ? 1 : ( event.button & 2 ? 3 : ( event.button & 4 ? 2 : 0 ) ));

		return event;
	},

	proxy: function( fn, proxy ){
		proxy = proxy || function(){ return fn.apply(this, arguments); };
		// Set the guid of unique handler to the same of original handler, so it can be removed
		proxy.guid = fn.guid = fn.guid || proxy.guid || this.guid++;
		// So proxy can be declared as an argument
		return proxy;
	},

	special: {
		ready: {
			// Make sure the ready event is setup
			setup: bindReady,
			teardown: function() {}
		}
	},
	
	specialAll: {
		live: {
			setup: function( selector, namespaces ){
				jQuery.event.add( this, namespaces[0], liveHandler );
			},
			teardown:  function( namespaces ){
				if ( namespaces.length ) {
					var remove = 0, name = RegExp("(^|\\.)" + namespaces[0] + "(\\.|$)");
					
					jQuery.each( (jQuery.data(this, "events").live || {}), function(){
						if ( name.test(this.type) )
							remove++;
					});
					
					if ( remove < 1 )
						jQuery.event.remove( this, namespaces[0], liveHandler );
				}
			}
		}
	}
};

jQuery.Event = function( src ){
	// Allow instantiation without the 'new' keyword
	if( !this.preventDefault )
		return new jQuery.Event(src);
	
	// Event object
	if( src && src.type ){
		this.originalEvent = src;
		this.type = src.type;
	// Event type
	}else
		this.type = src;

	// timeStamp is buggy for some events on Firefox(#3843)
	// So we won't rely on the native value
	this.timeStamp = now();
	
	// Mark it as fixed
	this[expando] = true;
};

function returnFalse(){
	return false;
}
function returnTrue(){
	return true;
}

// jQuery.Event is based on DOM3 Events as specified by the ECMAScript Language Binding
// http://www.w3.org/TR/2003/WD-DOM-Level-3-Events-20030331/ecma-script-binding.html
jQuery.Event.prototype = {
	preventDefault: function() {
		this.isDefaultPrevented = returnTrue;

		var e = this.originalEvent;
		if( !e )
			return;
		// if preventDefault exists run it on the original event
		if (e.preventDefault)
			e.preventDefault();
		// otherwise set the returnValue property of the original event to false (IE)
		e.returnValue = false;
	},
	stopPropagation: function() {
		this.isPropagationStopped = returnTrue;

		var e = this.originalEvent;
		if( !e )
			return;
		// if stopPropagation exists run it on the original event
		if (e.stopPropagation)
			e.stopPropagation();
		// otherwise set the cancelBubble property of the original event to true (IE)
		e.cancelBubble = true;
	},
	stopImmediatePropagation:function(){
		this.isImmediatePropagationStopped = returnTrue;
		this.stopPropagation();
	},
	isDefaultPrevented: returnFalse,
	isPropagationStopped: returnFalse,
	isImmediatePropagationStopped: returnFalse
};
// Checks if an event happened on an element within another element
// Used in jQuery.event.special.mouseenter and mouseleave handlers
var withinElement = function(event) {
	// Check if mouse(over|out) are still within the same parent element
	var parent = event.relatedTarget;
	// Traverse up the tree
	while ( parent && parent != this )
		try { parent = parent.parentNode; }
		catch(e) { parent = this; }
	
	if( parent != this ){
		// set the correct event type
		event.type = event.data;
		// handle event if we actually just moused on to a non sub-element
		jQuery.event.handle.apply( this, arguments );
	}
};
	
jQuery.each({ 
	mouseover: 'mouseenter', 
	mouseout: 'mouseleave'
}, function( orig, fix ){
	jQuery.event.special[ fix ] = {
		setup: function(){
			jQuery.event.add( this, orig, withinElement, fix );
		},
		teardown: function(){
			jQuery.event.remove( this, orig, withinElement );
		}
	};			   
});

jQuery.fn.extend({
	bind: function( type, data, fn ) {
		return type == "unload" ? this.one(type, data, fn) : this.each(function(){
			jQuery.event.add( this, type, fn || data, fn && data );
		});
	},

	one: function( type, data, fn ) {
		var one = jQuery.event.proxy( fn || data, function(event) {
			jQuery(this).unbind(event, one);
			return (fn || data).apply( this, arguments );
		});
		return this.each(function(){
			jQuery.event.add( this, type, one, fn && data);
		});
	},

	unbind: function( type, fn ) {
		return this.each(function(){
			jQuery.event.remove( this, type, fn );
		});
	},

	trigger: function( type, data ) {
		return this.each(function(){
			jQuery.event.trigger( type, data, this );
		});
	},

	triggerHandler: function( type, data ) {
		if( this[0] ){
			var event = jQuery.Event(type);
			event.preventDefault();
			event.stopPropagation();
			jQuery.event.trigger( event, data, this[0] );
			return event.result;
		}		
	},

	toggle: function( fn ) {
		// Save reference to arguments for access in closure
		var args = arguments, i = 1;

		// link all the functions, so any of them can unbind this click handler
		while( i < args.length )
			jQuery.event.proxy( fn, args[i++] );

		return this.click( jQuery.event.proxy( fn, function(event) {
			// Figure out which function to execute
			this.lastToggle = ( this.lastToggle || 0 ) % i;

			// Make sure that clicks stop
			event.preventDefault();

			// and execute the function
			return args[ this.lastToggle++ ].apply( this, arguments ) || false;
		}));
	},

	hover: function(fnOver, fnOut) {
		return this.mouseenter(fnOver).mouseleave(fnOut);
	},

	ready: function(fn) {
		// Attach the listeners
		bindReady();

		// If the DOM is already ready
		if ( jQuery.isReady )
			// Execute the function immediately
			fn.call( document, jQuery );

		// Otherwise, remember the function for later
		else
			// Add the function to the wait list
			jQuery.readyList.push( fn );

		return this;
	},
	
	live: function( type, fn ){
		var proxy = jQuery.event.proxy( fn );
		proxy.guid += this.selector + type;

		jQuery(document).bind( liveConvert(type, this.selector), this.selector, proxy );

		return this;
	},
	
	die: function( type, fn ){
		jQuery(document).unbind( liveConvert(type, this.selector), fn ? { guid: fn.guid + this.selector + type } : null );
		return this;
	}
});

function liveHandler( event ){
	var check = RegExp("(^|\\.)" + event.type + "(\\.|$)"),
		stop = true,
		elems = [];

	jQuery.each(jQuery.data(this, "events").live || [], function(i, fn){
		if ( check.test(fn.type) ) {
			var elem = jQuery(event.target).closest(fn.data)[0];
			if ( elem )
				elems.push({ elem: elem, fn: fn });
		}
	});

	elems.sort(function(a,b) {
		return jQuery.data(a.elem, "closest") - jQuery.data(b.elem, "closest");
	});
	
	jQuery.each(elems, function(){
		if ( this.fn.call(this.elem, event, this.fn.data) === false )
			return (stop = false);
	});

	return stop;
}

function liveConvert(type, selector){
	return ["live", type, selector.replace(/\./g, "`").replace(/ /g, "|")].join(".");
}

jQuery.extend({
	isReady: false,
	readyList: [],
	// Handle when the DOM is ready
	ready: function() {
		// Make sure that the DOM is not already loaded
		if ( !jQuery.isReady ) {
			// Remember that the DOM is ready
			jQuery.isReady = true;

			// If there are functions bound, to execute
			if ( jQuery.readyList ) {
				// Execute all of them
				jQuery.each( jQuery.readyList, function(){
					this.call( document, jQuery );
				});

				// Reset the list of functions
				jQuery.readyList = null;
			}

			// Trigger any bound ready events
			jQuery(document).triggerHandler("ready");
		}
	}
});

var readyBound = false;

function bindReady(){
	if ( readyBound ) return;
	readyBound = true;

	// Mozilla, Opera and webkit nightlies currently support this event
	if ( document.addEventListener ) {
		// Use the handy event callback
		document.addEventListener( "DOMContentLoaded", function(){
			document.removeEventListener( "DOMContentLoaded", arguments.callee, false );
			jQuery.ready();
		}, false );

	// If IE event model is used
	} else if ( document.attachEvent ) {
		// ensure firing before onload,
		// maybe late but safe also for iframes
		document.attachEvent("onreadystatechange", function(){
			if ( document.readyState === "complete" ) {
				document.detachEvent( "onreadystatechange", arguments.callee );
				jQuery.ready();
			}
		});

		// If IE and not an iframe
		// continually check to see if the document is ready
		if ( document.documentElement.doScroll && window == window.top ) (function(){
			if ( jQuery.isReady ) return;

			try {
				// If IE is used, use the trick by Diego Perini
				// http://javascript.nwbox.com/IEContentLoaded/
				document.documentElement.doScroll("left");
			} catch( error ) {
				setTimeout( arguments.callee, 0 );
				return;
			}

			// and execute any waiting functions
			jQuery.ready();
		})();
	}

	// A fallback to window.onload, that will always work
	jQuery.event.add( window, "load", jQuery.ready );
}

jQuery.each( ("blur,focus,load,resize,scroll,unload,click,dblclick," +
	"mousedown,mouseup,mousemove,mouseover,mouseout,mouseenter,mouseleave," +
	"change,select,submit,keydown,keypress,keyup,error").split(","), function(i, name){

	// Handle event binding
	jQuery.fn[name] = function(fn){
		return fn ? this.bind(name, fn) : this.trigger(name);
	};
});

// Prevent memory leaks in IE
// And prevent errors on refresh with events like mouseover in other browsers
// Window isn't included so as not to unbind existing unload events
jQuery( window ).bind( 'unload', function(){ 
	for ( var id in jQuery.cache )
		// Skip the window
		if ( id != 1 && jQuery.cache[ id ].handle )
			jQuery.event.remove( jQuery.cache[ id ].handle.elem );
}); 
(function(){

	jQuery.support = {};

	var root = document.documentElement,
		script = document.createElement("script"),
		div = document.createElement("div"),
		id = "script" + (new Date).getTime();

	div.style.display = "none";
	div.innerHTML = '   <link/><table></table><a href="/a" style="color:red;float:left;opacity:.5;">a</a><select><option>text</option></select><object><param/></object>';

	var all = div.getElementsByTagName("*"),
		a = div.getElementsByTagName("a")[0];

	// Can't get basic test support
	if ( !all || !all.length || !a ) {
		return;
	}

	jQuery.support = {
		// IE strips leading whitespace when .innerHTML is used
		leadingWhitespace: div.firstChild.nodeType == 3,
		
		// Make sure that tbody elements aren't automatically inserted
		// IE will insert them into empty tables
		tbody: !div.getElementsByTagName("tbody").length,
		
		// Make sure that you can get all elements in an <object> element
		// IE 7 always returns no results
		objectAll: !!div.getElementsByTagName("object")[0]
			.getElementsByTagName("*").length,
		
		// Make sure that link elements get serialized correctly by innerHTML
		// This requires a wrapper element in IE
		htmlSerialize: !!div.getElementsByTagName("link").length,
		
		// Get the style information from getAttribute
		// (IE uses .cssText insted)
		style: /red/.test( a.getAttribute("style") ),
		
		// Make sure that URLs aren't manipulated
		// (IE normalizes it by default)
		hrefNormalized: a.getAttribute("href") === "/a",
		
		// Make sure that element opacity exists
		// (IE uses filter instead)
		opacity: a.style.opacity === "0.5",
		
		// Verify style float existence
		// (IE uses styleFloat instead of cssFloat)
		cssFloat: !!a.style.cssFloat,

		// Will be defined later
		scriptEval: false,
		noCloneEvent: true,
		boxModel: null
	};
	
	script.type = "text/javascript";
	try {
		script.appendChild( document.createTextNode( "window." + id + "=1;" ) );
	} catch(e){}

	root.insertBefore( script, root.firstChild );
	
	// Make sure that the execution of code works by injecting a script
	// tag with appendChild/createTextNode
	// (IE doesn't support this, fails, and uses .text instead)
	if ( window[ id ] ) {
		jQuery.support.scriptEval = true;
		delete window[ id ];
	}

	root.removeChild( script );

	if ( div.attachEvent && div.fireEvent ) {
		div.attachEvent("onclick", function(){
			// Cloning a node shouldn't copy over any
			// bound event handlers (IE does this)
			jQuery.support.noCloneEvent = false;
			div.detachEvent("onclick", arguments.callee);
		});
		div.cloneNode(true).fireEvent("onclick");
	}

	// Figure out if the W3C box model works as expected
	// document.body must exist before we can do this
	jQuery(function(){
		var div = document.createElement("div");
		div.style.width = div.style.paddingLeft = "1px";

		document.body.appendChild( div );
		jQuery.boxModel = jQuery.support.boxModel = div.offsetWidth === 2;
		document.body.removeChild( div ).style.display = 'none';
	});
})();

var styleFloat = jQuery.support.cssFloat ? "cssFloat" : "styleFloat";

jQuery.props = {
	"for": "htmlFor",
	"class": "className",
	"float": styleFloat,
	cssFloat: styleFloat,
	styleFloat: styleFloat,
	readonly: "readOnly",
	maxlength: "maxLength",
	cellspacing: "cellSpacing",
	rowspan: "rowSpan",
	tabindex: "tabIndex"
};
jQuery.fn.extend({
	// Keep a copy of the old load
	_load: jQuery.fn.load,

	load: function( url, params, callback ) {
		if ( typeof url !== "string" )
			return this._load( url );

		var off = url.indexOf(" ");
		if ( off >= 0 ) {
			var selector = url.slice(off, url.length);
			url = url.slice(0, off);
		}

		// Default to a GET request
		var type = "GET";

		// If the second parameter was provided
		if ( params )
			// If it's a function
			if ( jQuery.isFunction( params ) ) {
				// We assume that it's the callback
				callback = params;
				params = null;

			// Otherwise, build a param string
			} else if( typeof params === "object" ) {
				params = jQuery.param( params );
				type = "POST";
			}

		var self = this;

		// Request the remote document
		jQuery.ajax({
			url: url,
			type: type,
			dataType: "html",
			data: params,
			complete: function(res, status){
				// If successful, inject the HTML into all the matched elements
				if ( status == "success" || status == "notmodified" )
					// See if a selector was specified
					self.html( selector ?
						// Create a dummy div to hold the results
						jQuery("<div/>")
							// inject the contents of the document in, removing the scripts
							// to avoid any 'Permission Denied' errors in IE
							.append(res.responseText.replace(/<script(.|\s)*?\/script>/g, ""))

							// Locate the specified elements
							.find(selector) :

						// If not, just inject the full result
						res.responseText );

				if( callback )
					self.each( callback, [res.responseText, status, res] );
			}
		});
		return this;
	},

	serialize: function() {
		return jQuery.param(this.serializeArray());
	},
	serializeArray: function() {
		return this.map(function(){
			return this.elements ? jQuery.makeArray(this.elements) : this;
		})
		.filter(function(){
			return this.name && !this.disabled &&
				(this.checked || /select|textarea/i.test(this.nodeName) ||
					/text|hidden|password|search/i.test(this.type));
		})
		.map(function(i, elem){
			var val = jQuery(this).val();
			return val == null ? null :
				jQuery.isArray(val) ?
					jQuery.map( val, function(val, i){
						return {name: elem.name, value: val};
					}) :
					{name: elem.name, value: val};
		}).get();
	}
});

// Attach a bunch of functions for handling common AJAX events
jQuery.each( "ajaxStart,ajaxStop,ajaxComplete,ajaxError,ajaxSuccess,ajaxSend".split(","), function(i,o){
	jQuery.fn[o] = function(f){
		return this.bind(o, f);
	};
});

var jsc = now();

jQuery.extend({
  
	get: function( url, data, callback, type ) {
		// shift arguments if data argument was ommited
		if ( jQuery.isFunction( data ) ) {
			callback = data;
			data = null;
		}

		return jQuery.ajax({
			type: "GET",
			url: url,
			data: data,
			success: callback,
			dataType: type
		});
	},

	getScript: function( url, callback ) {
		return jQuery.get(url, null, callback, "script");
	},

	getJSON: function( url, data, callback ) {
		return jQuery.get(url, data, callback, "json");
	},

	post: function( url, data, callback, type ) {
		if ( jQuery.isFunction( data ) ) {
			callback = data;
			data = {};
		}

		return jQuery.ajax({
			type: "POST",
			url: url,
			data: data,
			success: callback,
			dataType: type
		});
	},

	ajaxSetup: function( settings ) {
		jQuery.extend( jQuery.ajaxSettings, settings );
	},

	ajaxSettings: {
		url: location.href,
		global: true,
		type: "GET",
		contentType: "application/x-www-form-urlencoded",
		processData: true,
		async: true,
		/*
		timeout: 0,
		data: null,
		username: null,
		password: null,
		*/
		// Create the request object; Microsoft failed to properly
		// implement the XMLHttpRequest in IE7, so we use the ActiveXObject when it is available
		// This function can be overriden by calling jQuery.ajaxSetup
		xhr:function(){
			return window.ActiveXObject ? new ActiveXObject("Microsoft.XMLHTTP") : new XMLHttpRequest();
		},
		accepts: {
			xml: "application/xml, text/xml",
			html: "text/html",
			script: "text/javascript, application/javascript",
			json: "application/json, text/javascript",
			text: "text/plain",
			_default: "*/*"
		}
	},

	// Last-Modified header cache for next request
	lastModified: {},

	ajax: function( s ) {
		// Extend the settings, but re-extend 's' so that it can be
		// checked again later (in the test suite, specifically)
		s = jQuery.extend(true, s, jQuery.extend(true, {}, jQuery.ajaxSettings, s));

		var jsonp, jsre = /=\?(&|$)/g, status, data,
			type = s.type.toUpperCase();

		// convert data if not already a string
		if ( s.data && s.processData && typeof s.data !== "string" )
			s.data = jQuery.param(s.data);

		// Handle JSONP Parameter Callbacks
		if ( s.dataType == "jsonp" ) {
			if ( type == "GET" ) {
				if ( !s.url.match(jsre) )
					s.url += (s.url.match(/\?/) ? "&" : "?") + (s.jsonp || "callback") + "=?";
			} else if ( !s.data || !s.data.match(jsre) )
				s.data = (s.data ? s.data + "&" : "") + (s.jsonp || "callback") + "=?";
			s.dataType = "json";
		}

		// Build temporary JSONP function
		if ( s.dataType == "json" && (s.data && s.data.match(jsre) || s.url.match(jsre)) ) {
			jsonp = "jsonp" + jsc++;

			// Replace the =? sequence both in the query string and the data
			if ( s.data )
				s.data = (s.data + "").replace(jsre, "=" + jsonp + "$1");
			s.url = s.url.replace(jsre, "=" + jsonp + "$1");

			// We need to make sure
			// that a JSONP style response is executed properly
			s.dataType = "script";

			// Handle JSONP-style loading
			window[ jsonp ] = function(tmp){
				data = tmp;
				success();
				complete();
				// Garbage collect
				window[ jsonp ] = undefined;
				try{ delete window[ jsonp ]; } catch(e){}
				if ( head )
					head.removeChild( script );
			};
		}

		if ( s.dataType == "script" && s.cache == null )
			s.cache = false;

		if ( s.cache === false && type == "GET" ) {
			var ts = now();
			// try replacing _= if it is there
			var ret = s.url.replace(/(\?|&)_=.*?(&|$)/, "$1_=" + ts + "$2");
			// if nothing was replaced, add timestamp to the end
			s.url = ret + ((ret == s.url) ? (s.url.match(/\?/) ? "&" : "?") + "_=" + ts : "");
		}

		// If data is available, append data to url for get requests
		if ( s.data && type == "GET" ) {
			s.url += (s.url.match(/\?/) ? "&" : "?") + s.data;

			// IE likes to send both get and post data, prevent this
			s.data = null;
		}

		// Watch for a new set of requests
		if ( s.global && ! jQuery.active++ )
			jQuery.event.trigger( "ajaxStart" );

		// Matches an absolute URL, and saves the domain
		var parts = /^(\w+:)?\/\/([^\/?#]+)/.exec( s.url );

		// If we're requesting a remote document
		// and trying to load JSON or Script with a GET
		if ( s.dataType == "script" && type == "GET" && parts
			&& ( parts[1] && parts[1] != location.protocol || parts[2] != location.host )){

			var head = document.getElementsByTagName("head")[0];
			var script = document.createElement("script");
			script.src = s.url;
			if (s.scriptCharset)
				script.charset = s.scriptCharset;

			// Handle Script loading
			if ( !jsonp ) {
				var done = false;

				// Attach handlers for all browsers
				script.onload = script.onreadystatechange = function(){
					if ( !done && (!this.readyState ||
							this.readyState == "loaded" || this.readyState == "complete") ) {
						done = true;
						success();
						complete();

						// Handle memory leak in IE
						script.onload = script.onreadystatechange = null;
						head.removeChild( script );
					}
				};
			}

			head.appendChild(script);

			// We handle everything using the script element injection
			return undefined;
		}

		var requestDone = false;

		// Create the request object
		var xhr = s.xhr();

		// Open the socket
		// Passing null username, generates a login popup on Opera (#2865)
		if( s.username )
			xhr.open(type, s.url, s.async, s.username, s.password);
		else
			xhr.open(type, s.url, s.async);

		// Need an extra try/catch for cross domain requests in Firefox 3
		try {
			// Set the correct header, if data is being sent
			if ( s.data )
				xhr.setRequestHeader("Content-Type", s.contentType);

			// Set the If-Modified-Since header, if ifModified mode.
			if ( s.ifModified )
				xhr.setRequestHeader("If-Modified-Since",
					jQuery.lastModified[s.url] || "Thu, 01 Jan 1970 00:00:00 GMT" );

			// Set header so the called script knows that it's an XMLHttpRequest
			xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");

			// Set the Accepts header for the server, depending on the dataType
			xhr.setRequestHeader("Accept", s.dataType && s.accepts[ s.dataType ] ?
				s.accepts[ s.dataType ] + ", */*" :
				s.accepts._default );
		} catch(e){}

		// Allow custom headers/mimetypes and early abort
		if ( s.beforeSend && s.beforeSend(xhr, s) === false ) {
			// Handle the global AJAX counter
			if ( s.global && ! --jQuery.active )
				jQuery.event.trigger( "ajaxStop" );
			// close opended socket
			xhr.abort();
			return false;
		}

		if ( s.global )
			jQuery.event.trigger("ajaxSend", [xhr, s]);

		// Wait for a response to come back
		var onreadystatechange = function(isTimeout){
			// The request was aborted, clear the interval and decrement jQuery.active
			if (xhr.readyState == 0) {
				if (ival) {
					// clear poll interval
					clearInterval(ival);
					ival = null;
					// Handle the global AJAX counter
					if ( s.global && ! --jQuery.active )
						jQuery.event.trigger( "ajaxStop" );
				}
			// The transfer is complete and the data is available, or the request timed out
			} else if ( !requestDone && xhr && (xhr.readyState == 4 || isTimeout == "timeout") ) {
				requestDone = true;

				// clear poll interval
				if (ival) {
					clearInterval(ival);
					ival = null;
				}

				status = isTimeout == "timeout" ? "timeout" :
					!jQuery.httpSuccess( xhr ) ? "error" :
					s.ifModified && jQuery.httpNotModified( xhr, s.url ) ? "notmodified" :
					"success";

				if ( status == "success" ) {
					// Watch for, and catch, XML document parse errors
					try {
						// process the data (runs the xml through httpData regardless of callback)
						data = jQuery.httpData( xhr, s.dataType, s );
					} catch(e) {
						status = "parsererror";
					}
				}

				// Make sure that the request was successful or notmodified
				if ( status == "success" ) {
					// Cache Last-Modified header, if ifModified mode.
					var modRes;
					try {
						modRes = xhr.getResponseHeader("Last-Modified");
					} catch(e) {} // swallow exception thrown by FF if header is not available

					if ( s.ifModified && modRes )
						jQuery.lastModified[s.url] = modRes;

					// JSONP handles its own success callback
					if ( !jsonp )
						success();
				} else
					jQuery.handleError(s, xhr, status);

				// Fire the complete handlers
				complete();

				if ( isTimeout )
					xhr.abort();

				// Stop memory leaks
				if ( s.async )
					xhr = null;
			}
		};

		if ( s.async ) {
			// don't attach the handler to the request, just poll it instead
			var ival = setInterval(onreadystatechange, 13);

			// Timeout checker
			if ( s.timeout > 0 )
				setTimeout(function(){
					// Check to see if the request is still happening
					if ( xhr && !requestDone )
						onreadystatechange( "timeout" );
				}, s.timeout);
		}

		// Send the data
		try {
			xhr.send(s.data);
		} catch(e) {
			jQuery.handleError(s, xhr, null, e);
		}

		// firefox 1.5 doesn't fire statechange for sync requests
		if ( !s.async )
			onreadystatechange();

		function success(){
			// If a local callback was specified, fire it and pass it the data
			if ( s.success )
				s.success( data, status );

			// Fire the global callback
			if ( s.global )
				jQuery.event.trigger( "ajaxSuccess", [xhr, s] );
		}

		function complete(){
			// Process result
			if ( s.complete )
				s.complete(xhr, status);

			// The request was completed
			if ( s.global )
				jQuery.event.trigger( "ajaxComplete", [xhr, s] );

			// Handle the global AJAX counter
			if ( s.global && ! --jQuery.active )
				jQuery.event.trigger( "ajaxStop" );
		}

		// return XMLHttpRequest to allow aborting the request etc.
		return xhr;
	},

	handleError: function( s, xhr, status, e ) {
		// If a local callback was specified, fire it
		if ( s.error ) s.error( xhr, status, e );

		// Fire the global callback
		if ( s.global )
			jQuery.event.trigger( "ajaxError", [xhr, s, e] );
	},

	// Counter for holding the number of active queries
	active: 0,

	// Determines if an XMLHttpRequest was successful or not
	httpSuccess: function( xhr ) {
		try {
			// IE error sometimes returns 1223 when it should be 204 so treat it as success, see #1450
			return !xhr.status && location.protocol == "file:" ||
				( xhr.status >= 200 && xhr.status < 300 ) || xhr.status == 304 || xhr.status == 1223;
		} catch(e){}
		return false;
	},

	// Determines if an XMLHttpRequest returns NotModified
	httpNotModified: function( xhr, url ) {
		try {
			var xhrRes = xhr.getResponseHeader("Last-Modified");

			// Firefox always returns 200. check Last-Modified date
			return xhr.status == 304 || xhrRes == jQuery.lastModified[url];
		} catch(e){}
		return false;
	},

	httpData: function( xhr, type, s ) {
		var ct = xhr.getResponseHeader("content-type"),
			xml = type == "xml" || !type && ct && ct.indexOf("xml") >= 0,
			data = xml ? xhr.responseXML : xhr.responseText;

		if ( xml && data.documentElement.tagName == "parsererror" )
			throw "parsererror";
			
		// Allow a pre-filtering function to sanitize the response
		// s != null is checked to keep backwards compatibility
		if( s && s.dataFilter )
			data = s.dataFilter( data, type );

		// The filter can actually parse the response
		if( typeof data === "string" ){

			// If the type is "script", eval it in global context
			if ( type == "script" )
				jQuery.globalEval( data );

			// Get the JavaScript object, if JSON is used.
			if ( type == "json" )
				data = window["eval"]("(" + data + ")");
		}
		
		return data;
	},

	// Serialize an array of form elements or a set of
	// key/values into a query string
	param: function( a ) {
		var s = [ ];

		function add( key, value ){
			s[ s.length ] = encodeURIComponent(key) + '=' + encodeURIComponent(value);
		};

		// If an array was passed in, assume that it is an array
		// of form elements
		if ( jQuery.isArray(a) || a.jquery )
			// Serialize the form elements
			jQuery.each( a, function(){
				add( this.name, this.value );
			});

		// Otherwise, assume that it's an object of key/value pairs
		else
			// Serialize the key/values
			for ( var j in a )
				// If the value is an array then the key names need to be repeated
				if ( jQuery.isArray(a[j]) )
					jQuery.each( a[j], function(){
						add( j, this );
					});
				else
					add( j, jQuery.isFunction(a[j]) ? a[j]() : a[j] );

		// Return the resulting serialization
		return s.join("&").replace(/%20/g, "+");
	}

});
var elemdisplay = {},
	timerId,
	fxAttrs = [
		// height animations
		[ "height", "marginTop", "marginBottom", "paddingTop", "paddingBottom" ],
		// width animations
		[ "width", "marginLeft", "marginRight", "paddingLeft", "paddingRight" ],
		// opacity animations
		[ "opacity" ]
	];

function genFx( type, num ){
	var obj = {};
	jQuery.each( fxAttrs.concat.apply([], fxAttrs.slice(0,num)), function(){
		obj[ this ] = type;
	});
	return obj;
}

jQuery.fn.extend({
	show: function(speed,callback){
		if ( speed ) {
			return this.animate( genFx("show", 3), speed, callback);
		} else {
			for ( var i = 0, l = this.length; i < l; i++ ){
				var old = jQuery.data(this[i], "olddisplay");
				
				this[i].style.display = old || "";
				
				if ( jQuery.css(this[i], "display") === "none" ) {
					var tagName = this[i].tagName, display;
					
					if ( elemdisplay[ tagName ] ) {
						display = elemdisplay[ tagName ];
					} else {
						var elem = jQuery("<" + tagName + " />").appendTo("body");
						
						display = elem.css("display");
						if ( display === "none" )
							display = "block";
						
						elem.remove();
						
						elemdisplay[ tagName ] = display;
					}
					
					jQuery.data(this[i], "olddisplay", display);
				}
			}

			// Set the display of the elements in a second loop
			// to avoid the constant reflow
			for ( var i = 0, l = this.length; i < l; i++ ){
				this[i].style.display = jQuery.data(this[i], "olddisplay") || "";
			}
			
			return this;
		}
	},

	hide: function(speed,callback){
		if ( speed ) {
			return this.animate( genFx("hide", 3), speed, callback);
		} else {
			for ( var i = 0, l = this.length; i < l; i++ ){
				var old = jQuery.data(this[i], "olddisplay");
				if ( !old && old !== "none" )
					jQuery.data(this[i], "olddisplay", jQuery.css(this[i], "display"));
			}

			// Set the display of the elements in a second loop
			// to avoid the constant reflow
			for ( var i = 0, l = this.length; i < l; i++ ){
				this[i].style.display = "none";
			}

			return this;
		}
	},

	// Save the old toggle function
	_toggle: jQuery.fn.toggle,

	toggle: function( fn, fn2 ){
		var bool = typeof fn === "boolean";

		return jQuery.isFunction(fn) && jQuery.isFunction(fn2) ?
			this._toggle.apply( this, arguments ) :
			fn == null || bool ?
				this.each(function(){
					var state = bool ? fn : jQuery(this).is(":hidden");
					jQuery(this)[ state ? "show" : "hide" ]();
				}) :
				this.animate(genFx("toggle", 3), fn, fn2);
	},

	fadeTo: function(speed,to,callback){
		return this.animate({opacity: to}, speed, callback);
	},

	animate: function( prop, speed, easing, callback ) {
		var optall = jQuery.speed(speed, easing, callback);

		return this[ optall.queue === false ? "each" : "queue" ](function(){
		
			var opt = jQuery.extend({}, optall), p,
				hidden = this.nodeType == 1 && jQuery(this).is(":hidden"),
				self = this;
	
			for ( p in prop ) {
				if ( prop[p] == "hide" && hidden || prop[p] == "show" && !hidden )
					return opt.complete.call(this);

				if ( ( p == "height" || p == "width" ) && this.style ) {
					// Store display property
					opt.display = jQuery.css(this, "display");

					// Make sure that nothing sneaks out
					opt.overflow = this.style.overflow;
				}
			}

			if ( opt.overflow != null )
				this.style.overflow = "hidden";

			opt.curAnim = jQuery.extend({}, prop);

			jQuery.each( prop, function(name, val){
				var e = new jQuery.fx( self, opt, name );

				if ( /toggle|show|hide/.test(val) )
					e[ val == "toggle" ? hidden ? "show" : "hide" : val ]( prop );
				else {
					var parts = val.toString().match(/^([+-]=)?([\d+-.]+)(.*)$/),
						start = e.cur(true) || 0;

					if ( parts ) {
						var end = parseFloat(parts[2]),
							unit = parts[3] || "px";

						// We need to compute starting value
						if ( unit != "px" ) {
							self.style[ name ] = (end || 1) + unit;
							start = ((end || 1) / e.cur(true)) * start;
							self.style[ name ] = start + unit;
						}

						// If a +=/-= token was provided, we're doing a relative animation
						if ( parts[1] )
							end = ((parts[1] == "-=" ? -1 : 1) * end) + start;

						e.custom( start, end, unit );
					} else
						e.custom( start, val, "" );
				}
			});

			// For JS strict compliance
			return true;
		});
	},

	stop: function(clearQueue, gotoEnd){
		var timers = jQuery.timers;

		if (clearQueue)
			this.queue([]);

		this.each(function(){
			// go in reverse order so anything added to the queue during the loop is ignored
			for ( var i = timers.length - 1; i >= 0; i-- )
				if ( timers[i].elem == this ) {
					if (gotoEnd)
						// force the next step to be the last
						timers[i](true);
					timers.splice(i, 1);
				}
		});

		// start the next in the queue if the last step wasn't forced
		if (!gotoEnd)
			this.dequeue();

		return this;
	}

});

// Generate shortcuts for custom animations
jQuery.each({
	slideDown: genFx("show", 1),
	slideUp: genFx("hide", 1),
	slideToggle: genFx("toggle", 1),
	fadeIn: { opacity: "show" },
	fadeOut: { opacity: "hide" }
}, function( name, props ){
	jQuery.fn[ name ] = function( speed, callback ){
		return this.animate( props, speed, callback );
	};
});

jQuery.extend({

	speed: function(speed, easing, fn) {
		var opt = typeof speed === "object" ? speed : {
			complete: fn || !fn && easing ||
				jQuery.isFunction( speed ) && speed,
			duration: speed,
			easing: fn && easing || easing && !jQuery.isFunction(easing) && easing
		};

		opt.duration = jQuery.fx.off ? 0 : typeof opt.duration === "number" ? opt.duration :
			jQuery.fx.speeds[opt.duration] || jQuery.fx.speeds._default;

		// Queueing
		opt.old = opt.complete;
		opt.complete = function(){
			if ( opt.queue !== false )
				jQuery(this).dequeue();
			if ( jQuery.isFunction( opt.old ) )
				opt.old.call( this );
		};

		return opt;
	},

	easing: {
		linear: function( p, n, firstNum, diff ) {
			return firstNum + diff * p;
		},
		swing: function( p, n, firstNum, diff ) {
			return ((-Math.cos(p*Math.PI)/2) + 0.5) * diff + firstNum;
		}
	},

	timers: [],

	fx: function( elem, options, prop ){
		this.options = options;
		this.elem = elem;
		this.prop = prop;

		if ( !options.orig )
			options.orig = {};
	}

});

jQuery.fx.prototype = {

	// Simple function for setting a style value
	update: function(){
		if ( this.options.step )
			this.options.step.call( this.elem, this.now, this );

		(jQuery.fx.step[this.prop] || jQuery.fx.step._default)( this );

		// Set display property to block for height/width animations
		if ( ( this.prop == "height" || this.prop == "width" ) && this.elem.style )
			this.elem.style.display = "block";
	},

	// Get the current size
	cur: function(force){
		if ( this.elem[this.prop] != null && (!this.elem.style || this.elem.style[this.prop] == null) )
			return this.elem[ this.prop ];

		var r = parseFloat(jQuery.css(this.elem, this.prop, force));
		return r && r > -10000 ? r : parseFloat(jQuery.curCSS(this.elem, this.prop)) || 0;
	},

	// Start an animation from one number to another
	custom: function(from, to, unit){
		this.startTime = now();
		this.start = from;
		this.end = to;
		this.unit = unit || this.unit || "px";
		this.now = this.start;
		this.pos = this.state = 0;

		var self = this;
		function t(gotoEnd){
			return self.step(gotoEnd);
		}

		t.elem = this.elem;

		if ( t() && jQuery.timers.push(t) && !timerId ) {
			timerId = setInterval(function(){
				var timers = jQuery.timers;

				for ( var i = 0; i < timers.length; i++ )
					if ( !timers[i]() )
						timers.splice(i--, 1);

				if ( !timers.length ) {
					clearInterval( timerId );
					timerId = undefined;
				}
			}, 13);
		}
	},

	// Simple 'show' function
	show: function(){
		// Remember where we started, so that we can go back to it later
		this.options.orig[this.prop] = jQuery.attr( this.elem.style, this.prop );
		this.options.show = true;

		// Begin the animation
		// Make sure that we start at a small width/height to avoid any
		// flash of content
		this.custom(this.prop == "width" || this.prop == "height" ? 1 : 0, this.cur());

		// Start by showing the element
		jQuery(this.elem).show();
	},

	// Simple 'hide' function
	hide: function(){
		// Remember where we started, so that we can go back to it later
		this.options.orig[this.prop] = jQuery.attr( this.elem.style, this.prop );
		this.options.hide = true;

		// Begin the animation
		this.custom(this.cur(), 0);
	},

	// Each step of an animation
	step: function(gotoEnd){
		var t = now();

		if ( gotoEnd || t >= this.options.duration + this.startTime ) {
			this.now = this.end;
			this.pos = this.state = 1;
			this.update();

			this.options.curAnim[ this.prop ] = true;

			var done = true;
			for ( var i in this.options.curAnim )
				if ( this.options.curAnim[i] !== true )
					done = false;

			if ( done ) {
				if ( this.options.display != null ) {
					// Reset the overflow
					this.elem.style.overflow = this.options.overflow;

					// Reset the display
					this.elem.style.display = this.options.display;
					if ( jQuery.css(this.elem, "display") == "none" )
						this.elem.style.display = "block";
				}

				// Hide the element if the "hide" operation was done
				if ( this.options.hide )
					jQuery(this.elem).hide();

				// Reset the properties, if the item has been hidden or shown
				if ( this.options.hide || this.options.show )
					for ( var p in this.options.curAnim )
						jQuery.attr(this.elem.style, p, this.options.orig[p]);
					
				// Execute the complete function
				this.options.complete.call( this.elem );
			}

			return false;
		} else {
			var n = t - this.startTime;
			this.state = n / this.options.duration;

			// Perform the easing function, defaults to swing
			this.pos = jQuery.easing[this.options.easing || (jQuery.easing.swing ? "swing" : "linear")](this.state, n, 0, 1, this.options.duration);
			this.now = this.start + ((this.end - this.start) * this.pos);

			// Perform the next step of the animation
			this.update();
		}

		return true;
	}

};

jQuery.extend( jQuery.fx, {
	speeds:{
		slow: 600,
 		fast: 200,
 		// Default speed
 		_default: 400
	},
	step: {

		opacity: function(fx){
			jQuery.attr(fx.elem.style, "opacity", fx.now);
		},

		_default: function(fx){
			if ( fx.elem.style && fx.elem.style[ fx.prop ] != null )
				fx.elem.style[ fx.prop ] = fx.now + fx.unit;
			else
				fx.elem[ fx.prop ] = fx.now;
		}
	}
});
if ( document.documentElement["getBoundingClientRect"] )
	jQuery.fn.offset = function() {
		if ( !this[0] ) return { top: 0, left: 0 };
		if ( this[0] === this[0].ownerDocument.body ) return jQuery.offset.bodyOffset( this[0] );
		var box  = this[0].getBoundingClientRect(), doc = this[0].ownerDocument, body = doc.body, docElem = doc.documentElement,
			clientTop = docElem.clientTop || body.clientTop || 0, clientLeft = docElem.clientLeft || body.clientLeft || 0,
			top  = box.top  + (self.pageYOffset || jQuery.boxModel && docElem.scrollTop  || body.scrollTop ) - clientTop,
			left = box.left + (self.pageXOffset || jQuery.boxModel && docElem.scrollLeft || body.scrollLeft) - clientLeft;
		return { top: top, left: left };
	};
else 
	jQuery.fn.offset = function() {
		if ( !this[0] ) return { top: 0, left: 0 };
		if ( this[0] === this[0].ownerDocument.body ) return jQuery.offset.bodyOffset( this[0] );
		jQuery.offset.initialized || jQuery.offset.initialize();

		var elem = this[0], offsetParent = elem.offsetParent, prevOffsetParent = elem,
			doc = elem.ownerDocument, computedStyle, docElem = doc.documentElement,
			body = doc.body, defaultView = doc.defaultView,
			prevComputedStyle = defaultView.getComputedStyle(elem, null),
			top = elem.offsetTop, left = elem.offsetLeft;

		while ( (elem = elem.parentNode) && elem !== body && elem !== docElem ) {
			computedStyle = defaultView.getComputedStyle(elem, null);
			top -= elem.scrollTop, left -= elem.scrollLeft;
			if ( elem === offsetParent ) {
				top += elem.offsetTop, left += elem.offsetLeft;
				if ( jQuery.offset.doesNotAddBorder && !(jQuery.offset.doesAddBorderForTableAndCells && /^t(able|d|h)$/i.test(elem.tagName)) )
					top  += parseInt( computedStyle.borderTopWidth,  10) || 0,
					left += parseInt( computedStyle.borderLeftWidth, 10) || 0;
				prevOffsetParent = offsetParent, offsetParent = elem.offsetParent;
			}
			if ( jQuery.offset.subtractsBorderForOverflowNotVisible && computedStyle.overflow !== "visible" )
				top  += parseInt( computedStyle.borderTopWidth,  10) || 0,
				left += parseInt( computedStyle.borderLeftWidth, 10) || 0;
			prevComputedStyle = computedStyle;
		}

		if ( prevComputedStyle.position === "relative" || prevComputedStyle.position === "static" )
			top  += body.offsetTop,
			left += body.offsetLeft;

		if ( prevComputedStyle.position === "fixed" )
			top  += Math.max(docElem.scrollTop, body.scrollTop),
			left += Math.max(docElem.scrollLeft, body.scrollLeft);

		return { top: top, left: left };
	};

jQuery.offset = {
	initialize: function() {
		if ( this.initialized ) return;
		var body = document.body, container = document.createElement('div'), innerDiv, checkDiv, table, td, rules, prop, bodyMarginTop = body.style.marginTop,
			html = '<div style="position:absolute;top:0;left:0;margin:0;border:5px solid #000;padding:0;width:1px;height:1px;"><div></div></div><table style="position:absolute;top:0;left:0;margin:0;border:5px solid #000;padding:0;width:1px;height:1px;" cellpadding="0" cellspacing="0"><tr><td></td></tr></table>';

		rules = { position: 'absolute', top: 0, left: 0, margin: 0, border: 0, width: '1px', height: '1px', visibility: 'hidden' };
		for ( prop in rules ) container.style[prop] = rules[prop];

		container.innerHTML = html;
		body.insertBefore(container, body.firstChild);
		innerDiv = container.firstChild, checkDiv = innerDiv.firstChild, td = innerDiv.nextSibling.firstChild.firstChild;

		this.doesNotAddBorder = (checkDiv.offsetTop !== 5);
		this.doesAddBorderForTableAndCells = (td.offsetTop === 5);

		innerDiv.style.overflow = 'hidden', innerDiv.style.position = 'relative';
		this.subtractsBorderForOverflowNotVisible = (checkDiv.offsetTop === -5);

		body.style.marginTop = '1px';
		this.doesNotIncludeMarginInBodyOffset = (body.offsetTop === 0);
		body.style.marginTop = bodyMarginTop;

		body.removeChild(container);
		this.initialized = true;
	},

	bodyOffset: function(body) {
		jQuery.offset.initialized || jQuery.offset.initialize();
		var top = body.offsetTop, left = body.offsetLeft;
		if ( jQuery.offset.doesNotIncludeMarginInBodyOffset )
			top  += parseInt( jQuery.curCSS(body, 'marginTop',  true), 10 ) || 0,
			left += parseInt( jQuery.curCSS(body, 'marginLeft', true), 10 ) || 0;
		return { top: top, left: left };
	}
};


jQuery.fn.extend({
	position: function() {
		var left = 0, top = 0, results;

		if ( this[0] ) {
			// Get *real* offsetParent
			var offsetParent = this.offsetParent(),

			// Get correct offsets
			offset       = this.offset(),
			parentOffset = /^body|html$/i.test(offsetParent[0].tagName) ? { top: 0, left: 0 } : offsetParent.offset();

			// Subtract element margins
			// note: when an element has margin: auto the offsetLeft and marginLeft 
			// are the same in Safari causing offset.left to incorrectly be 0
			offset.top  -= num( this, 'marginTop'  );
			offset.left -= num( this, 'marginLeft' );

			// Add offsetParent borders
			parentOffset.top  += num( offsetParent, 'borderTopWidth'  );
			parentOffset.left += num( offsetParent, 'borderLeftWidth' );

			// Subtract the two offsets
			results = {
				top:  offset.top  - parentOffset.top,
				left: offset.left - parentOffset.left
			};
		}

		return results;
	},

	offsetParent: function() {
		var offsetParent = this[0].offsetParent || document.body;
		while ( offsetParent && (!/^body|html$/i.test(offsetParent.tagName) && jQuery.css(offsetParent, 'position') == 'static') )
			offsetParent = offsetParent.offsetParent;
		return jQuery(offsetParent);
	}
});


// Create scrollLeft and scrollTop methods
jQuery.each( ['Left', 'Top'], function(i, name) {
	var method = 'scroll' + name;
	
	jQuery.fn[ method ] = function(val) {
		if (!this[0]) return null;

		return val !== undefined ?

			// Set the scroll offset
			this.each(function() {
				this == window || this == document ?
					window.scrollTo(
						!i ? val : jQuery(window).scrollLeft(),
						 i ? val : jQuery(window).scrollTop()
					) :
					this[ method ] = val;
			}) :

			// Return the scroll offset
			this[0] == window || this[0] == document ?
				self[ i ? 'pageYOffset' : 'pageXOffset' ] ||
					jQuery.boxModel && document.documentElement[ method ] ||
					document.body[ method ] :
				this[0][ method ];
	};
});
// Create innerHeight, innerWidth, outerHeight and outerWidth methods
jQuery.each([ "Height", "Width" ], function(i, name){

	var tl = i ? "Left"  : "Top",  // top or left
		br = i ? "Right" : "Bottom", // bottom or right
		lower = name.toLowerCase();

	// innerHeight and innerWidth
	jQuery.fn["inner" + name] = function(){
		return this[0] ?
			jQuery.css( this[0], lower, false, "padding" ) :
			null;
	};

	// outerHeight and outerWidth
	jQuery.fn["outer" + name] = function(margin) {
		return this[0] ?
			jQuery.css( this[0], lower, false, margin ? "margin" : "border" ) :
			null;
	};
	
	var type = name.toLowerCase();

	jQuery.fn[ type ] = function( size ) {
		// Get window width or height
		return this[0] == window ?
			// Everyone else use document.documentElement or document.body depending on Quirks vs Standards mode
			document.compatMode == "CSS1Compat" && document.documentElement[ "client" + name ] ||
			document.body[ "client" + name ] :

			// Get document width or height
			this[0] == document ?
				// Either scroll[Width/Height] or offset[Width/Height], whichever is greater
				Math.max(
					document.documentElement["client" + name],
					document.body["scroll" + name], document.documentElement["scroll" + name],
					document.body["offset" + name], document.documentElement["offset" + name]
				) :

				// Get or set width or height on the element
				size === undefined ?
					// Get width or height on the element
					(this.length ? jQuery.css( this[0], type ) : null) :

					// Set the width or height on the element (default to pixels if value is unitless)
					this.css( type, typeof size === "string" ? size : size + "px" );
	};

});
})();


;(function($){$.ui={plugin:{add:function(module,option,set){var proto=$.ui[module].prototype;for(var i in set){proto.plugins[i]=proto.plugins[i]||[];proto.plugins[i].push([option,set[i]]);}},call:function(instance,name,args){var set=instance.plugins[name];if(!set){return;}
for(var i=0;i<set.length;i++){if(instance.options[set[i][0]]){set[i][1].apply(instance.element,args);}}}},cssCache:{},css:function(name){if($.ui.cssCache[name]){return $.ui.cssCache[name];}
var tmp=$('<div class="ui-gen">').addClass(name).css({position:'absolute',top:'-5000px',left:'-5000px',display:'block'}).appendTo('body');$.ui.cssCache[name]=!!((!(/auto|default/).test(tmp.css('cursor'))||(/^[1-9]/).test(tmp.css('height'))||(/^[1-9]/).test(tmp.css('width'))||!(/none/).test(tmp.css('backgroundImage'))||!(/transparent|rgba\(0, 0, 0, 0\)/).test(tmp.css('backgroundColor'))));try{$('body').get(0).removeChild(tmp.get(0));}catch(e){}
return $.ui.cssCache[name];},disableSelection:function(e){e.unselectable="on";e.onselectstart=function(){return false;};if(e.style){e.style.MozUserSelect="none";}},enableSelection:function(e){e.unselectable="off";e.onselectstart=function(){return true;};if(e.style){e.style.MozUserSelect="";}},hasScroll:function(e,a){var scroll=/top/.test(a||"top")?'scrollTop':'scrollLeft',has=false;if(e[scroll]>0)return true;e[scroll]=1;has=e[scroll]>0?true:false;e[scroll]=0;return has;}};var _remove=$.fn.remove;$.fn.remove=function(){$("*",this).add(this).trigger("remove");return _remove.apply(this,arguments);};function getter(namespace,plugin,method){var methods=$[namespace][plugin].getter||[];methods=(typeof methods=="string"?methods.split(/,?\s+/):methods);return($.inArray(method,methods)!=-1);}
$.widget=function(name,prototype){var namespace=name.split(".")[0];name=name.split(".")[1];$.fn[name]=function(options){var isMethodCall=(typeof options=='string'),args=Array.prototype.slice.call(arguments,1);if(isMethodCall&&getter(namespace,name,options)){var instance=$.data(this[0],name);return(instance?instance[options].apply(instance,args):undefined);}
return this.each(function(){var instance=$.data(this,name);if(isMethodCall&&instance&&$.isFunction(instance[options])){instance[options].apply(instance,args);}else if(!isMethodCall){$.data(this,name,new $[namespace][name](this,options));}});};$[namespace][name]=function(element,options){var self=this;this.widgetName=name;this.widgetBaseClass=namespace+'-'+name;this.options=$.extend({},$.widget.defaults,$[namespace][name].defaults,options);this.element=$(element).bind('setData.'+name,function(e,key,value){return self.setData(key,value);}).bind('getData.'+name,function(e,key){return self.getData(key);}).bind('remove',function(){return self.destroy();});this.init();};$[namespace][name].prototype=$.extend({},$.widget.prototype,prototype);};$.widget.prototype={init:function(){},destroy:function(){this.element.removeData(this.widgetName);},getData:function(key){return this.options[key];},setData:function(key,value){this.options[key]=value;if(key=='disabled'){this.element[value?'addClass':'removeClass'](this.widgetBaseClass+'-disabled');}},enable:function(){this.setData('disabled',false);},disable:function(){this.setData('disabled',true);}};$.widget.defaults={disabled:false};$.ui.mouse={mouseInit:function(){var self=this;this.element.bind('mousedown.'+this.widgetName,function(e){return self.mouseDown(e);});if($.browser.msie){this._mouseUnselectable=this.element.attr('unselectable');this.element.attr('unselectable','on');}
this.started=false;},mouseDestroy:function(){this.element.unbind('.'+this.widgetName);($.browser.msie&&this.element.attr('unselectable',this._mouseUnselectable));},mouseDown:function(e){(this._mouseStarted&&this.mouseUp(e));this._mouseDownEvent=e;var self=this,btnIsLeft=(e.which==1),elIsCancel=(typeof this.options.cancel=="string"?$(e.target).is(this.options.cancel):false);if(!btnIsLeft||elIsCancel||!this.mouseCapture(e)){return true;}
this._mouseDelayMet=!this.options.delay;if(!this._mouseDelayMet){this._mouseDelayTimer=setTimeout(function(){self._mouseDelayMet=true;},this.options.delay);}
if(this.mouseDistanceMet(e)&&this.mouseDelayMet(e)){this._mouseStarted=(this.mouseStart(e)!==false);if(!this._mouseStarted){e.preventDefault();return true;}}
this._mouseMoveDelegate=function(e){return self.mouseMove(e);};this._mouseUpDelegate=function(e){return self.mouseUp(e);};$(document).bind('mousemove.'+this.widgetName,this._mouseMoveDelegate).bind('mouseup.'+this.widgetName,this._mouseUpDelegate);return false;},mouseMove:function(e){if($.browser.msie&&!e.button){return this.mouseUp(e);}
if(this._mouseStarted){this.mouseDrag(e);return false;}
if(this.mouseDistanceMet(e)&&this.mouseDelayMet(e)){this._mouseStarted=(this.mouseStart(this._mouseDownEvent,e)!==false);(this._mouseStarted?this.mouseDrag(e):this.mouseUp(e));}
return!this._mouseStarted;},mouseUp:function(e){$(document).unbind('mousemove.'+this.widgetName,this._mouseMoveDelegate).unbind('mouseup.'+this.widgetName,this._mouseUpDelegate);if(this._mouseStarted){this._mouseStarted=false;this.mouseStop(e);}
return false;},mouseDistanceMet:function(e){return(Math.max(Math.abs(this._mouseDownEvent.pageX-e.pageX),Math.abs(this._mouseDownEvent.pageY-e.pageY))>=this.options.distance);},mouseDelayMet:function(e){return this._mouseDelayMet;},mouseStart:function(e){},mouseDrag:function(e){},mouseStop:function(e){},mouseCapture:function(e){return true;}};$.ui.mouse.defaults={cancel:null,distance:1,delay:0};})(jQuery);(function($){$.widget("ui.draggable",$.extend($.ui.mouse,{init:function(){var o=this.options;if(o.helper=='original'&&!(/(relative|absolute|fixed)/).test(this.element.css('position')))
this.element.css('position','relative');this.element.addClass('ui-draggable');(o.disabled&&this.element.addClass('ui-draggable-disabled'));this.mouseInit();},mouseStart:function(e){var o=this.options;if(this.helper||o.disabled||$(e.target).is('.ui-resizable-handle'))return false;var handle=!this.options.handle||!$(this.options.handle,this.element).length?true:false;$(this.options.handle,this.element).find("*").andSelf().each(function(){if(this==e.target)handle=true;});if(!handle)return false;if($.ui.ddmanager)$.ui.ddmanager.current=this;this.helper=$.isFunction(o.helper)?$(o.helper.apply(this.element[0],[e])):(o.helper=='clone'?this.element.clone():this.element);if(!this.helper.parents('body').length)this.helper.appendTo((o.appendTo=='parent'?this.element[0].parentNode:o.appendTo));if(this.helper[0]!=this.element[0]&&!(/(fixed|absolute)/).test(this.helper.css("position")))this.helper.css("position","absolute");this.margins={left:(parseInt(this.element.css("marginLeft"),10)||0),top:(parseInt(this.element.css("marginTop"),10)||0)};this.cssPosition=this.helper.css("position");this.offset=this.element.offset();this.offset={top:this.offset.top-this.margins.top,left:this.offset.left-this.margins.left};this.offset.click={left:e.pageX-this.offset.left,top:e.pageY-this.offset.top};this.offsetParent=this.helper.offsetParent();var po=this.offsetParent.offset();if(this.offsetParent[0]==document.body&&$.browser.mozilla)po={top:0,left:0};this.offset.parent={top:po.top+(parseInt(this.offsetParent.css("borderTopWidth"),10)||0),left:po.left+(parseInt(this.offsetParent.css("borderLeftWidth"),10)||0)};var p=this.element.position();this.offset.relative=this.cssPosition=="relative"?{top:p.top-(parseInt(this.helper.css("top"),10)||0)+this.offsetParent[0].scrollTop,left:p.left-(parseInt(this.helper.css("left"),10)||0)+this.offsetParent[0].scrollLeft}:{top:0,left:0};this.originalPosition=this.generatePosition(e);this.helperProportions={width:this.helper.outerWidth(),height:this.helper.outerHeight()};if(o.cursorAt){if(o.cursorAt.left!=undefined)this.offset.click.left=o.cursorAt.left+this.margins.left;if(o.cursorAt.right!=undefined)this.offset.click.left=this.helperProportions.width-o.cursorAt.right+this.margins.left;if(o.cursorAt.top!=undefined)this.offset.click.top=o.cursorAt.top+this.margins.top;if(o.cursorAt.bottom!=undefined)this.offset.click.top=this.helperProportions.height-o.cursorAt.bottom+this.margins.top;}
if(o.containment){if(o.containment=='parent')o.containment=this.helper[0].parentNode;if(o.containment=='document'||o.containment=='window')this.containment=[0-this.offset.relative.left-this.offset.parent.left,0-this.offset.relative.top-this.offset.parent.top,$(o.containment=='document'?document:window).width()-this.offset.relative.left-this.offset.parent.left-this.helperProportions.width-this.margins.left-(parseInt(this.element.css("marginRight"),10)||0),($(o.containment=='document'?document:window).height()||document.body.parentNode.scrollHeight)-this.offset.relative.top-this.offset.parent.top-this.helperProportions.height-this.margins.top-(parseInt(this.element.css("marginBottom"),10)||0)];if(!(/^(document|window|parent)$/).test(o.containment)){var ce=$(o.containment)[0];var co=$(o.containment).offset();this.containment=[co.left+(parseInt($(ce).css("borderLeftWidth"),10)||0)-this.offset.relative.left-this.offset.parent.left,co.top+(parseInt($(ce).css("borderTopWidth"),10)||0)-this.offset.relative.top-this.offset.parent.top,co.left+Math.max(ce.scrollWidth,ce.offsetWidth)-(parseInt($(ce).css("borderLeftWidth"),10)||0)-this.offset.relative.left-this.offset.parent.left-this.helperProportions.width-this.margins.left-(parseInt(this.element.css("marginRight"),10)||0),co.top+Math.max(ce.scrollHeight,ce.offsetHeight)-(parseInt($(ce).css("borderTopWidth"),10)||0)-this.offset.relative.top-this.offset.parent.top-this.helperProportions.height-this.margins.top-(parseInt(this.element.css("marginBottom"),10)||0)];}}
this.propagate("start",e);this.helperProportions={width:this.helper.outerWidth(),height:this.helper.outerHeight()};if($.ui.ddmanager&&!o.dropBehaviour)$.ui.ddmanager.prepareOffsets(this,e);this.helper.addClass("ui-draggable-dragging");this.mouseDrag(e);return true;},convertPositionTo:function(d,pos){if(!pos)pos=this.position;var mod=d=="absolute"?1:-1;return{top:(pos.top
+this.offset.relative.top*mod
+this.offset.parent.top*mod
-(this.cssPosition=="fixed"||(this.cssPosition=="absolute"&&this.offsetParent[0]==document.body)?0:this.offsetParent[0].scrollTop)*mod
+(this.cssPosition=="fixed"?$(document).scrollTop():0)*mod
+this.margins.top*mod),left:(pos.left
+this.offset.relative.left*mod
+this.offset.parent.left*mod
-(this.cssPosition=="fixed"||(this.cssPosition=="absolute"&&this.offsetParent[0]==document.body)?0:this.offsetParent[0].scrollLeft)*mod
+(this.cssPosition=="fixed"?$(document).scrollLeft():0)*mod
+this.margins.left*mod)};},generatePosition:function(e){var o=this.options;var position={top:(e.pageY
-this.offset.click.top
-this.offset.relative.top
-this.offset.parent.top
+(this.cssPosition=="fixed"||(this.cssPosition=="absolute"&&this.offsetParent[0]==document.body)?0:this.offsetParent[0].scrollTop)
-(this.cssPosition=="fixed"?$(document).scrollTop():0)),left:(e.pageX
-this.offset.click.left
-this.offset.relative.left
-this.offset.parent.left
+(this.cssPosition=="fixed"||(this.cssPosition=="absolute"&&this.offsetParent[0]==document.body)?0:this.offsetParent[0].scrollLeft)
-(this.cssPosition=="fixed"?$(document).scrollLeft():0))};if(!this.originalPosition)return position;if(this.containment){if(position.left<this.containment[0])position.left=this.containment[0];if(position.top<this.containment[1])position.top=this.containment[1];if(position.left>this.containment[2])position.left=this.containment[2];if(position.top>this.containment[3])position.top=this.containment[3];}
if(o.grid){var top=this.originalPosition.top+Math.round((position.top-this.originalPosition.top)/o.grid[1])*o.grid[1];position.top=this.containment?(!(top<this.containment[1]||top>this.containment[3])?top:(!(top<this.containment[1])?top-o.grid[1]:top+o.grid[1])):top;var left=this.originalPosition.left+Math.round((position.left-this.originalPosition.left)/o.grid[0])*o.grid[0];position.left=this.containment?(!(left<this.containment[0]||left>this.containment[2])?left:(!(left<this.containment[0])?left-o.grid[0]:left+o.grid[0])):left;}
return position;},mouseDrag:function(e){this.position=this.generatePosition(e);this.positionAbs=this.convertPositionTo("absolute");this.position=this.propagate("drag",e)||this.position;if(!this.options.axis||this.options.axis!="y")this.helper[0].style.left=this.position.left+'px';if(!this.options.axis||this.options.axis!="x")this.helper[0].style.top=this.position.top+'px';if($.ui.ddmanager)$.ui.ddmanager.drag(this,e);return false;},mouseStop:function(e){if($.ui.ddmanager&&!this.options.dropBehaviour)
$.ui.ddmanager.drop(this,e);if(this.options.revert){var self=this;$(this.helper).animate(this.originalPosition,parseInt(this.options.revert,10)||500,function(){self.propagate("stop",e);self.clear();});}else{this.propagate("stop",e);this.clear();}
return false;},clear:function(){this.helper.removeClass("ui-draggable-dragging");if(this.options.helper!='original'&&!this.cancelHelperRemoval)this.helper.remove();this.helper=null;this.cancelHelperRemoval=false;},plugins:{},uiHash:function(e){return{helper:this.helper,position:this.position,absolutePosition:this.positionAbs,options:this.options};},propagate:function(n,e){$.ui.plugin.call(this,n,[e,this.uiHash()]);return this.element.triggerHandler(n=="drag"?n:"drag"+n,[e,this.uiHash()],this.options[n]);},destroy:function(){if(!this.element.data('draggable'))return;this.element.removeData("draggable").unbind(".draggable").removeClass('ui-draggable');this.mouseDestroy();}}));$.extend($.ui.draggable,{defaults:{appendTo:"parent",axis:false,cancel:":input",delay:0,distance:1,helper:"original"}});$.ui.plugin.add("draggable","cursor",{start:function(e,ui){var t=$('body');if(t.css("cursor"))ui.options._cursor=t.css("cursor");t.css("cursor",ui.options.cursor);},stop:function(e,ui){if(ui.options._cursor)$('body').css("cursor",ui.options._cursor);}});$.ui.plugin.add("draggable","zIndex",{start:function(e,ui){var t=$(ui.helper);if(t.css("zIndex"))ui.options._zIndex=t.css("zIndex");t.css('zIndex',ui.options.zIndex);},stop:function(e,ui){if(ui.options._zIndex)$(ui.helper).css('zIndex',ui.options._zIndex);}});$.ui.plugin.add("draggable","opacity",{start:function(e,ui){var t=$(ui.helper);if(t.css("opacity"))ui.options._opacity=t.css("opacity");t.css('opacity',ui.options.opacity);},stop:function(e,ui){if(ui.options._opacity)$(ui.helper).css('opacity',ui.options._opacity);}});$.ui.plugin.add("draggable","iframeFix",{start:function(e,ui){$(ui.options.iframeFix===true?"iframe":ui.options.iframeFix).each(function(){$('<div class="ui-draggable-iframeFix" style="background: #fff;"></div>').css({width:this.offsetWidth+"px",height:this.offsetHeight+"px",position:"absolute",opacity:"0.001",zIndex:1000}).css($(this).offset()).appendTo("body");});},stop:function(e,ui){$("div.DragDropIframeFix").each(function(){this.parentNode.removeChild(this);});}});$.ui.plugin.add("draggable","scroll",{start:function(e,ui){var o=ui.options;var i=$(this).data("draggable");o.scrollSensitivity=o.scrollSensitivity||20;o.scrollSpeed=o.scrollSpeed||20;i.overflowY=function(el){do{if(/auto|scroll/.test(el.css('overflow'))||(/auto|scroll/).test(el.css('overflow-y')))return el;el=el.parent();}while(el[0].parentNode);return $(document);}(this);i.overflowX=function(el){do{if(/auto|scroll/.test(el.css('overflow'))||(/auto|scroll/).test(el.css('overflow-x')))return el;el=el.parent();}while(el[0].parentNode);return $(document);}(this);if(i.overflowY[0]!=document&&i.overflowY[0].tagName!='HTML')i.overflowYOffset=i.overflowY.offset();if(i.overflowX[0]!=document&&i.overflowX[0].tagName!='HTML')i.overflowXOffset=i.overflowX.offset();},drag:function(e,ui){var o=ui.options;var i=$(this).data("draggable");if(i.overflowY[0]!=document&&i.overflowY[0].tagName!='HTML'){if((i.overflowYOffset.top+i.overflowY[0].offsetHeight)-e.pageY<o.scrollSensitivity)
i.overflowY[0].scrollTop=i.overflowY[0].scrollTop+o.scrollSpeed;if(e.pageY-i.overflowYOffset.top<o.scrollSensitivity)
i.overflowY[0].scrollTop=i.overflowY[0].scrollTop-o.scrollSpeed;}else{if(e.pageY-$(document).scrollTop()<o.scrollSensitivity)
$(document).scrollTop($(document).scrollTop()-o.scrollSpeed);if($(window).height()-(e.pageY-$(document).scrollTop())<o.scrollSensitivity)
$(document).scrollTop($(document).scrollTop()+o.scrollSpeed);}
if(i.overflowX[0]!=document&&i.overflowX[0].tagName!='HTML'){if((i.overflowXOffset.left+i.overflowX[0].offsetWidth)-e.pageX<o.scrollSensitivity)
i.overflowX[0].scrollLeft=i.overflowX[0].scrollLeft+o.scrollSpeed;if(e.pageX-i.overflowXOffset.left<o.scrollSensitivity)
i.overflowX[0].scrollLeft=i.overflowX[0].scrollLeft-o.scrollSpeed;}else{if(e.pageX-$(document).scrollLeft()<o.scrollSensitivity)
$(document).scrollLeft($(document).scrollLeft()-o.scrollSpeed);if($(window).width()-(e.pageX-$(document).scrollLeft())<o.scrollSensitivity)
$(document).scrollLeft($(document).scrollLeft()+o.scrollSpeed);}}});$.ui.plugin.add("draggable","snap",{start:function(e,ui){var inst=$(this).data("draggable");inst.snapElements=[];$(ui.options.snap===true?'.ui-draggable':ui.options.snap).each(function(){var $t=$(this);var $o=$t.offset();if(this!=inst.element[0])inst.snapElements.push({item:this,width:$t.outerWidth(),height:$t.outerHeight(),top:$o.top,left:$o.left});});},drag:function(e,ui){var inst=$(this).data("draggable");var d=ui.options.snapTolerance||20;var x1=ui.absolutePosition.left,x2=x1+inst.helperProportions.width,y1=ui.absolutePosition.top,y2=y1+inst.helperProportions.height;for(var i=inst.snapElements.length-1;i>=0;i--){var l=inst.snapElements[i].left,r=l+inst.snapElements[i].width,t=inst.snapElements[i].top,b=t+inst.snapElements[i].height;if(!((l-d<x1&&x1<r+d&&t-d<y1&&y1<b+d)||(l-d<x1&&x1<r+d&&t-d<y2&&y2<b+d)||(l-d<x2&&x2<r+d&&t-d<y1&&y1<b+d)||(l-d<x2&&x2<r+d&&t-d<y2&&y2<b+d)))continue;if(ui.options.snapMode!='inner'){var ts=Math.abs(t-y2)<=20;var bs=Math.abs(b-y1)<=20;var ls=Math.abs(l-x2)<=20;var rs=Math.abs(r-x1)<=20;if(ts)ui.position.top=inst.convertPositionTo("relative",{top:t-inst.helperProportions.height,left:0}).top;if(bs)ui.position.top=inst.convertPositionTo("relative",{top:b,left:0}).top;if(ls)ui.position.left=inst.convertPositionTo("relative",{top:0,left:l-inst.helperProportions.width}).left;if(rs)ui.position.left=inst.convertPositionTo("relative",{top:0,left:r}).left;}
if(ui.options.snapMode!='outer'){var ts=Math.abs(t-y1)<=20;var bs=Math.abs(b-y2)<=20;var ls=Math.abs(l-x1)<=20;var rs=Math.abs(r-x2)<=20;if(ts)ui.position.top=inst.convertPositionTo("relative",{top:t,left:0}).top;if(bs)ui.position.top=inst.convertPositionTo("relative",{top:b-inst.helperProportions.height,left:0}).top;if(ls)ui.position.left=inst.convertPositionTo("relative",{top:0,left:l}).left;if(rs)ui.position.left=inst.convertPositionTo("relative",{top:0,left:r-inst.helperProportions.width}).left;}};}});$.ui.plugin.add("draggable","connectToSortable",{start:function(e,ui){var inst=$(this).data("draggable");inst.sortables=[];$(ui.options.connectToSortable).each(function(){if($.data(this,'sortable')){var sortable=$.data(this,'sortable');inst.sortables.push({instance:sortable,shouldRevert:sortable.options.revert});sortable.refreshItems();sortable.propagate("activate",e,inst);}});},stop:function(e,ui){var inst=$(this).data("draggable");$.each(inst.sortables,function(){if(this.instance.isOver){this.instance.isOver=0;inst.cancelHelperRemoval=true;this.instance.cancelHelperRemoval=false;if(this.shouldRevert)this.instance.options.revert=true;this.instance.mouseStop(e);this.instance.element.triggerHandler("sortreceive",[e,$.extend(this.instance.ui(),{sender:inst.element})],this.instance.options["receive"]);this.instance.options.helper=this.instance.options._helper;}else{this.instance.propagate("deactivate",e,inst);}});},drag:function(e,ui){var inst=$(this).data("draggable"),self=this;var checkPos=function(o){var l=o.left,r=l+o.width,t=o.top,b=t+o.height;return(l<(this.positionAbs.left+this.offset.click.left)&&(this.positionAbs.left+this.offset.click.left)<r&&t<(this.positionAbs.top+this.offset.click.top)&&(this.positionAbs.top+this.offset.click.top)<b);};$.each(inst.sortables,function(i){if(checkPos.call(inst,this.instance.containerCache)){if(!this.instance.isOver){this.instance.isOver=1;this.instance.currentItem=$(self).clone().appendTo(this.instance.element).data("sortable-item",true);this.instance.options._helper=this.instance.options.helper;this.instance.options.helper=function(){return ui.helper[0];};e.target=this.instance.currentItem[0];this.instance.mouseCapture(e,true);this.instance.mouseStart(e,true,true);this.instance.offset.click.top=inst.offset.click.top;this.instance.offset.click.left=inst.offset.click.left;this.instance.offset.parent.left-=inst.offset.parent.left-this.instance.offset.parent.left;this.instance.offset.parent.top-=inst.offset.parent.top-this.instance.offset.parent.top;inst.propagate("toSortable",e);}
if(this.instance.currentItem)this.instance.mouseDrag(e);}else{if(this.instance.isOver){this.instance.isOver=0;this.instance.cancelHelperRemoval=true;this.instance.options.revert=false;this.instance.mouseStop(e,true);this.instance.options.helper=this.instance.options._helper;this.instance.currentItem.remove();if(this.instance.placeholder)this.instance.placeholder.remove();inst.propagate("fromSortable",e);}};});}});$.ui.plugin.add("draggable","stack",{start:function(e,ui){var group=$.makeArray($(ui.options.stack.group)).sort(function(a,b){return(parseInt($(a).css("zIndex"),10)||ui.options.stack.min)-(parseInt($(b).css("zIndex"),10)||ui.options.stack.min);});$(group).each(function(i){this.style.zIndex=ui.options.stack.min+i;});this[0].style.zIndex=ui.options.stack.min+group.length;}});})(jQuery);(function($){$.widget("ui.droppable",{init:function(){this.element.addClass("ui-droppable");this.isover=0;this.isout=1;var o=this.options,accept=o.accept;o=$.extend(o,{accept:o.accept&&o.accept.constructor==Function?o.accept:function(d){return $(d).is(accept);}});this.proportions={width:this.element.outerWidth(),height:this.element.outerHeight()};$.ui.ddmanager.droppables.push(this);},plugins:{},ui:function(c){return{draggable:(c.currentItem||c.element),helper:c.helper,position:c.position,absolutePosition:c.positionAbs,options:this.options,element:this.element};},destroy:function(){var drop=$.ui.ddmanager.droppables;for(var i=0;i<drop.length;i++)
if(drop[i]==this)
drop.splice(i,1);this.element.removeClass("ui-droppable ui-droppable-disabled").removeData("droppable").unbind(".droppable");},over:function(e){var draggable=$.ui.ddmanager.current;if(!draggable||(draggable.currentItem||draggable.element)[0]==this.element[0])return;if(this.options.accept.call(this.element,(draggable.currentItem||draggable.element))){$.ui.plugin.call(this,'over',[e,this.ui(draggable)]);this.element.triggerHandler("dropover",[e,this.ui(draggable)],this.options.over);}},out:function(e){var draggable=$.ui.ddmanager.current;if(!draggable||(draggable.currentItem||draggable.element)[0]==this.element[0])return;if(this.options.accept.call(this.element,(draggable.currentItem||draggable.element))){$.ui.plugin.call(this,'out',[e,this.ui(draggable)]);this.element.triggerHandler("dropout",[e,this.ui(draggable)],this.options.out);}},drop:function(e,custom){var draggable=custom||$.ui.ddmanager.current;if(!draggable||(draggable.currentItem||draggable.element)[0]==this.element[0])return false;var childrenIntersection=false;this.element.find(".ui-droppable").not(".ui-draggable-dragging").each(function(){var inst=$.data(this,'droppable');if(inst.options.greedy&&$.ui.intersect(draggable,$.extend(inst,{offset:inst.element.offset()}),inst.options.tolerance)){childrenIntersection=true;return false;}});if(childrenIntersection)return false;if(this.options.accept.call(this.element,(draggable.currentItem||draggable.element))){$.ui.plugin.call(this,'drop',[e,this.ui(draggable)]);this.element.triggerHandler("drop",[e,this.ui(draggable)],this.options.drop);return true;}
return false;},activate:function(e){var draggable=$.ui.ddmanager.current;$.ui.plugin.call(this,'activate',[e,this.ui(draggable)]);if(draggable)this.element.triggerHandler("dropactivate",[e,this.ui(draggable)],this.options.activate);},deactivate:function(e){var draggable=$.ui.ddmanager.current;$.ui.plugin.call(this,'deactivate',[e,this.ui(draggable)]);if(draggable)this.element.triggerHandler("dropdeactivate",[e,this.ui(draggable)],this.options.deactivate);}});$.extend($.ui.droppable,{defaults:{disabled:false,tolerance:'intersect'}});$.ui.intersect=function(draggable,droppable,toleranceMode){if(!droppable.offset)return false;var x1=(draggable.positionAbs||draggable.position.absolute).left,x2=x1+draggable.helperProportions.width,y1=(draggable.positionAbs||draggable.position.absolute).top,y2=y1+draggable.helperProportions.height;var l=droppable.offset.left,r=l+droppable.proportions.width,t=droppable.offset.top,b=t+droppable.proportions.height;switch(toleranceMode){case'fit':return(l<x1&&x2<r&&t<y1&&y2<b);break;case'intersect':return(l<x1+(draggable.helperProportions.width/2)&&x2-(draggable.helperProportions.width/2)<r&&t<y1+(draggable.helperProportions.height/2)&&y2-(draggable.helperProportions.height/2)<b);break;case'pointer':return(l<((draggable.positionAbs||draggable.position.absolute).left+(draggable.clickOffset||draggable.offset.click).left)&&((draggable.positionAbs||draggable.position.absolute).left+(draggable.clickOffset||draggable.offset.click).left)<r&&t<((draggable.positionAbs||draggable.position.absolute).top+(draggable.clickOffset||draggable.offset.click).top)&&((draggable.positionAbs||draggable.position.absolute).top+(draggable.clickOffset||draggable.offset.click).top)<b);break;case'touch':return((y1>=t&&y1<=b)||(y2>=t&&y2<=b)||(y1<t&&y2>b))&&((x1>=l&&x1<=r)||(x2>=l&&x2<=r)||(x1<l&&x2>r));break;default:return false;break;}};$.ui.ddmanager={current:null,droppables:[],prepareOffsets:function(t,e){var m=$.ui.ddmanager.droppables;var type=e?e.type:null;for(var i=0;i<m.length;i++){if(m[i].options.disabled||(t&&!m[i].options.accept.call(m[i].element,(t.currentItem||t.element))))continue;m[i].visible=m[i].element.is(":visible");if(!m[i].visible)continue;m[i].offset=m[i].element.offset();m[i].proportions={width:m[i].element.outerWidth(),height:m[i].element.outerHeight()};if(type=="dragstart"||type=="sortactivate")m[i].activate.call(m[i],e);}},drop:function(draggable,e){var dropped=false;$.each($.ui.ddmanager.droppables,function(){if(!this.options)return;if(!this.options.disabled&&this.visible&&$.ui.intersect(draggable,this,this.options.tolerance))
dropped=this.drop.call(this,e);if(!this.options.disabled&&this.visible&&this.options.accept.call(this.element,(draggable.currentItem||draggable.element))){this.isout=1;this.isover=0;this.deactivate.call(this,e);}});return dropped;},drag:function(draggable,e){if(draggable.options.refreshPositions)$.ui.ddmanager.prepareOffsets(draggable,e);$.each($.ui.ddmanager.droppables,function(){if(this.options.disabled||this.greedyChild||!this.visible)return;var intersects=$.ui.intersect(draggable,this,this.options.tolerance);var c=!intersects&&this.isover==1?'isout':(intersects&&this.isover==0?'isover':null);if(!c)return;var parentInstance;if(this.options.greedy){var parent=this.element.parents('.ui-droppable:eq(0)');if(parent.length){parentInstance=$.data(parent[0],'droppable');parentInstance.greedyChild=(c=='isover'?1:0);}}
if(parentInstance&&c=='isover'){parentInstance['isover']=0;parentInstance['isout']=1;parentInstance.out.call(parentInstance,e);}
this[c]=1;this[c=='isout'?'isover':'isout']=0;this[c=="isover"?"over":"out"].call(this,e);if(parentInstance&&c=='isout'){parentInstance['isout']=0;parentInstance['isover']=1;parentInstance.over.call(parentInstance,e);}});}};$.ui.plugin.add("droppable","activeClass",{activate:function(e,ui){$(this).addClass(ui.options.activeClass);},deactivate:function(e,ui){$(this).removeClass(ui.options.activeClass);},drop:function(e,ui){$(this).removeClass(ui.options.activeClass);}});$.ui.plugin.add("droppable","hoverClass",{over:function(e,ui){$(this).addClass(ui.options.hoverClass);},out:function(e,ui){$(this).removeClass(ui.options.hoverClass);},drop:function(e,ui){$(this).removeClass(ui.options.hoverClass);}});})(jQuery);(function($){function contains(a,b){var safari2=$.browser.safari&&$.browser.version<522;if(a.contains&&!safari2){return a.contains(b);}
if(a.compareDocumentPosition)
return!!(a.compareDocumentPosition(b)&16);while(b=b.parentNode)
if(b==a)return true;return false;};$.widget("ui.sortable",$.extend($.ui.mouse,{init:function(){var o=this.options;this.containerCache={};this.element.addClass("ui-sortable");this.refresh();this.floating=this.items.length?(/left|right/).test(this.items[0].item.css('float')):false;if(!(/(relative|absolute|fixed)/).test(this.element.css('position')))this.element.css('position','relative');this.offset=this.element.offset();this.mouseInit();},plugins:{},ui:function(inst){return{helper:(inst||this)["helper"],placeholder:(inst||this)["placeholder"]||$([]),position:(inst||this)["position"],absolutePosition:(inst||this)["positionAbs"],options:this.options,element:this.element,item:(inst||this)["currentItem"],sender:inst?inst.element:null};},propagate:function(n,e,inst,noPropagation){$.ui.plugin.call(this,n,[e,this.ui(inst)]);if(!noPropagation)this.element.triggerHandler(n=="sort"?n:"sort"+n,[e,this.ui(inst)],this.options[n]);},serialize:function(o){var items=($.isFunction(this.options.items)?this.options.items.call(this.element):$(this.options.items,this.element)).not('.ui-sortable-helper');var str=[];o=o||{};items.each(function(){var res=($(this).attr(o.attribute||'id')||'').match(o.expression||(/(.+)[-=_](.+)/));if(res)str.push((o.key||res[1])+'[]='+(o.key&&o.expression?res[1]:res[2]));});return str.join('&');},toArray:function(attr){var items=($.isFunction(this.options.items)?this.options.items.call(this.element):$(this.options.items,this.element)).not('.ui-sortable-helper');var ret=[];items.each(function(){ret.push($(this).attr(attr||'id'));});return ret;},intersectsWith:function(item){var x1=this.positionAbs.left,x2=x1+this.helperProportions.width,y1=this.positionAbs.top,y2=y1+this.helperProportions.height;var l=item.left,r=l+item.width,t=item.top,b=t+item.height;if(this.options.tolerance=="pointer"||(this.options.tolerance=="guess"&&this.helperProportions[this.floating?'width':'height']>item[this.floating?'width':'height'])){return(y1+this.offset.click.top>t&&y1+this.offset.click.top<b&&x1+this.offset.click.left>l&&x1+this.offset.click.left<r);}else{return(l<x1+(this.helperProportions.width/2)&&x2-(this.helperProportions.width/2)<r&&t<y1+(this.helperProportions.height/2)&&y2-(this.helperProportions.height/2)<b);}},intersectsWithEdge:function(item){var x1=this.positionAbs.left,x2=x1+this.helperProportions.width,y1=this.positionAbs.top,y2=y1+this.helperProportions.height;var l=item.left,r=l+item.width,t=item.top,b=t+item.height;if(this.options.tolerance=="pointer"||(this.options.tolerance=="guess"&&this.helperProportions[this.floating?'width':'height']>item[this.floating?'width':'height'])){if(!(y1+this.offset.click.top>t&&y1+this.offset.click.top<b&&x1+this.offset.click.left>l&&x1+this.offset.click.left<r))return false;if(this.floating){if(x1+this.offset.click.left>l&&x1+this.offset.click.left<l+item.width/2)return 2;if(x1+this.offset.click.left>l+item.width/2&&x1+this.offset.click.left<r)return 1;}else{if(y1+this.offset.click.top>t&&y1+this.offset.click.top<t+item.height/2)return 2;if(y1+this.offset.click.top>t+item.height/2&&y1+this.offset.click.top<b)return 1;}}else{if(!(l<x1+(this.helperProportions.width/2)&&x2-(this.helperProportions.width/2)<r&&t<y1+(this.helperProportions.height/2)&&y2-(this.helperProportions.height/2)<b))return false;if(this.floating){if(x2>l&&x1<l)return 2;if(x1<r&&x2>r)return 1;}else{if(y2>t&&y1<t)return 1;if(y1<b&&y2>b)return 2;}}
return false;},refresh:function(){this.refreshItems();this.refreshPositions();},refreshItems:function(){this.items=[];this.containers=[this];var items=this.items;var self=this;var queries=[[$.isFunction(this.options.items)?this.options.items.call(this.element,null,{options:this.options,item:this.currentItem}):$(this.options.items,this.element),this]];if(this.options.connectWith){for(var i=this.options.connectWith.length-1;i>=0;i--){var cur=$(this.options.connectWith[i]);for(var j=cur.length-1;j>=0;j--){var inst=$.data(cur[j],'sortable');if(inst&&!inst.options.disabled){queries.push([$.isFunction(inst.options.items)?inst.options.items.call(inst.element):$(inst.options.items,inst.element),inst]);this.containers.push(inst);}};};}
for(var i=queries.length-1;i>=0;i--){queries[i][0].each(function(){$.data(this,'sortable-item',queries[i][1]);items.push({item:$(this),instance:queries[i][1],width:0,height:0,left:0,top:0});});};},refreshPositions:function(fast){if(this.offsetParent){var po=this.offsetParent.offset();this.offset.parent={top:po.top+this.offsetParentBorders.top,left:po.left+this.offsetParentBorders.left};}
for(var i=this.items.length-1;i>=0;i--){if(this.items[i].instance!=this.currentContainer&&this.currentContainer&&this.items[i].item[0]!=this.currentItem[0])
continue;var t=this.options.toleranceElement?$(this.options.toleranceElement,this.items[i].item):this.items[i].item;if(!fast){this.items[i].width=t.outerWidth();this.items[i].height=t.outerHeight();}
var p=t.offset();this.items[i].left=p.left;this.items[i].top=p.top;};for(var i=this.containers.length-1;i>=0;i--){var p=this.containers[i].element.offset();this.containers[i].containerCache.left=p.left;this.containers[i].containerCache.top=p.top;this.containers[i].containerCache.width=this.containers[i].element.outerWidth();this.containers[i].containerCache.height=this.containers[i].element.outerHeight();};},destroy:function(){this.element.removeClass("ui-sortable ui-sortable-disabled").removeData("sortable").unbind(".sortable");this.mouseDestroy();for(var i=this.items.length-1;i>=0;i--)
this.items[i].item.removeData("sortable-item");},createPlaceholder:function(that){var self=that||this,o=self.options;if(o.placeholder.constructor==String){var className=o.placeholder;o.placeholder={element:function(){return $('<div></div>').addClass(className)[0];},update:function(i,p){p.css(i.offset()).css({width:i.outerWidth(),height:i.outerHeight()});}};}
self.placeholder=$(o.placeholder.element.call(self.element,self.currentItem)).appendTo('body').css({position:'absolute'});o.placeholder.update.call(self.element,self.currentItem,self.placeholder);},contactContainers:function(e){for(var i=this.containers.length-1;i>=0;i--){if(this.intersectsWith(this.containers[i].containerCache)){if(!this.containers[i].containerCache.over){if(this.currentContainer!=this.containers[i]){var dist=10000;var itemWithLeastDistance=null;var base=this.positionAbs[this.containers[i].floating?'left':'top'];for(var j=this.items.length-1;j>=0;j--){if(!contains(this.containers[i].element[0],this.items[j].item[0]))continue;var cur=this.items[j][this.containers[i].floating?'left':'top'];if(Math.abs(cur-base)<dist){dist=Math.abs(cur-base);itemWithLeastDistance=this.items[j];}}
if(!itemWithLeastDistance&&!this.options.dropOnEmpty)
continue;if(this.placeholder)this.placeholder.remove();if(this.containers[i].options.placeholder){this.containers[i].createPlaceholder(this);}else{this.placeholder=null;;}
this.currentContainer=this.containers[i];itemWithLeastDistance?this.rearrange(e,itemWithLeastDistance,null,true):this.rearrange(e,null,this.containers[i].element,true);this.propagate("change",e);this.containers[i].propagate("change",e,this);}
this.containers[i].propagate("over",e,this);this.containers[i].containerCache.over=1;}}else{if(this.containers[i].containerCache.over){this.containers[i].propagate("out",e,this);this.containers[i].containerCache.over=0;}}};},mouseCapture:function(e,overrideHandle){if(this.options.disabled||this.options.type=='static')return false;this.refreshItems();var currentItem=null,self=this,nodes=$(e.target).parents().each(function(){if($.data(this,'sortable-item')==self){currentItem=$(this);return false;}});if($.data(e.target,'sortable-item')==self)currentItem=$(e.target);if(!currentItem)return false;if(this.options.handle&&!overrideHandle){var validHandle=false;$(this.options.handle,currentItem).find("*").andSelf().each(function(){if(this==e.target)validHandle=true;});if(!validHandle)return false;}
this.currentItem=currentItem;return true;},mouseStart:function(e,overrideHandle,noActivation){var o=this.options;this.currentContainer=this;this.refreshPositions();this.helper=typeof o.helper=='function'?$(o.helper.apply(this.element[0],[e,this.currentItem])):this.currentItem.clone();if(!this.helper.parents('body').length)this.helper.appendTo((o.appendTo!='parent'?o.appendTo:this.currentItem[0].parentNode));this.helper.css({position:'absolute',clear:'both'}).addClass('ui-sortable-helper');this.margins={left:(parseInt(this.currentItem.css("marginLeft"),10)||0),top:(parseInt(this.currentItem.css("marginTop"),10)||0)};this.offset=this.currentItem.offset();this.offset={top:this.offset.top-this.margins.top,left:this.offset.left-this.margins.left};this.offset.click={left:e.pageX-this.offset.left,top:e.pageY-this.offset.top};this.offsetParent=this.helper.offsetParent();var po=this.offsetParent.offset();this.offsetParentBorders={top:(parseInt(this.offsetParent.css("borderTopWidth"),10)||0),left:(parseInt(this.offsetParent.css("borderLeftWidth"),10)||0)};this.offset.parent={top:po.top+this.offsetParentBorders.top,left:po.left+this.offsetParentBorders.left};this.originalPosition=this.generatePosition(e);this.domPosition={prev:this.currentItem.prev()[0],parent:this.currentItem.parent()[0]};this.helperProportions={width:this.helper.outerWidth(),height:this.helper.outerHeight()};if(o.placeholder)this.createPlaceholder();this.propagate("start",e);this.helperProportions={width:this.helper.outerWidth(),height:this.helper.outerHeight()};if(o.cursorAt){if(o.cursorAt.left!=undefined)this.offset.click.left=o.cursorAt.left;if(o.cursorAt.right!=undefined)this.offset.click.left=this.helperProportions.width-o.cursorAt.right;if(o.cursorAt.top!=undefined)this.offset.click.top=o.cursorAt.top;if(o.cursorAt.bottom!=undefined)this.offset.click.top=this.helperProportions.height-o.cursorAt.bottom;}
if(o.containment){if(o.containment=='parent')o.containment=this.helper[0].parentNode;if(o.containment=='document'||o.containment=='window')this.containment=[0-this.offset.parent.left,0-this.offset.parent.top,$(o.containment=='document'?document:window).width()-this.offset.parent.left-this.helperProportions.width-this.margins.left-(parseInt(this.element.css("marginRight"),10)||0),($(o.containment=='document'?document:window).height()||document.body.parentNode.scrollHeight)-this.offset.parent.top-this.helperProportions.height-this.margins.top-(parseInt(this.element.css("marginBottom"),10)||0)];if(!(/^(document|window|parent)$/).test(o.containment)){var ce=$(o.containment)[0];var co=$(o.containment).offset();this.containment=[co.left+(parseInt($(ce).css("borderLeftWidth"),10)||0)-this.offset.parent.left,co.top+(parseInt($(ce).css("borderTopWidth"),10)||0)-this.offset.parent.top,co.left+Math.max(ce.scrollWidth,ce.offsetWidth)-(parseInt($(ce).css("borderLeftWidth"),10)||0)-this.offset.parent.left-this.helperProportions.width-this.margins.left-(parseInt(this.currentItem.css("marginRight"),10)||0),co.top+Math.max(ce.scrollHeight,ce.offsetHeight)-(parseInt($(ce).css("borderTopWidth"),10)||0)-this.offset.parent.top-this.helperProportions.height-this.margins.top-(parseInt(this.currentItem.css("marginBottom"),10)||0)];}}
if(this.options.placeholder!='clone')
this.currentItem.css('visibility','hidden');if(!noActivation){for(var i=this.containers.length-1;i>=0;i--){this.containers[i].propagate("activate",e,this);}}
if($.ui.ddmanager)$.ui.ddmanager.current=this;if($.ui.ddmanager&&!o.dropBehaviour)$.ui.ddmanager.prepareOffsets(this,e);this.dragging=true;this.mouseDrag(e);return true;},convertPositionTo:function(d,pos){if(!pos)pos=this.position;var mod=d=="absolute"?1:-1;return{top:(pos.top
+this.offset.parent.top*mod
-(this.offsetParent[0]==document.body?0:this.offsetParent[0].scrollTop)*mod
+this.margins.top*mod),left:(pos.left
+this.offset.parent.left*mod
-(this.offsetParent[0]==document.body?0:this.offsetParent[0].scrollLeft)*mod
+this.margins.left*mod)};},generatePosition:function(e){var o=this.options;var position={top:(e.pageY
-this.offset.click.top
-this.offset.parent.top
+(this.offsetParent[0]==document.body?0:this.offsetParent[0].scrollTop)),left:(e.pageX
-this.offset.click.left
-this.offset.parent.left
+(this.offsetParent[0]==document.body?0:this.offsetParent[0].scrollLeft))};if(!this.originalPosition)return position;if(this.containment){if(position.left<this.containment[0])position.left=this.containment[0];if(position.top<this.containment[1])position.top=this.containment[1];if(position.left>this.containment[2])position.left=this.containment[2];if(position.top>this.containment[3])position.top=this.containment[3];}
if(o.grid){var top=this.originalPosition.top+Math.round((position.top-this.originalPosition.top)/o.grid[1])*o.grid[1];position.top=this.containment?(!(top<this.containment[1]||top>this.containment[3])?top:(!(top<this.containment[1])?top-o.grid[1]:top+o.grid[1])):top;var left=this.originalPosition.left+Math.round((position.left-this.originalPosition.left)/o.grid[0])*o.grid[0];position.left=this.containment?(!(left<this.containment[0]||left>this.containment[2])?left:(!(left<this.containment[0])?left-o.grid[0]:left+o.grid[0])):left;}
return position;},mouseDrag:function(e){this.position=this.generatePosition(e);this.positionAbs=this.convertPositionTo("absolute");for(var i=this.items.length-1;i>=0;i--){var intersection=this.intersectsWithEdge(this.items[i]);if(!intersection)continue;if(this.items[i].item[0]!=this.currentItem[0]&&this.currentItem[intersection==1?"next":"prev"]()[0]!=this.items[i].item[0]&&!contains(this.currentItem[0],this.items[i].item[0])&&(this.options.type=='semi-dynamic'?!contains(this.element[0],this.items[i].item[0]):true)){this.direction=intersection==1?"down":"up";this.rearrange(e,this.items[i]);this.propagate("change",e);break;}}
this.contactContainers(e);this.propagate("sort",e);if(!this.options.axis||this.options.axis=="x")this.helper[0].style.left=this.position.left+'px';if(!this.options.axis||this.options.axis=="y")this.helper[0].style.top=this.position.top+'px';if($.ui.ddmanager)$.ui.ddmanager.drag(this,e);return false;},rearrange:function(e,i,a,hardRefresh){a?a.append(this.currentItem):i.item[this.direction=='down'?'before':'after'](this.currentItem);this.counter=this.counter?++this.counter:1;var self=this,counter=this.counter;window.setTimeout(function(){if(counter==self.counter)self.refreshPositions(!hardRefresh);},0);if(this.options.placeholder)
this.options.placeholder.update.call(this.element,this.currentItem,this.placeholder);},mouseStop:function(e,noPropagation){if($.ui.ddmanager&&!this.options.dropBehaviour)
$.ui.ddmanager.drop(this,e);if(this.options.revert){var self=this;var cur=self.currentItem.offset();if(self.placeholder)self.placeholder.animate({opacity:'hide'},(parseInt(this.options.revert,10)||500)-50);$(this.helper).animate({left:cur.left-this.offset.parent.left-self.margins.left+(this.offsetParent[0]==document.body?0:this.offsetParent[0].scrollLeft),top:cur.top-this.offset.parent.top-self.margins.top+(this.offsetParent[0]==document.body?0:this.offsetParent[0].scrollTop)},parseInt(this.options.revert,10)||500,function(){self.clear(e);});}else{this.clear(e,noPropagation);}
return false;},clear:function(e,noPropagation){if(this.domPosition.prev!=this.currentItem.prev().not(".ui-sortable-helper")[0]||this.domPosition.parent!=this.currentItem.parent()[0])this.propagate("update",e,null,noPropagation);if(!contains(this.element[0],this.currentItem[0])){this.propagate("remove",e,null,noPropagation);for(var i=this.containers.length-1;i>=0;i--){if(contains(this.containers[i].element[0],this.currentItem[0])){this.containers[i].propagate("update",e,this,noPropagation);this.containers[i].propagate("receive",e,this,noPropagation);}};};for(var i=this.containers.length-1;i>=0;i--){this.containers[i].propagate("deactivate",e,this,noPropagation);if(this.containers[i].containerCache.over){this.containers[i].propagate("out",e,this);this.containers[i].containerCache.over=0;}}
this.dragging=false;if(this.cancelHelperRemoval){this.propagate("stop",e,null,noPropagation);return false;}
$(this.currentItem).css('visibility','');if(this.placeholder)this.placeholder.remove();this.helper.remove();this.helper=null;this.propagate("stop",e,null,noPropagation);return true;}}));$.extend($.ui.sortable,{getter:"serialize toArray",defaults:{helper:"clone",tolerance:"guess",distance:1,delay:0,scroll:true,scrollSensitivity:20,scrollSpeed:20,cancel:":input",items:'> *',zIndex:1000,dropOnEmpty:true,appendTo:"parent"}});$.ui.plugin.add("sortable","cursor",{start:function(e,ui){var t=$('body');if(t.css("cursor"))ui.options._cursor=t.css("cursor");t.css("cursor",ui.options.cursor);},stop:function(e,ui){if(ui.options._cursor)$('body').css("cursor",ui.options._cursor);}});$.ui.plugin.add("sortable","zIndex",{start:function(e,ui){var t=ui.helper;if(t.css("zIndex"))ui.options._zIndex=t.css("zIndex");t.css('zIndex',ui.options.zIndex);},stop:function(e,ui){if(ui.options._zIndex)$(ui.helper).css('zIndex',ui.options._zIndex);}});$.ui.plugin.add("sortable","opacity",{start:function(e,ui){var t=ui.helper;if(t.css("opacity"))ui.options._opacity=t.css("opacity");t.css('opacity',ui.options.opacity);},stop:function(e,ui){if(ui.options._opacity)$(ui.helper).css('opacity',ui.options._opacity);}});$.ui.plugin.add("sortable","scroll",{start:function(e,ui){var o=ui.options;var i=$(this).data("sortable");i.overflowY=function(el){do{if(/auto|scroll/.test(el.css('overflow'))||(/auto|scroll/).test(el.css('overflow-y')))return el;el=el.parent();}while(el[0].parentNode);return $(document);}(i.currentItem);i.overflowX=function(el){do{if(/auto|scroll/.test(el.css('overflow'))||(/auto|scroll/).test(el.css('overflow-x')))return el;el=el.parent();}while(el[0].parentNode);return $(document);}(i.currentItem);if(i.overflowY[0]!=document&&i.overflowY[0].tagName!='HTML')i.overflowYOffset=i.overflowY.offset();if(i.overflowX[0]!=document&&i.overflowX[0].tagName!='HTML')i.overflowXOffset=i.overflowX.offset();},sort:function(e,ui){var o=ui.options;var i=$(this).data("sortable");if(i.overflowY[0]!=document&&i.overflowY[0].tagName!='HTML'){if((i.overflowYOffset.top+i.overflowY[0].offsetHeight)-e.pageY<o.scrollSensitivity)
i.overflowY[0].scrollTop=i.overflowY[0].scrollTop+o.scrollSpeed;if(e.pageY-i.overflowYOffset.top<o.scrollSensitivity)
i.overflowY[0].scrollTop=i.overflowY[0].scrollTop-o.scrollSpeed;}else{if(e.pageY-$(document).scrollTop()<o.scrollSensitivity)
$(document).scrollTop($(document).scrollTop()-o.scrollSpeed);if($(window).height()-(e.pageY-$(document).scrollTop())<o.scrollSensitivity)
$(document).scrollTop($(document).scrollTop()+o.scrollSpeed);}
if(i.overflowX[0]!=document&&i.overflowX[0].tagName!='HTML'){if((i.overflowXOffset.left+i.overflowX[0].offsetWidth)-e.pageX<o.scrollSensitivity)
i.overflowX[0].scrollLeft=i.overflowX[0].scrollLeft+o.scrollSpeed;if(e.pageX-i.overflowXOffset.left<o.scrollSensitivity)
i.overflowX[0].scrollLeft=i.overflowX[0].scrollLeft-o.scrollSpeed;}else{if(e.pageX-$(document).scrollLeft()<o.scrollSensitivity)
$(document).scrollLeft($(document).scrollLeft()-o.scrollSpeed);if($(window).width()-(e.pageX-$(document).scrollLeft())<o.scrollSensitivity)
$(document).scrollLeft($(document).scrollLeft()+o.scrollSpeed);}}});})(jQuery);(function($){$.fn.unwrap=$.fn.unwrap||function(expr){return this.each(function(){$(this).parents(expr).eq(0).after(this).remove();});};$.widget("ui.slider",{plugins:{},ui:function(e){return{options:this.options,handle:this.currentHandle,value:this.options.axis!="both"||!this.options.axis?Math.round(this.value(null,this.options.axis=="vertical"?"y":"x")):{x:Math.round(this.value(null,"x")),y:Math.round(this.value(null,"y"))},range:this.getRange()};},propagate:function(n,e){$.ui.plugin.call(this,n,[e,this.ui()]);this.element.triggerHandler(n=="slide"?n:"slide"+n,[e,this.ui()],this.options[n]);},destroy:function(){this.element.removeClass("ui-slider ui-slider-disabled").removeData("slider").unbind(".slider");if(this.handle&&this.handle.length){this.handle.unwrap("a");this.handle.each(function(){$(this).data("mouse").mouseDestroy();});}
this.generated&&this.generated.remove();},setData:function(key,value){$.widget.prototype.setData.apply(this,arguments);if(/min|max|steps/.test(key)){this.initBoundaries();}
if(key=="range"){value?this.handle.length==2&&this.createRange():this.removeRange();}},init:function(){var self=this;this.element.addClass("ui-slider");this.initBoundaries();this.handle=$(this.options.handle,this.element);if(!this.handle.length){self.handle=self.generated=$(self.options.handles||[0]).map(function(){var handle=$("<div/>").addClass("ui-slider-handle").appendTo(self.element);if(this.id)
handle.attr("id",this.id);return handle[0];});}
var handleclass=function(el){this.element=$(el);this.element.data("mouse",this);this.options=self.options;this.element.bind("mousedown",function(){if(self.currentHandle)this.blur(self.currentHandle);self.focus(this,1);});this.mouseInit();};$.extend(handleclass.prototype,$.ui.mouse,{mouseStart:function(e){return self.start.call(self,e,this.element[0]);},mouseStop:function(e){return self.stop.call(self,e,this.element[0]);},mouseDrag:function(e){return self.drag.call(self,e,this.element[0]);},mouseCapture:function(){return true;},trigger:function(e){this.mouseDown(e);}});$(this.handle).each(function(){new handleclass(this);}).wrap('<a href="javascript:void(0)" style="cursor:default;"></a>').parent().bind('focus',function(e){self.focus(this.firstChild);}).bind('blur',function(e){self.blur(this.firstChild);}).bind('keydown',function(e){if(!self.options.noKeyboard)self.keydown(e.keyCode,this.firstChild);});this.element.bind('mousedown.slider',function(e){self.click.apply(self,[e]);self.currentHandle.data("mouse").trigger(e);self.firstValue=self.firstValue+1;});$.each(this.options.handles||[],function(index,handle){self.moveTo(handle.start,index,true);});if(!isNaN(this.options.startValue))
this.moveTo(this.options.startValue,0,true);this.previousHandle=$(this.handle[0]);if(this.handle.length==2&&this.options.range)this.createRange();},initBoundaries:function(){var element=this.element[0],o=this.options;this.actualSize={width:this.element.outerWidth(),height:this.element.outerHeight()};$.extend(o,{axis:o.axis||(element.offsetWidth<element.offsetHeight?'vertical':'horizontal'),max:!isNaN(parseInt(o.max,10))?{x:parseInt(o.max,10),y:parseInt(o.max,10)}:({x:o.max&&o.max.x||100,y:o.max&&o.max.y||100}),min:!isNaN(parseInt(o.min,10))?{x:parseInt(o.min,10),y:parseInt(o.min,10)}:({x:o.min&&o.min.x||0,y:o.min&&o.min.y||0})});o.realMax={x:o.max.x-o.min.x,y:o.max.y-o.min.y};o.stepping={x:o.stepping&&o.stepping.x||parseInt(o.stepping,10)||(o.steps?o.realMax.x/(o.steps.x||parseInt(o.steps,10)||o.realMax.x):0),y:o.stepping&&o.stepping.y||parseInt(o.stepping,10)||(o.steps?o.realMax.y/(o.steps.y||parseInt(o.steps,10)||o.realMax.y):0)};},keydown:function(keyCode,handle){if(/(37|38|39|40)/.test(keyCode)){this.moveTo({x:/(37|39)/.test(keyCode)?(keyCode==37?'-':'+')+'='+this.oneStep("x"):0,y:/(38|40)/.test(keyCode)?(keyCode==38?'-':'+')+'='+this.oneStep("y"):0},handle);}},focus:function(handle,hard){this.currentHandle=$(handle).addClass('ui-slider-handle-active');if(hard)
this.currentHandle.parent()[0].focus();},blur:function(handle){$(handle).removeClass('ui-slider-handle-active');if(this.currentHandle&&this.currentHandle[0]==handle){this.previousHandle=this.currentHandle;this.currentHandle=null;};},click:function(e){var pointer=[e.pageX,e.pageY];var clickedHandle=false;this.handle.each(function(){if(this==e.target)
clickedHandle=true;});if(clickedHandle||this.options.disabled||!(this.currentHandle||this.previousHandle))
return;if(!this.currentHandle&&this.previousHandle)
this.focus(this.previousHandle,true);this.offset=this.element.offset();this.moveTo({y:this.convertValue(e.pageY-this.offset.top-this.currentHandle[0].offsetHeight/2,"y"),x:this.convertValue(e.pageX-this.offset.left-this.currentHandle[0].offsetWidth/2,"x")},null,!this.options.distance);},createRange:function(){if(this.rangeElement)return;this.rangeElement=$('<div></div>').addClass('ui-slider-range').css({position:'absolute'}).appendTo(this.element);this.updateRange();},removeRange:function(){this.rangeElement.remove();this.rangeElement=null;},updateRange:function(){var prop=this.options.axis=="vertical"?"top":"left";var size=this.options.axis=="vertical"?"height":"width";this.rangeElement.css(prop,(parseInt($(this.handle[0]).css(prop),10)||0)+this.handleSize(0,this.options.axis=="vertical"?"y":"x")/2);this.rangeElement.css(size,(parseInt($(this.handle[1]).css(prop),10)||0)-(parseInt($(this.handle[0]).css(prop),10)||0));},getRange:function(){return this.rangeElement?this.convertValue(parseInt(this.rangeElement.css(this.options.axis=="vertical"?"height":"width"),10),this.options.axis=="vertical"?"y":"x"):null;},handleIndex:function(){return this.handle.index(this.currentHandle[0]);},value:function(handle,axis){if(this.handle.length==1)this.currentHandle=this.handle;if(!axis)axis=this.options.axis=="vertical"?"y":"x";var curHandle=$(handle!=undefined&&handle!==null?this.handle[handle]||handle:this.currentHandle);if(curHandle.data("mouse").sliderValue){return parseInt(curHandle.data("mouse").sliderValue[axis],10);}else{return parseInt(((parseInt(curHandle.css(axis=="x"?"left":"top"),10)/(this.actualSize[axis=="x"?"width":"height"]-this.handleSize(handle,axis)))*this.options.realMax[axis])+this.options.min[axis],10);}},convertValue:function(value,axis){return this.options.min[axis]+(value/(this.actualSize[axis=="x"?"width":"height"]-this.handleSize(null,axis)))*this.options.realMax[axis];},translateValue:function(value,axis){return((value-this.options.min[axis])/this.options.realMax[axis])*(this.actualSize[axis=="x"?"width":"height"]-this.handleSize(null,axis));},translateRange:function(value,axis){if(this.rangeElement){if(this.currentHandle[0]==this.handle[0]&&value>=this.translateValue(this.value(1),axis))
value=this.translateValue(this.value(1,axis)-this.oneStep(axis),axis);if(this.currentHandle[0]==this.handle[1]&&value<=this.translateValue(this.value(0),axis))
value=this.translateValue(this.value(0,axis)+this.oneStep(axis),axis);}
if(this.options.handles){var handle=this.options.handles[this.handleIndex()];if(value<this.translateValue(handle.min,axis)){value=this.translateValue(handle.min,axis);}else if(value>this.translateValue(handle.max,axis)){value=this.translateValue(handle.max,axis);}}
return value;},translateLimits:function(value,axis){if(value>=this.actualSize[axis=="x"?"width":"height"]-this.handleSize(null,axis))
value=this.actualSize[axis=="x"?"width":"height"]-this.handleSize(null,axis);if(value<=0)
value=0;return value;},handleSize:function(handle,axis){return $(handle!=undefined&&handle!==null?this.handle[handle]:this.currentHandle)[0]["offset"+(axis=="x"?"Width":"Height")];},oneStep:function(axis){return this.options.stepping[axis]||1;},start:function(e,handle){var o=this.options;if(o.disabled)return false;this.actualSize={width:this.element.outerWidth(),height:this.element.outerHeight()};if(!this.currentHandle)
this.focus(this.previousHandle,true);this.offset=this.element.offset();this.handleOffset=this.currentHandle.offset();this.clickOffset={top:e.pageY-this.handleOffset.top,left:e.pageX-this.handleOffset.left};this.firstValue=this.value();this.propagate('start',e);this.drag(e,handle);return true;},stop:function(e){this.propagate('stop',e);if(this.firstValue!=this.value())
this.propagate('change',e);this.focus(this.currentHandle,true);return false;},drag:function(e,handle){var o=this.options;var position={top:e.pageY-this.offset.top-this.clickOffset.top,left:e.pageX-this.offset.left-this.clickOffset.left};if(!this.currentHandle)this.focus(this.previousHandle,true);position.left=this.translateLimits(position.left,"x");position.top=this.translateLimits(position.top,"y");if(o.stepping.x){var value=this.convertValue(position.left,"x");value=Math.round(value/o.stepping.x)*o.stepping.x;position.left=this.translateValue(value,"x");}
if(o.stepping.y){var value=this.convertValue(position.top,"y");value=Math.round(value/o.stepping.y)*o.stepping.y;position.top=this.translateValue(value,"y");}
position.left=this.translateRange(position.left,"x");position.top=this.translateRange(position.top,"y");if(o.axis!="vertical")this.currentHandle.css({left:position.left});if(o.axis!="horizontal")this.currentHandle.css({top:position.top});this.currentHandle.data("mouse").sliderValue={x:Math.round(this.convertValue(position.left,"x"))||0,y:Math.round(this.convertValue(position.top,"y"))||0};if(this.rangeElement)
this.updateRange();this.propagate('slide',e);return false;},moveTo:function(value,handle,noPropagation){var o=this.options;this.actualSize={width:this.element.outerWidth(),height:this.element.outerHeight()};if(handle==undefined&&!this.currentHandle&&this.handle.length!=1)
return false;if(handle==undefined&&!this.currentHandle)
handle=0;if(handle!=undefined)
this.currentHandle=this.previousHandle=$(this.handle[handle]||handle);if(value.x!==undefined&&value.y!==undefined){var x=value.x,y=value.y;}else{var x=value,y=value;}
if(x!==undefined&&x.constructor!=Number){var me=/^\-\=/.test(x),pe=/^\+\=/.test(x);if(me||pe){x=this.value(null,"x")+parseInt(x.replace(me?'=':'+=',''),10);}else{x=isNaN(parseInt(x,10))?undefined:parseInt(x,10);}}
if(y!==undefined&&y.constructor!=Number){var me=/^\-\=/.test(y),pe=/^\+\=/.test(y);if(me||pe){y=this.value(null,"y")+parseInt(y.replace(me?'=':'+=',''),10);}else{y=isNaN(parseInt(y,10))?undefined:parseInt(y,10);}}
if(o.axis!="vertical"&&x!==undefined){if(o.stepping.x)x=Math.round(x/o.stepping.x)*o.stepping.x;x=this.translateValue(x,"x");x=this.translateLimits(x,"x");x=this.translateRange(x,"x");this.currentHandle.css({left:x});}
if(o.axis!="horizontal"&&y!==undefined){if(o.stepping.y)y=Math.round(y/o.stepping.y)*o.stepping.y;y=this.translateValue(y,"y");y=this.translateLimits(y,"y");y=this.translateRange(y,"y");this.currentHandle.css({top:y});}
if(this.rangeElement)
this.updateRange();this.currentHandle.data("mouse").sliderValue={x:Math.round(this.convertValue(x,"x"))||0,y:Math.round(this.convertValue(y,"y"))||0};if(!noPropagation){this.propagate('start',null);this.propagate('stop',null);this.propagate('change',null);this.propagate("slide",null);}}});$.ui.slider.getter="value";$.ui.slider.defaults={handle:".ui-slider-handle",distance:1};})(jQuery);;(function($){$.effects=$.effects||{};$.extend($.effects,{save:function(el,set){for(var i=0;i<set.length;i++){if(set[i]!==null)$.data(el[0],"ec.storage."+set[i],el[0].style[set[i]]);}},restore:function(el,set){for(var i=0;i<set.length;i++){if(set[i]!==null)el.css(set[i],$.data(el[0],"ec.storage."+set[i]));}},setMode:function(el,mode){if(mode=='toggle')mode=el.is(':hidden')?'show':'hide';return mode;},getBaseline:function(origin,original){var y,x;switch(origin[0]){case'top':y=0;break;case'middle':y=0.5;break;case'bottom':y=1;break;default:y=origin[0]/original.height;};switch(origin[1]){case'left':x=0;break;case'center':x=0.5;break;case'right':x=1;break;default:x=origin[1]/original.width;};return{x:x,y:y};},createWrapper:function(el){if(el.parent().attr('id')=='fxWrapper')
return el;var props={width:el.outerWidth({margin:true}),height:el.outerHeight({margin:true}),'float':el.css('float')};el.wrap('<div id="fxWrapper" style="font-size:100%;background:transparent;border:none;margin:0;padding:0"></div>');var wrapper=el.parent();if(el.css('position')=='static'){wrapper.css({position:'relative'});el.css({position:'relative'});}else{var top=parseInt(el.css('top'),10);if(isNaN(top))top='auto';var left=parseInt(el.css('left'),10);if(isNaN(left))left='auto';wrapper.css({position:el.css('position'),top:top,left:left,zIndex:el.css('z-index')}).show();el.css({position:'relative',top:0,left:0});}
wrapper.css(props);return wrapper;},removeWrapper:function(el){if(el.parent().attr('id')=='fxWrapper')
return el.parent().replaceWith(el);return el;},setTransition:function(el,list,factor,val){val=val||{};$.each(list,function(i,x){unit=el.cssUnit(x);if(unit[0]>0)val[x]=unit[0]*factor+unit[1];});return val;},animateClass:function(value,duration,easing,callback){var cb=(typeof easing=="function"?easing:(callback?callback:null));var ea=(typeof easing=="object"?easing:null);return this.each(function(){var offset={};var that=$(this);var oldStyleAttr=that.attr("style")||'';if(typeof oldStyleAttr=='object')oldStyleAttr=oldStyleAttr["cssText"];if(value.toggle){that.hasClass(value.toggle)?value.remove=value.toggle:value.add=value.toggle;}
var oldStyle=$.extend({},(document.defaultView?document.defaultView.getComputedStyle(this,null):this.currentStyle));if(value.add)that.addClass(value.add);if(value.remove)that.removeClass(value.remove);var newStyle=$.extend({},(document.defaultView?document.defaultView.getComputedStyle(this,null):this.currentStyle));if(value.add)that.removeClass(value.add);if(value.remove)that.addClass(value.remove);for(var n in newStyle){if(typeof newStyle[n]!="function"&&newStyle[n]&&n.indexOf("Moz")==-1&&n.indexOf("length")==-1&&newStyle[n]!=oldStyle[n]&&(n.match(/color/i)||(!n.match(/color/i)&&!isNaN(parseInt(newStyle[n],10))))&&(oldStyle.position!="static"||(oldStyle.position=="static"&&!n.match(/left|top|bottom|right/))))offset[n]=newStyle[n];}
that.animate(offset,duration,ea,function(){if(typeof $(this).attr("style")=='object'){$(this).attr("style")["cssText"]="";$(this).attr("style")["cssText"]=oldStyleAttr;}else $(this).attr("style",oldStyleAttr);if(value.add)$(this).addClass(value.add);if(value.remove)$(this).removeClass(value.remove);if(cb)cb.apply(this,arguments);});});}});$.fn.extend({_show:$.fn.show,_hide:$.fn.hide,__toggle:$.fn.toggle,_addClass:$.fn.addClass,_removeClass:$.fn.removeClass,_toggleClass:$.fn.toggleClass,effect:function(fx,o,speed,callback){return $.effects[fx]?$.effects[fx].call(this,{method:fx,options:o||{},duration:speed,callback:callback}):null;},show:function(){if(!arguments[0]||(arguments[0].constructor==Number||/(slow|normal|fast)/.test(arguments[0])))
return this._show.apply(this,arguments);else{var o=arguments[1]||{};o['mode']='show';return this.effect.apply(this,[arguments[0],o,arguments[2]||o.duration,arguments[3]||o.callback]);}},hide:function(){if(!arguments[0]||(arguments[0].constructor==Number||/(slow|normal|fast)/.test(arguments[0])))
return this._hide.apply(this,arguments);else{var o=arguments[1]||{};o['mode']='hide';return this.effect.apply(this,[arguments[0],o,arguments[2]||o.duration,arguments[3]||o.callback]);}},toggle:function(){if(!arguments[0]||(arguments[0].constructor==Number||/(slow|normal|fast)/.test(arguments[0]))||(arguments[0].constructor==Function))
return this.__toggle.apply(this,arguments);else{var o=arguments[1]||{};o['mode']='toggle';return this.effect.apply(this,[arguments[0],o,arguments[2]||o.duration,arguments[3]||o.callback]);}},addClass:function(classNames,speed,easing,callback){return speed?$.effects.animateClass.apply(this,[{add:classNames},speed,easing,callback]):this._addClass(classNames);},removeClass:function(classNames,speed,easing,callback){return speed?$.effects.animateClass.apply(this,[{remove:classNames},speed,easing,callback]):this._removeClass(classNames);},toggleClass:function(classNames,speed,easing,callback){return speed?$.effects.animateClass.apply(this,[{toggle:classNames},speed,easing,callback]):this._toggleClass(classNames);},morph:function(remove,add,speed,easing,callback){return $.effects.animateClass.apply(this,[{add:add,remove:remove},speed,easing,callback]);},switchClass:function(){return this.morph.apply(this,arguments);},cssUnit:function(key){var style=this.css(key),val=[];$.each(['em','px','%','pt'],function(i,unit){if(style.indexOf(unit)>0)
val=[parseFloat(style),unit];});return val;}});jQuery.each(['backgroundColor','borderBottomColor','borderLeftColor','borderRightColor','borderTopColor','color','outlineColor'],function(i,attr){jQuery.fx.step[attr]=function(fx){if(fx.state==0){fx.start=getColor(fx.elem,attr);fx.end=getRGB(fx.end);}
fx.elem.style[attr]="rgb("+[Math.max(Math.min(parseInt((fx.pos*(fx.end[0]-fx.start[0]))+fx.start[0]),255),0),Math.max(Math.min(parseInt((fx.pos*(fx.end[1]-fx.start[1]))+fx.start[1]),255),0),Math.max(Math.min(parseInt((fx.pos*(fx.end[2]-fx.start[2]))+fx.start[2]),255),0)].join(",")+")";}});function getRGB(color){var result;if(color&&color.constructor==Array&&color.length==3)
return color;if(result=/rgb\(\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*\)/.exec(color))
return[parseInt(result[1]),parseInt(result[2]),parseInt(result[3])];if(result=/rgb\(\s*([0-9]+(?:\.[0-9]+)?)\%\s*,\s*([0-9]+(?:\.[0-9]+)?)\%\s*,\s*([0-9]+(?:\.[0-9]+)?)\%\s*\)/.exec(color))
return[parseFloat(result[1])*2.55,parseFloat(result[2])*2.55,parseFloat(result[3])*2.55];if(result=/#([a-fA-F0-9]{2})([a-fA-F0-9]{2})([a-fA-F0-9]{2})/.exec(color))
return[parseInt(result[1],16),parseInt(result[2],16),parseInt(result[3],16)];if(result=/#([a-fA-F0-9])([a-fA-F0-9])([a-fA-F0-9])/.exec(color))
return[parseInt(result[1]+result[1],16),parseInt(result[2]+result[2],16),parseInt(result[3]+result[3],16)];if(result=/rgba\(0, 0, 0, 0\)/.exec(color))
return colors['transparent']
return colors[jQuery.trim(color).toLowerCase()];}
function getColor(elem,attr){var color;do{color=jQuery.curCSS(elem,attr);if(color!=''&&color!='transparent'||jQuery.nodeName(elem,"body"))
break;attr="backgroundColor";}while(elem=elem.parentNode);return getRGB(color);};var colors={aqua:[0,255,255],azure:[240,255,255],beige:[245,245,220],black:[0,0,0],blue:[0,0,255],brown:[165,42,42],cyan:[0,255,255],darkblue:[0,0,139],darkcyan:[0,139,139],darkgrey:[169,169,169],darkgreen:[0,100,0],darkkhaki:[189,183,107],darkmagenta:[139,0,139],darkolivegreen:[85,107,47],darkorange:[255,140,0],darkorchid:[153,50,204],darkred:[139,0,0],darksalmon:[233,150,122],darkviolet:[148,0,211],fuchsia:[255,0,255],gold:[255,215,0],green:[0,128,0],indigo:[75,0,130],khaki:[240,230,140],lightblue:[173,216,230],lightcyan:[224,255,255],lightgreen:[144,238,144],lightgrey:[211,211,211],lightpink:[255,182,193],lightyellow:[255,255,224],lime:[0,255,0],magenta:[255,0,255],maroon:[128,0,0],navy:[0,0,128],olive:[128,128,0],orange:[255,165,0],pink:[255,192,203],purple:[128,0,128],violet:[128,0,128],red:[255,0,0],silver:[192,192,192],white:[255,255,255],yellow:[255,255,0],transparent:[255,255,255]};jQuery.easing['jswing']=jQuery.easing['swing'];jQuery.extend(jQuery.easing,{def:'easeOutQuad',swing:function(x,t,b,c,d){return jQuery.easing[jQuery.easing.def](x,t,b,c,d);},easeInQuad:function(x,t,b,c,d){return c*(t/=d)*t+b;},easeOutQuad:function(x,t,b,c,d){return-c*(t/=d)*(t-2)+b;},easeInOutQuad:function(x,t,b,c,d){if((t/=d/2)<1)return c/2*t*t+b;return-c/2*((--t)*(t-2)-1)+b;},easeInCubic:function(x,t,b,c,d){return c*(t/=d)*t*t+b;},easeOutCubic:function(x,t,b,c,d){return c*((t=t/d-1)*t*t+1)+b;},easeInOutCubic:function(x,t,b,c,d){if((t/=d/2)<1)return c/2*t*t*t+b;return c/2*((t-=2)*t*t+2)+b;},easeInQuart:function(x,t,b,c,d){return c*(t/=d)*t*t*t+b;},easeOutQuart:function(x,t,b,c,d){return-c*((t=t/d-1)*t*t*t-1)+b;},easeInOutQuart:function(x,t,b,c,d){if((t/=d/2)<1)return c/2*t*t*t*t+b;return-c/2*((t-=2)*t*t*t-2)+b;},easeInQuint:function(x,t,b,c,d){return c*(t/=d)*t*t*t*t+b;},easeOutQuint:function(x,t,b,c,d){return c*((t=t/d-1)*t*t*t*t+1)+b;},easeInOutQuint:function(x,t,b,c,d){if((t/=d/2)<1)return c/2*t*t*t*t*t+b;return c/2*((t-=2)*t*t*t*t+2)+b;},easeInSine:function(x,t,b,c,d){return-c*Math.cos(t/d*(Math.PI/2))+c+b;},easeOutSine:function(x,t,b,c,d){return c*Math.sin(t/d*(Math.PI/2))+b;},easeInOutSine:function(x,t,b,c,d){return-c/2*(Math.cos(Math.PI*t/d)-1)+b;},easeInExpo:function(x,t,b,c,d){return(t==0)?b:c*Math.pow(2,10*(t/d-1))+b;},easeOutExpo:function(x,t,b,c,d){return(t==d)?b+c:c*(-Math.pow(2,-10*t/d)+1)+b;},easeInOutExpo:function(x,t,b,c,d){if(t==0)return b;if(t==d)return b+c;if((t/=d/2)<1)return c/2*Math.pow(2,10*(t-1))+b;return c/2*(-Math.pow(2,-10*--t)+2)+b;},easeInCirc:function(x,t,b,c,d){return-c*(Math.sqrt(1-(t/=d)*t)-1)+b;},easeOutCirc:function(x,t,b,c,d){return c*Math.sqrt(1-(t=t/d-1)*t)+b;},easeInOutCirc:function(x,t,b,c,d){if((t/=d/2)<1)return-c/2*(Math.sqrt(1-t*t)-1)+b;return c/2*(Math.sqrt(1-(t-=2)*t)+1)+b;},easeInElastic:function(x,t,b,c,d){var s=1.70158;var p=0;var a=c;if(t==0)return b;if((t/=d)==1)return b+c;if(!p)p=d*.3;if(a<Math.abs(c)){a=c;var s=p/4;}
else var s=p/(2*Math.PI)*Math.asin(c/a);return-(a*Math.pow(2,10*(t-=1))*Math.sin((t*d-s)*(2*Math.PI)/p))+b;},easeOutElastic:function(x,t,b,c,d){var s=1.70158;var p=0;var a=c;if(t==0)return b;if((t/=d)==1)return b+c;if(!p)p=d*.3;if(a<Math.abs(c)){a=c;var s=p/4;}
else var s=p/(2*Math.PI)*Math.asin(c/a);return a*Math.pow(2,-10*t)*Math.sin((t*d-s)*(2*Math.PI)/p)+c+b;},easeInOutElastic:function(x,t,b,c,d){var s=1.70158;var p=0;var a=c;if(t==0)return b;if((t/=d/2)==2)return b+c;if(!p)p=d*(.3*1.5);if(a<Math.abs(c)){a=c;var s=p/4;}
else var s=p/(2*Math.PI)*Math.asin(c/a);if(t<1)return-.5*(a*Math.pow(2,10*(t-=1))*Math.sin((t*d-s)*(2*Math.PI)/p))+b;return a*Math.pow(2,-10*(t-=1))*Math.sin((t*d-s)*(2*Math.PI)/p)*.5+c+b;},easeInBack:function(x,t,b,c,d,s){if(s==undefined)s=1.70158;return c*(t/=d)*t*((s+1)*t-s)+b;},easeOutBack:function(x,t,b,c,d,s){if(s==undefined)s=1.70158;return c*((t=t/d-1)*t*((s+1)*t+s)+1)+b;},easeInOutBack:function(x,t,b,c,d,s){if(s==undefined)s=1.70158;if((t/=d/2)<1)return c/2*(t*t*(((s*=(1.525))+1)*t-s))+b;return c/2*((t-=2)*t*(((s*=(1.525))+1)*t+s)+2)+b;},easeInBounce:function(x,t,b,c,d){return c-jQuery.easing.easeOutBounce(x,d-t,0,c,d)+b;},easeOutBounce:function(x,t,b,c,d){if((t/=d)<(1/2.75)){return c*(7.5625*t*t)+b;}else if(t<(2/2.75)){return c*(7.5625*(t-=(1.5/2.75))*t+.75)+b;}else if(t<(2.5/2.75)){return c*(7.5625*(t-=(2.25/2.75))*t+.9375)+b;}else{return c*(7.5625*(t-=(2.625/2.75))*t+.984375)+b;}},easeInOutBounce:function(x,t,b,c,d){if(t<d/2)return jQuery.easing.easeInBounce(x,t*2,0,c,d)*.5+b;return jQuery.easing.easeOutBounce(x,t*2-d,0,c,d)*.5+c*.5+b;}});})(jQuery);(function($){$.effects.blind=function(o){return this.queue(function(){var el=$(this),props=['position','top','left'];var mode=$.effects.setMode(el,o.options.mode||'hide');var direction=o.options.direction||'vertical';$.effects.save(el,props);el.show();var wrapper=$.effects.createWrapper(el).css({overflow:'hidden'});var ref=(direction=='vertical')?'height':'width';var distance=(direction=='vertical')?wrapper.height():wrapper.width();if(mode=='show')wrapper.css(ref,0);var animation={};animation[ref]=mode=='show'?distance:0;wrapper.animate(animation,o.duration,o.options.easing,function(){if(mode=='hide')el.hide();$.effects.restore(el,props);$.effects.removeWrapper(el);if(o.callback)o.callback.apply(el[0],arguments);el.dequeue();});});};})(jQuery);(function($){$.effects.bounce=function(o){return this.queue(function(){var el=$(this),props=['position','top','left'];var mode=$.effects.setMode(el,o.options.mode||'effect');var direction=o.options.direction||'up';var distance=o.options.distance||20;var times=o.options.times||5;var speed=o.duration||250;if(/show|hide/.test(mode))props.push('opacity');$.effects.save(el,props);el.show();$.effects.createWrapper(el);var ref=(direction=='up'||direction=='down')?'top':'left';var motion=(direction=='up'||direction=='left')?'pos':'neg';var distance=o.options.distance||(ref=='top'?el.outerHeight({margin:true})/3:el.outerWidth({margin:true})/3);if(mode=='show')el.css('opacity',0).css(ref,motion=='pos'?-distance:distance);if(mode=='hide')distance=distance/(times*2);if(mode!='hide')times--;if(mode=='show'){var animation={opacity:1};animation[ref]=(motion=='pos'?'+=':'-=')+distance;el.animate(animation,speed/2,o.options.easing);distance=distance/2;times--;};for(var i=0;i<times;i++){var animation1={},animation2={};animation1[ref]=(motion=='pos'?'-=':'+=')+distance;animation2[ref]=(motion=='pos'?'+=':'-=')+distance;el.animate(animation1,speed/2,o.options.easing).animate(animation2,speed/2,o.options.easing);distance=(mode=='hide')?distance*2:distance/2;};if(mode=='hide'){var animation={opacity:0};animation[ref]=(motion=='pos'?'-=':'+=')+distance;el.animate(animation,speed/2,o.options.easing,function(){el.hide();$.effects.restore(el,props);$.effects.removeWrapper(el);if(o.callback)o.callback.apply(this,arguments);});}else{var animation1={},animation2={};animation1[ref]=(motion=='pos'?'-=':'+=')+distance;animation2[ref]=(motion=='pos'?'+=':'-=')+distance;el.animate(animation1,speed/2,o.options.easing).animate(animation2,speed/2,o.options.easing,function(){$.effects.restore(el,props);$.effects.removeWrapper(el);if(o.callback)o.callback.apply(this,arguments);});};el.queue('fx',function(){el.dequeue();});el.dequeue();});};})(jQuery);(function($){$.effects.clip=function(o){return this.queue(function(){var el=$(this),props=['position','top','left','height','width'];var mode=$.effects.setMode(el,o.options.mode||'hide');var direction=o.options.direction||'vertical';$.effects.save(el,props);el.show();var wrapper=$.effects.createWrapper(el).css({overflow:'hidden'});var animate=el[0].tagName=='IMG'?wrapper:el;var ref={size:(direction=='vertical')?'height':'width',position:(direction=='vertical')?'top':'left'};var distance=(direction=='vertical')?animate.height():animate.width();if(mode=='show'){animate.css(ref.size,0);animate.css(ref.position,distance/2);}
var animation={};animation[ref.size]=mode=='show'?distance:0;animation[ref.position]=mode=='show'?0:distance/2;animate.animate(animation,{queue:false,duration:o.duration,easing:o.options.easing,complete:function(){if(mode=='hide')el.hide();$.effects.restore(el,props);$.effects.removeWrapper(el);if(o.callback)o.callback.apply(el[0],arguments);el.dequeue();}});});};})(jQuery);(function($){$.effects.drop=function(o){return this.queue(function(){var el=$(this),props=['position','top','left','opacity'];var mode=$.effects.setMode(el,o.options.mode||'hide');var direction=o.options.direction||'left';$.effects.save(el,props);el.show();$.effects.createWrapper(el);var ref=(direction=='up'||direction=='down')?'top':'left';var motion=(direction=='up'||direction=='left')?'pos':'neg';var distance=o.options.distance||(ref=='top'?el.outerHeight({margin:true})/2:el.outerWidth({margin:true})/2);if(mode=='show')el.css('opacity',0).css(ref,motion=='pos'?-distance:distance);var animation={opacity:mode=='show'?1:0};animation[ref]=(mode=='show'?(motion=='pos'?'+=':'-='):(motion=='pos'?'-=':'+='))+distance;el.animate(animation,{queue:false,duration:o.duration,easing:o.options.easing,complete:function(){if(mode=='hide')el.hide();$.effects.restore(el,props);$.effects.removeWrapper(el);if(o.callback)o.callback.apply(this,arguments);el.dequeue();}});});};})(jQuery);(function($){$.effects.fold=function(o){return this.queue(function(){var el=$(this),props=['position','top','left'];var mode=$.effects.setMode(el,o.options.mode||'hide');var size=o.options.size||15;var horizFirst=!(!o.options.horizFirst);$.effects.save(el,props);el.show();var wrapper=$.effects.createWrapper(el).css({overflow:'hidden'});var widthFirst=((mode=='show')!=horizFirst);var ref=widthFirst?['width','height']:['height','width'];var distance=widthFirst?[wrapper.width(),wrapper.height()]:[wrapper.height(),wrapper.width()];var percent=/([0-9]+)%/.exec(size);if(percent)size=parseInt(percent[1])/100*distance[mode=='hide'?0:1];if(mode=='show')wrapper.css(horizFirst?{height:0,width:size}:{height:size,width:0});var animation1={},animation2={};animation1[ref[0]]=mode=='show'?distance[0]:size;animation2[ref[1]]=mode=='show'?distance[1]:0;wrapper.animate(animation1,o.duration/2,o.options.easing).animate(animation2,o.duration/2,o.options.easing,function(){if(mode=='hide')el.hide();$.effects.restore(el,props);$.effects.removeWrapper(el);if(o.callback)o.callback.apply(el[0],arguments);el.dequeue();});});};})(jQuery);;(function($){$.effects.highlight=function(o){return this.queue(function(){var el=$(this),props=['backgroundImage','backgroundColor','opacity'];var mode=$.effects.setMode(el,o.options.mode||'show');var color=o.options.color||"#ffff99";var oldColor=el.css("backgroundColor");$.effects.save(el,props);el.show();el.css({backgroundImage:'none',backgroundColor:color});var animation={backgroundColor:oldColor};if(mode=="hide")animation['opacity']=0;el.animate(animation,{queue:false,duration:o.duration,easing:o.options.easing,complete:function(){if(mode=="hide")el.hide();$.effects.restore(el,props);if(mode=="show"&&jQuery.browser.msie)this.style.removeAttribute('filter');if(o.callback)o.callback.apply(this,arguments);el.dequeue();}});});};})(jQuery);(function($){$.effects.pulsate=function(o){return this.queue(function(){var el=$(this);var mode=$.effects.setMode(el,o.options.mode||'show');var times=o.options.times||5;if(mode=='hide')times--;if(el.is(':hidden')){el.css('opacity',0);el.show();el.animate({opacity:1},o.duration/2,o.options.easing);times=times-2;}
for(var i=0;i<times;i++){el.animate({opacity:0},o.duration/2,o.options.easing).animate({opacity:1},o.duration/2,o.options.easing);};if(mode=='hide'){el.animate({opacity:0},o.duration/2,o.options.easing,function(){el.hide();if(o.callback)o.callback.apply(this,arguments);});}else{el.animate({opacity:0},o.duration/2,o.options.easing).animate({opacity:1},o.duration/2,o.options.easing,function(){if(o.callback)o.callback.apply(this,arguments);});};el.queue('fx',function(){el.dequeue();});el.dequeue();});};})(jQuery);(function($){$.effects.puff=function(o){return this.queue(function(){var el=$(this);var options=$.extend(true,{},o.options);var mode=$.effects.setMode(el,o.options.mode||'hide');var percent=parseInt(o.options.percent)||150;options.fade=true;var original={height:el.height(),width:el.width()};var factor=percent/100;el.from=(mode=='hide')?original:{height:original.height*factor,width:original.width*factor};options.from=el.from;options.percent=(mode=='hide')?percent:100;options.mode=mode;el.effect('scale',options,o.duration,o.callback);el.dequeue();});};$.effects.scale=function(o){return this.queue(function(){var el=$(this);var options=$.extend(true,{},o.options);var mode=$.effects.setMode(el,o.options.mode||'effect');var percent=parseInt(o.options.percent)||(parseInt(o.options.percent)==0?0:(mode=='hide'?0:100));var direction=o.options.direction||'both';var origin=o.options.origin;if(mode!='effect'){options.origin=origin||['middle','center'];options.restore=true;}
var original={height:el.height(),width:el.width()};el.from=o.options.from||(mode=='show'?{height:0,width:0}:original);var factor={y:direction!='horizontal'?(percent/100):1,x:direction!='vertical'?(percent/100):1};el.to={height:original.height*factor.y,width:original.width*factor.x};if(o.options.fade){if(mode=='show'){el.from.opacity=0;el.to.opacity=1;};if(mode=='hide'){el.from.opacity=1;el.to.opacity=0;};};options.from=el.from;options.to=el.to;options.mode=mode;el.effect('size',options,o.duration,o.callback);el.dequeue();});};$.effects.size=function(o){return this.queue(function(){var el=$(this),props=['position','top','left','width','height','overflow','opacity'];var props1=['position','top','left','overflow','opacity'];var props2=['width','height','overflow'];var cProps=['fontSize'];var vProps=['borderTopWidth','borderBottomWidth','paddingTop','paddingBottom'];var hProps=['borderLeftWidth','borderRightWidth','paddingLeft','paddingRight'];var mode=$.effects.setMode(el,o.options.mode||'effect');var restore=o.options.restore||false;var scale=o.options.scale||'both';var origin=o.options.origin;var original={height:el.height(),width:el.width()};el.from=o.options.from||original;el.to=o.options.to||original;if(origin){var baseline=$.effects.getBaseline(origin,original);el.from.top=(original.height-el.from.height)*baseline.y;el.from.left=(original.width-el.from.width)*baseline.x;el.to.top=(original.height-el.to.height)*baseline.y;el.to.left=(original.width-el.to.width)*baseline.x;};var factor={from:{y:el.from.height/original.height,x:el.from.width/original.width},to:{y:el.to.height/original.height,x:el.to.width/original.width}};if(scale=='box'||scale=='both'){if(factor.from.y!=factor.to.y){props=props.concat(vProps);el.from=$.effects.setTransition(el,vProps,factor.from.y,el.from);el.to=$.effects.setTransition(el,vProps,factor.to.y,el.to);};if(factor.from.x!=factor.to.x){props=props.concat(hProps);el.from=$.effects.setTransition(el,hProps,factor.from.x,el.from);el.to=$.effects.setTransition(el,hProps,factor.to.x,el.to);};};if(scale=='content'||scale=='both'){if(factor.from.y!=factor.to.y){props=props.concat(cProps);el.from=$.effects.setTransition(el,cProps,factor.from.y,el.from);el.to=$.effects.setTransition(el,cProps,factor.to.y,el.to);};};$.effects.save(el,restore?props:props1);el.show();$.effects.createWrapper(el);el.css('overflow','hidden').css(el.from);if(scale=='content'||scale=='both'){vProps=vProps.concat(['marginTop','marginBottom']).concat(cProps);hProps=hProps.concat(['marginLeft','marginRight']);props2=props.concat(vProps).concat(hProps);el.find("*[width]").each(function(){child=$(this);if(restore)$.effects.save(child,props2);var c_original={height:child.height(),width:child.width()};child.from={height:c_original.height*factor.from.y,width:c_original.width*factor.from.x};child.to={height:c_original.height*factor.to.y,width:c_original.width*factor.to.x};if(factor.from.y!=factor.to.y){child.from=$.effects.setTransition(child,vProps,factor.from.y,child.from);child.to=$.effects.setTransition(child,vProps,factor.to.y,child.to);};if(factor.from.x!=factor.to.x){child.from=$.effects.setTransition(child,hProps,factor.from.x,child.from);child.to=$.effects.setTransition(child,hProps,factor.to.x,child.to);};child.css(child.from);child.animate(child.to,o.duration,o.options.easing,function(){if(restore)$.effects.restore(child,props2);});});};el.animate(el.to,{queue:false,duration:o.duration,easing:o.options.easing,complete:function(){if(mode=='hide')el.hide();$.effects.restore(el,restore?props:props1);$.effects.removeWrapper(el);if(o.callback)o.callback.apply(this,arguments);el.dequeue();}});});};})(jQuery);(function($){$.effects.shake=function(o){return this.queue(function(){var el=$(this),props=['position','top','left'];var mode=$.effects.setMode(el,o.options.mode||'effect');var direction=o.options.direction||'left';var distance=o.options.distance||20;var times=o.options.times||3;var speed=o.duration||o.options.duration||140;$.effects.save(el,props);el.show();$.effects.createWrapper(el);var ref=(direction=='up'||direction=='down')?'top':'left';var motion=(direction=='up'||direction=='left')?'pos':'neg';var animation={},animation1={},animation2={};animation[ref]=(motion=='pos'?'-=':'+=')+distance;animation1[ref]=(motion=='pos'?'+=':'-=')+distance*2;animation2[ref]=(motion=='pos'?'-=':'+=')+distance*2;el.animate(animation,speed,o.options.easing);for(var i=1;i<times;i++){el.animate(animation1,speed,o.options.easing).animate(animation2,speed,o.options.easing);};el.animate(animation1,speed,o.options.easing).animate(animation,speed/2,o.options.easing,function(){$.effects.restore(el,props);$.effects.removeWrapper(el);if(o.callback)o.callback.apply(this,arguments);});el.queue('fx',function(){el.dequeue();});el.dequeue();});};})(jQuery);(function($){$.effects.slide=function(o){return this.queue(function(){var el=$(this),props=['position','top','left'];var mode=$.effects.setMode(el,o.options.mode||'show');var direction=o.options.direction||'left';$.effects.save(el,props);el.show();$.effects.createWrapper(el).css({overflow:'hidden'});var ref=(direction=='up'||direction=='down')?'top':'left';var motion=(direction=='up'||direction=='left')?'pos':'neg';var distance=o.options.distance||(ref=='top'?el.outerHeight({margin:true}):el.outerWidth({margin:true}));if(mode=='show')el.css(ref,motion=='pos'?-distance:distance);var animation={};animation[ref]=(mode=='show'?(motion=='pos'?'+=':'-='):(motion=='pos'?'-=':'+='))+distance;el.animate(animation,{queue:false,duration:o.duration,easing:o.options.easing,complete:function(){if(mode=='hide')el.hide();$.effects.restore(el,props);$.effects.removeWrapper(el);if(o.callback)o.callback.apply(this,arguments);el.dequeue();}});});};})(jQuery);

(function($){$().ajaxSend(function(a,xhr,s){xhr.setRequestHeader("Accept","text/javascript, text/html, application/xml, text/xml, */*")})})(jQuery);(function($){$.fn.reset=function(){return this.each(function(){if(typeof this.reset=="function"||(typeof this.reset=="object"&&!this.reset.nodeType)){this.reset()}})};$.fn.enable=function(){return this.each(function(){this.disabled=false})};$.fn.disable=function(){return this.each(function(){this.disabled=true})}})(jQuery);(function($){$.extend({fieldEvent:function(el,obs){var field=el[0]||el,e="change";if(field.type=="radio"||field.type=="checkbox"){e="click"}else{if(obs&&field.type=="text"||field.type=="textarea"){e="keyup"}}return e}});$.fn.extend({delayedObserver:function(delay,callback){var el=$(this);if(typeof window.delayedObserverStack=="undefined"){window.delayedObserverStack=[]}if(typeof window.delayedObserverCallback=="undefined"){window.delayedObserverCallback=function(stackPos){observed=window.delayedObserverStack[stackPos];if(observed.timer){clearTimeout(observed.timer)}observed.timer=setTimeout(function(){observed.timer=null;observed.callback(observed.obj,observed.obj.formVal())},observed.delay*1000);observed.oldVal=observed.obj.formVal()}}window.delayedObserverStack.push({obj:el,timer:null,delay:delay,oldVal:el.formVal(),callback:callback});var stackPos=window.delayedObserverStack.length-1;if(el[0].tagName=="FORM"){$(":input",el).each(function(){var field=$(this);field.bind($.fieldEvent(field,delay),function(){observed=window.delayedObserverStack[stackPos];if(observed.obj.formVal()==observed.obj.oldVal){return}else{window.delayedObserverCallback(stackPos)}})})}else{el.bind($.fieldEvent(el,delay),function(){observed=window.delayedObserverStack[stackPos];if(observed.obj.formVal()==observed.obj.oldVal){return}else{window.delayedObserverCallback(stackPos)}})}},formVal:function(){var el=this[0];if(el.tagName=="FORM"){return this.serialize()}if(el.type=="checkbox"||self.type=="radio"){return this.filter("input:checked").val()||""}else{return this.val()}}})})(jQuery);(function($){$.fn.extend({visualEffect:function(o){e=o.replace(/\_(.)/g,function(m,l){return l.toUpperCase()});return eval("$(this)."+e+"()")},appear:function(speed,callback){return this.fadeIn(speed,callback)},blindDown:function(speed,callback){return this.show("blind",{direction:"vertical"},speed,callback)},blindUp:function(speed,callback){return this.hide("blind",{direction:"vertical"},speed,callback)},blindRight:function(speed,callback){return this.show("blind",{direction:"horizontal"},speed,callback)},blindLeft:function(speed,callback){this.hide("blind",{direction:"horizontal"},speed,callback);return this},dropOut:function(speed,callback){return this.hide("drop",{direction:"down"},speed,callback)},dropIn:function(speed,callback){return this.show("drop",{direction:"up"},speed,callback)},fade:function(speed,callback){return this.fadeOut(speed,callback)},fadeToggle:function(speed,callback){return this.animate({opacity:"toggle"},speed,callback)},fold:function(speed,callback){return this.hide("fold",{},speed,callback)},foldOut:function(speed,callback){return this.show("fold",{},speed,callback)},grow:function(speed,callback){return this.show("scale",{},speed,callback)},highlight:function(speed,callback){return this.show("highlight",{},speed,callback)},puff:function(speed,callback){return this.hide("puff",{},speed,callback)},pulsate:function(speed,callback){return this.show("pulsate",{},speed,callback)},shake:function(speed,callback){return this.show("shake",{},speed,callback)},shrink:function(speed,callback){return this.hide("scale",{},speed,callback)},squish:function(speed,callback){return this.hide("scale",{origin:["top","left"]},speed,callback)},slideUp:function(speed,callback){return this.hide("slide",{direction:"up"},speed,callback)},slideDown:function(speed,callback){return this.show("slide",{direction:"up"},speed,callback)},switchOff:function(speed,callback){return this.hide("clip",{},speed,callback)},switchOn:function(speed,callback){return this.show("clip",{},speed,callback)}})})(jQuery);

/**
 * Liquid Canvas jQuery Plugin 
 * 
 * Version 0.3
 *
 * Steffen Rusitschka  http://www.ruzee.com  MIT licensed
 */
(function($) {
  var canvasElements = [];
  var pollCounter = 0;
  var plugins = {};

  function Area(canvas) {
    var stack = [];
    
    $.extend(this, {
      width: canvas.width, height: canvas.height, ctx: canvas.getContext("2d"),
      
      save: function() {
        this.ctx.save();
        stack.push({ width: this.width, height: this.height });
      },
      
      restore: function() {
        this.ctx.restore();
        $.extend(this, stack.pop());
      }
    });
  }
  
  var Plugin = (function() {
    var shrink = function(area, steps) {
      area.ctx.translate(steps, steps);
      area.width -= 2 * steps;
      area.height -= 2 * steps;
    };
    return {
      action:{ paint:function(){} },  // provide a NOP "plugin"
      shrink: shrink,
      defaultShrink: shrink,
      setAction: function(action) { this.action = action; }
    };
  })();
  
  function newPlugin(hash, opts) {
    return $.extend({}, Plugin, hash, { opts: opts, savedOpts: opts });
  }
  
  function pluginFromPlugins(plugins) {
    return newPlugin({
      paint: function(area) {
        area.save();
        this.action.opts = $.extend(true, this.action.savedOpts);
        $.each(plugins, function() { this.paint(area); });
        area.restore();
      },
      
      setAction: function(action) {
        this.action = action; // should call super if it existed ...
        $.each(plugins, function() { this.action = action; });
      }
    });
  }
  var pluginFromApplications = pluginFromPlugins; // it just does the same ...
  
  function pluginFromName(name, opts) {
    var plugin = plugins[name];
    if (!plugin) throw "Unknown plugin: " + name;
    opts = $.extend({}, plugin.defaultOpts || {}, opts);
    return newPlugin(plugin, opts);
  }
  
  function parse(s) {
    s += " ";
    var index = 0;
    
    function err(m) { msg = m + " at " + index + ": ..." + s.substring(index) + "\nin " + s; alert(msg); throw msg; }
    function cur() { return s.charAt(index); }
    function next() { if (index > s.length) throw("Unexpected end"); return s.charAt(index + 1) }
    function eat() { return s.charAt(index++); }
    function skipWhite() { while (/\s/.exec(cur())) eat(); }
    function check(c) {
      skipWhite(); 
      for (var i=0; i<c.length; ++i) {
        if (cur() != c.charAt(i)) err("Expected '" + c.charAt(i) + "' found '" + cur() + "'"); 
        eat();
      }
    }

    //var parseApplications; // forward reference
    
    function parseWord() {
      skipWhite();
      for (var word = []; /\w/.exec(cur()); word.push(eat()));
      return word.join("");
    }
    
    function parseNumber() {
      skipWhite();
      for (var n = []; /\d/.exec(cur()); n.push(eat()));
      return parseInt(n.join(""));
    }
    
    function parseString() {
      skipWhite();
      var s = [], start = cur();
      if (/[^\'\"]/.exec(start)) { err("String expected") }
      eat();
      while (cur() != start) { if (cur() == "\\") s.eat(); s.push(eat()); }
      check(start);
      return s.join("");
    }
    
    // Yeah, strange thing - this does the CSS value like parsing
    function parseValue() {
      skipWhite();
      for (var s = []; /[^;}]/.exec(cur()); s.push(eat()));
      return s.join("");
    }
    
    function parseLiteral() {
      skipWhite();
      if (/\d/.exec(cur())) return parseNumber();
      if (/['"]/.exec(cur())) return parseString();
      return parseValue();
    }
    
    function parseOpts() {
      check("{");
      skipWhite();
      var opts = {};
      while (cur() != "}") {
        var key = parseWord();
        check(":");
        opts[key] = parseLiteral();
        skipWhite();
        if (cur() == "}") break;
        check(";");
      }
      check("}");
      return opts;
    }
    
    function parsePlugin() {
      var name = parseWord();
      skipWhite();
      opts = cur() == "{" ? parseOpts() : {};
      return pluginFromName(name, opts);
    }
    
    function parsePlugins() {
      check("[");
      skipWhite();
      var plugins = [];
      while (cur() != "]") {
        plugins.push(parsePlugin());
        skipWhite();
      }
      check("]");
      return pluginFromPlugins(plugins);
    }

    function parseActors() {
      skipWhite();
      return cur() == "[" ? parsePlugins() : parsePlugin();
    }
    
    function parseAction() {
      var action;
      skipWhite();
      if (cur() == "(") {
        eat();
        action = parseApplications();
        check(")");
      } else {
        action = parsePlugin();
      }
      return action;
    }
    
    function parseApplication() {
      var actors = parseActors();
      check("=>");
      var action = parseAction();
      actors.setAction(action);
      return actors;
    }
    
    function parseApplications() {
      var applications = [];
      while (true) {
        applications.push(parseApplication());
        skipWhite();
        if (cur() != ",") break;
        check(",");
      }
      return pluginFromApplications(applications);
    }
    
    return parseApplications();
  }

  function checkResize(container, force) {
    var $container = $(container);
    var data = $container.data('liquid-canvas');
    if (!data) return;
    var canvas = data.canvas;
    var $canvas = $(canvas);
    var w = $container.outerWidth();
    var h = $container.outerHeight();
    
    if (force || 
        canvas.width != w || canvas.height != h ||
        canvas.offsetTop != container.offsetTop || canvas.offsetLeft != container.offsetLeft) {
      pollCounter = 100;
      $canvas.css({ left: container.offsetLeft + "px", top: container.offsetTop + "px" });
      canvas.width = w;
      canvas.height = h;
      var area = new Area(canvas);
      area.save();
      data.paint(area);
      area.restore();
    }
  }

  function checkAllResize(force) {
    $.each(canvasElements, function() { checkResize(this, force); });
  }

  function poll(){
    checkAllResize();
    pollCounter--;
    if (pollCounter < 0) {
      pollCounter = 0;
      setTimeout(poll, 1000);
    } else {
      setTimeout(poll, 1000 / 60);
    }
  }

  jQuery.fn.extend({
    liquidCanvas: function(func) {
      this.each(function() {
        var canvas;
        if (window.G_vmlCanvasManager) {
          $(this).before('<div width="0" height="0" style="position:absolute; top:0px; left:0px;"></div>');
          canvas = G_vmlCanvasManager.initElement($(this).prev("div").get(0));
        } else {
          $(this).before('<canvas width="0" height="0" style="position:absolute;top:0px;left:0px;"></canvas>');
          canvas = $(this).prev("canvas").get(0);
        }
        
        var paint;
        if ($.isFunction(func))
 						{
          		paint = func;
        		} 
				else 
						{
          		var plugin = parse(func);
          		paint = function(area) { plugin.paint(area); };
        		}
        
        $(this).data("liquid-canvas", {
          "canvas": canvas,
          "paint": paint
        });
        $(this).css({ background: "transparent" });
        if ($(this).css("position") != "absolute") $(this).css({ position: "relative" });
        
       canvasElements.push(this);
        checkResize(this, true);
      });
    }
  });
  
  jQuery.extend({
    registerLiquidCanvasPlugin: function(plugin) {
      plugins[plugin.name] = $.extend({}, Plugin, plugin);
    }
  });
  
  $(document).ready(checkAllResize);
  poll();
})(jQuery);


(function($) {

  $.registerLiquidCanvasPlugin({
    name: "rect",
    paint: function(area) {
      area.ctx.beginPath();
      area.ctx.rect(0, 0, area.width, area.height);
      area.ctx.closePath();
      if (this.action) this.action.paint(area);  // for chaining
    }
  });


  $.registerLiquidCanvasPlugin({
    name: "flatTopRightRound",
    defaultOpts: { radius:20 },
    paint: function(area) {
      var ctx = area.ctx;
      var opts = this.opts;
      ctx.beginPath();
      ctx.moveTo(0, opts.radius);
			//bottom left
      ctx.lineTo(0, area.height - opts.radius);
      ctx.quadraticCurveTo(0, area.height, opts.radius, area.height);
			//bottom right
      ctx.lineTo(area.width - opts.radius, area.height);
      ctx.quadraticCurveTo(area.width, area.height, area.width, area.height - opts.radius);

			//top right
      ctx.lineTo(area.width, 0);
      ctx.quadraticCurveTo(area.width, 0, area.width - opts.radius, 0);


			//top left
      ctx.lineTo(opts.radius, 0);
      ctx.quadraticCurveTo(0, 0, 0, opts.radius);
      ctx.closePath();

      if (this.action) this.action.paint(area);  // for chaining
    },
    shrink: function(area, steps) {
      this.defaultShrink(area, steps);
      this.opts.radius -= steps;
    }
  });



 $.registerLiquidCanvasPlugin({
   name: "Header",
   defaultOpts: { radius:20 },
   paint: function(area) {
     var ctx = area.ctx;
     var opts = this.opts;
     ctx.beginPath();
     ctx.moveTo(0, opts.radius);
			//bottom left
   /*  ctx.lineTo(-opts.radius, 0); 
     ctx.quadraticCurveTo(0, area.height, opts.radius, area.height);

			//bottom right
     ctx.lineTo(area.width - opts.radius, area.height);
     ctx.quadraticCurveTo(area.width, area.height, area.width, area.height - opts.radius);
		*/
		
		var xtraHeight = 20;
			//top right
     ctx.lineTo(area.width, opts.radius + 0);
     ctx.quadraticCurveTo(area.width, 0, area.width - opts.radius, 0);
			//top left
     ctx.lineTo(opts.radius, 0);
     ctx.quadraticCurveTo(0, 0, 0, opts.radius);

		 ctx.lineTo(0, opts.radius);
		 ctx.lineTo(0, opts.radius + xtraHeight);
		 ctx.lineTo(area.width, opts.radius + xtraHeight);
		
		 ctx.lineTo(area.width, opts.radius);
		 ctx.lineTo(0, opts.radius);
		

     ctx.closePath();
     area.ctx.fillStyle = "#1c1c1c" ;

     if (this.action) this.action.paint(area);  // for chaining
   },
   shrink: function(area, steps) {
     this.defaultShrink(area, steps);
     this.opts.radius -= steps;
   }
 });




  $.registerLiquidCanvasPlugin({
    name: "flatBottomRoundTop",
    defaultOpts: { radius:20 },
    paint: function(area) {
      var ctx = area.ctx;
      var opts = this.opts;
      ctx.beginPath();
      ctx.moveTo(0, opts.radius);
			//bottom left
      ctx.lineTo(0, area.height);
      ctx.quadraticCurveTo(0, area.height, opts.radius, area.height);

			//bottom right
      ctx.lineTo(area.width, area.height);
     // ctx.quadraticCurveTo(area.width, area.height, area.width, area.height - opts.radius);
			
			//top right
      ctx.lineTo(area.width, opts.radius);
      ctx.quadraticCurveTo(area.width, 0, area.width - opts.radius, 0);

			//top left
      ctx.lineTo(opts.radius, 0);
      ctx.quadraticCurveTo(0, 0, 0, opts.radius);

      ctx.closePath();
      if (this.action) this.action.paint(area);  // for chaining
    },
    shrink: function(area, steps) {
      this.defaultShrink(area, steps);
      this.opts.radius -= steps;
    }
  });

  $.registerLiquidCanvasPlugin({
    name: "roundedRect",
    defaultOpts: { radius:20 },
    paint: function(area) {
      var ctx = area.ctx;
      var opts = this.opts;
      ctx.beginPath();
      ctx.moveTo(0, opts.radius);
			//bottom left
      ctx.lineTo(0, area.height - opts.radius);
      ctx.quadraticCurveTo(0, area.height, opts.radius, area.height);
			//bottom right
      ctx.lineTo(area.width - opts.radius, area.height);
      ctx.quadraticCurveTo(area.width, area.height, area.width, area.height - opts.radius);
			//top right
      ctx.lineTo(area.width, opts.radius);
      ctx.quadraticCurveTo(area.width, 0, area.width - opts.radius, 0);
			//top left
      ctx.lineTo(opts.radius, 0);
      ctx.quadraticCurveTo(0, 0, 0, opts.radius);
      ctx.closePath();
      if (this.action) this.action.paint(area);  // for chaining
    },
    shrink: function(area, steps) {
      this.defaultShrink(area, steps);
      this.opts.radius -= steps;
    }
  });
  
  // This is a Liquid Canvas Plugin
  $.registerLiquidCanvasPlugin({
    name: "fill",
    defaultOpts: { color:"#aaa" },
    paint: function(area) {
      area.ctx.fillStyle = this.opts.color;
      this.action.paint(area);
      area.ctx.fill();
    }
  });

  $.registerLiquidCanvasPlugin({  // hmmmmmmm, no rotation? no width??? ah patterns!
    name: "image",
    defaultOpts: { url:"http://www.ruzee.com/files/liquid-canvas-image.png" },
    paint: function(area) {
      var image = new Image();
      image.src = this.opts.url;
      image.onload = function() { 
        area.ctx.drawImage(this, 0, 0); 
      };
    }
  });




  // This is a Liquid Canvas Plugin
  $.registerLiquidCanvasPlugin({
    name: "gradient",
    defaultOpts: { from: "#fff", to:"#666" },
    paint: function(area) {
      var grad = area.ctx.createLinearGradient(0, 0, 0, area.height);
      grad.addColorStop(0, this.opts.from);
      grad.addColorStop(1, this.opts.to);
      area.ctx.fillStyle = grad;
      this.action.paint(area);
      area.ctx.fill();
    }
  });
  // End of Liquid Canvas Plugin
  
  $.registerLiquidCanvasPlugin({
    name: "TopShadow",
    defaultOpts: { width:1, color:'#666', shift:-1},
    paint: function(area) {
      var sw = this.opts.width;
      area.ctx.fillStyle = this.opts.color; 
      area.ctx.globalAlpha = 1.0 / sw;

      for (var s = 0; s < sw; ++s) {
        this.action.paint(area);
        area.ctx.fill();
        this.action.shrink(area, 1);
      }

      area.ctx.globalAlpha = 1;
      area.ctx.translate(0, -this.opts.shift);
    }
  });


  $.registerLiquidCanvasPlugin({
    name: "shadow",
    defaultOpts: { width:3, color:'#000', shift:2 },
    paint: function(area) {
      var sw = this.opts.width;
      area.ctx.fillStyle = this.opts.color; 
      area.ctx.globalAlpha = 1.0 / sw;
      for (var s = 0; s < sw; ++s) {
        this.action.paint(area);
        area.ctx.fill();
        this.action.shrink(area, 1);
      }
      area.ctx.globalAlpha = 1;
      area.ctx.translate(0, -this.opts.shift);
    }
  });

  $.registerLiquidCanvasPlugin({
    name: "border",
    defaultOpts: { color:'#f80', width:3 },
    paint: function(area) {
      var bw = this.opts.width;
      area.ctx.strokeStyle = this.opts.color;
      area.ctx.lineWidth = bw;
      this.action.shrink(area, bw / 2);
      this.action.paint(area);
      area.ctx.stroke();
      this.action.shrink(area, bw / 2);
    }
  });

})(jQuery);


/* ------------------------------------------------------------------------
	Pretty Comments
	
	Developped By: Stephane Caron (http://www.no-margin-for-errors.com)
	Inspired By: The facebook textarea :)
	Version: 1.4
	
	Copyright: Feel free to redistribute the script/modify it, as
			   long as you leave my infos at the top.
------------------------------------------------------------------------- */

	$.fn.prettyComments = function(settings) {
		settings = jQuery.extend({
					animate: false, /* If you set it to true, cursor will dissapear in FF3 */
					animationSpeed: 'fast', /* fast/slow/normal */
					maxHeight : 500,
					alreadyAnimated: false, /* DONT CHANGE */
					init: true /* DONT CHANGE */
				}, settings);

		// Create the div in which the content will be copied
		$('body').append('<div id="comment_hidden"></div>');

		var setCSS = function(which){
			// Init the div for the current textarea
			$("#comment_hidden").css({
				'position':'absolute',
				'top': -10000,
				'left': -10000,
				'width': $(which).width(),
				'min-height': $(which).height(),
				'font-family': $(which).css('font-family'),
				'font-size': $(which).css('font-size'),
				'line-height': $(which).css('line-height')
			});
			
			if($.browser.msie && parseFloat($.browser.version) < 7){
				$("#comment_hidden").css('height',$(which).height());
			};
		};
		
		var copyContent = function(which){
			// Convert the line feeds into BRs
			theValue = $(which).attr('value') || "";
			theValue = theValue.replace(/\n/g,'<br />');
			
			$("#comment_hidden").html(theValue + '<br />');
			
			if(!settings.init){
				if($("#comment_hidden").height() > $(which).height()){
					if($('#comment_hidden').height() > settings.maxHeight){
						$(which).css('overflow-y','scroll');
					}else{
						$(which).css('overflow-y','hidden');
						expand(which);
					};
				}else if($("#comment_hidden").height() < $(which).height()){
					if($('#comment_hidden').height() > settings.maxHeight){
						$(which).css('overflow-y','scroll');
					}else{
						$(which).css('overflow-y','hidden');
						shrink(which);
					};
				};
			};
		};
		
		var expand = function(which){
			if(settings.animate && !settings.alreadyAnimated){
				settings.alreadyAnimated = true;
				$(which).animate({'height':$("#comment_hidden").height()},settings.animationSpeed,function(){
					settings.alreadyAnimated = false;
				});
			}else if(!settings.animate && !settings.alreadyAnimated){
				$(which).height($("#comment_hidden").height());
			};
		};
		
		var shrink = function(which){
			if(settings.animate && !settings.alreadyAnimated){
				settings.alreadyAnimated = true;
				$(which).animate({'height':$("#comment_hidden").height()},settings.animationSpeed,function(){
					settings.alreadyAnimated = false;
				});
			}else{
				$(which).height($("#comment_hidden").height());
			};
		};
		
		$(this).each(function(){
			$(this).css({
				'overflow':'hidden'
			})
			.bind('keyup',function(){
				copyContent($(this));
			});
			
			// Make sure all the content in the textarea is visible
			setCSS(this);
			copyContent($(this));
			
			if($("#comment_hidden").height() > settings.maxHeight){
				$(this).css({
					'overflow-y':'scroll',
					'height':settings.maxHeight
				});
			}else{
				$(this).height($("#comment_hidden").height());
			};
			
			settings.init = false;
		});
	};

/* ------------------------------------------------------------------------
	Class: prettyPopin
	Use: Alternative to popups
	Author: Stephane Caron (http://www.no-margin-for-errors.com)
	Version: 1.3
------------------------------------------------------------------------- */

var _followScroll = false;
var _readyBound = false;

(function($) {
	$.fn.prettyPopin = function(settings) {
		settings = jQuery.extend({
			modal : false, /* true/false */
			width : false, /* false/integer */
			height: false, /* false/integer */
			opacity: 0.5, /* value from 0 to 1 */
			animationSpeed: 'fast', /* slow/medium/fast/integer */
			followScroll: true, /* true/false */
			loader_path: 'images/prettyPopin/loader.gif', /* path to your loading image */
			callback: function(){} /* callback called when closing the popin */
		}, settings);

		function bindReady(){ // To bind them only once
			if(_readyBound) return;
			_readyBound = true;
			$(window).scroll(function(){ _centerPopin(); });
			$(window).resize(function(){ _centerPopin(); });
		};
		bindReady();
		
		return this.each(function(){
			var popinWidth;
			var popinHeight;
			var $c;
		
			$(this).click(function(){
				
				buildoverlay();
				buildpopin();
				$("div.prettyPopin").liquidCanvas("[border{color:black} fill{color:#fff}] => roundedRect");				
				
				// Load the content
				$.get($(this).attr('href'),function(responseText){
					$('.prettyPopin .prettyContent .prettyContent-container').html(responseText);
				
					// This block of code is used to calculate the width/height of the popin
					popinWidth = settings.width || $('.prettyPopin .prettyContent .prettyContent-container').width() + parseFloat($('.prettyPopin .prettyContent .prettyContent-container').css('padding-left')) + parseFloat($('.prettyPopin .prettyContent .prettyContent-container').css('padding-right'));
					$('.prettyPopin').width(popinWidth);
					popinHeight = settings.height || $('.prettyPopin .prettyContent .prettyContent-container').height() + parseFloat($('.prettyPopin .prettyContent .prettyContent-container').css('padding-top')) + parseFloat($('.prettyPopin .prettyContent .prettyContent-container').css('padding-bottom'));
					$('.prettyPopin').height(popinHeight);
				
					// Now reset the width/height
					$('.prettyPopin').height(45).width(45);
			//	 	$('#thisPopin').css("background-color","#fff");
			//	$('.prettyPopin').css("background-color","#fff");
				//	Nifty("#thisPopin","transparent");

					displayPopin();
				});
				return false;
			});

			var displayPopin = function() {
				var scrollPos = _getScroll();

				projectedTop = ($(window).height()/2) + scrollPos['scrollTop'] - (popinHeight/2);
				
				if(projectedTop < 0) {
					projectedTop = 10;
					_followScroll = false;
				}else{
					_followScroll = settings.followScroll;
				};

				$('.prettyPopin').animate({
					'top': projectedTop,
					'left': ($(window).width()/2) + scrollPos['scrollLeft'] - (popinWidth/2),
					'width' : popinWidth,
					'height' : popinHeight
				},settings.animationSpeed, function(){
					
					displayContent();
				});
			};
		
			var buildpopin = function() {
				$('body').append('<div id = "containPop"><div class="prettyPopin" id = "thisPopin" ><a href="#" id="b_close" rel="close"></a><div class="prettyContent"><img src="'+settings.loader_path+'" alt="Loading" class="loader" /><div class="prettyContent-container"></div></div></div></div>');
				
				//$('body').append('<div class = "dark_rounded"><div class='pp_pic_holder'><div class='pp_top'><div class='pp_left'></div><div class='pp_middle'></div><div class='pp_right'></div></div><div class='pp_content'><a href='#' class='pp_expand' title='Expand the image'>Expand</a><div class='pp_loaderIcon'></div><div class='hoverContainer'><a class='pp_next' href='#'>next</a><a class='pp_previous' href='#'>previous</a></div><div id='full_res'><img id='fullResImage' src='' /></div><div class='pp_details clearfix'><a class='pp_close' href='#'>Close</a><p class='pp_description'></p><div class='pp_nav'><a href='#' class='pp_arrow_previous'>Previous</a><p class='currentTextHolder'>0''0</p><a href='#' class='pp_arrow_next'>Next</a></div></div></div><div class='pp_bottom'><div class='pp_left'></div><div class='pp_middle'></div><div class='pp_right'></div></div></div></div>");
				$c = $('.prettyPopin .prettyContent .prettyContent-container'); // The content container
			//close button
			
			//__one
				$('.prettyPopin a[rel=close]:eq(0)').click(function(){ closeOverlay(); return false; });
			//close button
				var scrollPos = _getScroll();
			
				// Show the popin
				$('.prettyPopin').width(45).height(45).css({
					'top': ($(window).height()/2) + scrollPos['scrollTop'],
					'left': ($(window).width()/2) + scrollPos['scrollLeft']
				}).hide().fadeIn(settings.animationSpeed);
				
			};
		
			var buildoverlay = function() {
				$('body').append('<div id="overlay"></div>');
			
				// Set the proper height
				$('#overlay').css('height',$(document).height());
			
				// Fade it in
				$('#overlay').css('opacity',0).fadeTo(settings.animationSpeed,settings.opacity);
			
				if(!settings.modal){

					
					$('#overlay').click(function(){
						// close on click outside of box
						closeOverlay();
					});
				};
			};
			
			var displayContent = function() {
				
				$c.parent().find('.loader').hide();
				$c.parent().parent().find('#b_close').show();
				
				
				
				// here
				
				
				$("#overlay").css("z-index", "100");
				
				$("#containPop *").css("z-index", "11001");
				

				
				//	 	$('#thisPopin')
				
				
				$c.fadeIn(function(){
					// Focus on the first form input if there's one
					
					$(this).find('input[type=text]:first').trigger('focus');

					// Check for paging
					$('.prettyPopin a[rel=internal]').click(function(){
						$link = $(this);

						// Fade out the current content
						$c.fadeOut(function(){
							$c.parent().find('.loader').show();

							// Submit the form
							
							
							$.get($link.attr('href'),function(responseText){
								// Replace the content
								$c.html(responseText);

								_refreshContent($c);
							});
							
						});
						return false;
					});
				

					// Submit the form in ajax
					$('.prettyPopin form').bind('submit',function(){
						$theForm = $(this);
						// Fade out the current content
						$c.fadeOut(function(){
							$c.parent().find('.loader').show();
						
							// Submit the form
							$.post($theForm.attr('action'), $theForm.serialize(),function(responseText){
								// Replace the content
								$c.html(responseText);

								_refreshContent($c);
							});
						});
						return false;
					});
				});
				$('.prettyPopin a[rel=close]:gt(0)').click(function(){ closeOverlay(); return false; });
			};
	
			var _refreshContent = function(){
				var scrollPos = _getScroll();

				if(!settings.width)	popinWidth = $c.width() + parseFloat($c.css('padding-left')) + parseFloat($c.css('padding-right'));
				if(!settings.height) popinHeight = $c.height() + parseFloat($c.css('padding-top')) + parseFloat($c.css('padding-bottom'));

				projectedTop = ($(window).height()/2) + scrollPos['scrollTop'] - (popinHeight/2);
				if(projectedTop < 0) {
					projectedTop = 10;
					_followScroll = false;
				}else{
					_followScroll = settings.followScroll;
				};

				$('.prettyPopin').animate({
					'top': projectedTop,
					'left': ($(window).width()/2) + scrollPos['scrollLeft'] - (popinWidth/2),
					'width' : popinWidth,
					'height' : popinHeight
				}, settings.animationSpeed,function(){
					displayContent();
				});
			};
		
			var closeOverlay = function() {
				$('#overlay').fadeOut(settings.animationSpeed,function(){ $(this).remove(); });
				$("#containPop").fadeOut(settings.animationSpeed,function(){ $(this).remove(); });
			//$('.prettyPopin').fadeOut(settings.animationSpeed,function(){ $(this).remove(); settings.callback() });
			};
		});
	
		function _centerPopin(){
			if(!_followScroll) return;

			// Make sure the popin exist
			if(!$('.prettyPopin')) return;
			
			var scrollPos = _getScroll();

			if($.browser.opera) {
				windowHeight = window.innerHeight;
				windowWidth = window.innerWidth;
			}else{
				windowHeight = $(window).height();
				windowWidth = $(window).width();
			};

			projectedTop = ($(window).height()/2) + scrollPos['scrollTop'] - ($('.prettyPopin').height()/2);
			if(projectedTop < 0) {
				projectedTop = 10;
				_followScroll = false;
			}else{
				_followScroll = true;
			};

			$('.prettyPopin').css({
				'top': projectedTop,
				'left': ($(window).width()/2) + scrollPos['scrollLeft'] - ($('.prettyPopin').width()/2)
			});
		};
	
		function _getScroll(){
			scrollTop = window.pageYOffset || document.documentElement.scrollTop || 0;
			scrollLeft = window.pageXOffset || document.documentElement.scrollLeft || 0;
			return {scrollTop:scrollTop,scrollLeft:scrollLeft};
		};
	};
})(jQuery);





/* Created by: Alf Magne Kalleland :: www.dhtmlgoodies.com (C) www.dhtmlgoodies.com, November 2005 */

var currentlyActiveInputRef = false;
var currentlyActiveInputClassName = false;

function highlightActiveInput() {
  if(currentlyActiveInputRef) {
    currentlyActiveInputRef.className = currentlyActiveInputClassName;
  }
  currentlyActiveInputClassName = this.className;
  this.className = 'inputHighlighted';
  currentlyActiveInputRef = this;
}

function blurActiveInput() {
  this.className = currentlyActiveInputClassName;
}

function initInputHighlightScript() {
  var tags = ['INPUT','TEXTAREA'];
  for(tagCounter=0;tagCounter<tags.length;tagCounter++){
    var inputs = document.getElementsByTagName(tags[tagCounter]);
    for(var no=0;no<inputs.length;no++){
      if(inputs[no].className && inputs[no].className=='doNotHighlightThisInput')continue;
      if(inputs[no].tagName.toLowerCase()=='textarea' || (inputs[no].tagName.toLowerCase()=='input' &&

inputs[no].type.toLowerCase()=='text')){
        inputs[no].onfocus = highlightActiveInput;
        inputs[no].onblur = blurActiveInput;
      }
    }
  }
}