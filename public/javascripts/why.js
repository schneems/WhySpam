	<script type="text/javascript">
		var Header = {
			// Let's write in JSON to make it more modular
			addFade : function(selector){
				$("<span class=\"fake-hover\"></span>").css("display", "none").prependTo($(selector)); 
				// Safari dislikes hide() for some reason
				$(selector+" a").bind("mouseenter",function(){
					$(selector+" .fake-hover").fadeIn("slow");
				});
				$(selector+" a").bind("mouseleave",function(){
					$(selector+" .fake-hover").hide();
				});
			}
		};

		$(function(){
			Header.addFade("#header");
		});
		$(function() {
				$('.ui-state-default').hover(
					function() { $(this).addClass('ui-state-hover'); }, 
					function() { $(this).removeClass('ui-state-hover'); }						
				);
				$('.nav-button').hover(
					function() { $(this).addClass('on'); }, 
					function() { $(this).removeClass('on'); }						
				);
				$('#dialog').dialog({
					autoOpen: false,
					modal: true ,
					resizable: false,
					show: 'scale' ,
					bgiframe: true,
					width: 600
				});
				$('#dialog_link').click(function(){
					$('#dialog').dialog('open');
					return false;
				});				
			});	
	</script>



<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
try {
var pageTracker = _gat._getTracker("UA-5070471-4");
pageTracker._trackPageview();
} catch(err) {}</script>

<script type="text/javascript">
  var uservoiceJsHost = ("https:" == document.location.protocol) ? "https://uservoice.com" : "http://cdn.uservoice.com";
  document.write(unescape("%3Cscript src='" + uservoiceJsHost + "/javascripts/widgets/tab.js' type='text/javascript'%3E%3C/script%3E"))
</script>
<script type="text/javascript">
UserVoice.Tab.show({ 
  key: 'whyspam',
  host: 'whyspam.uservoice.com', 
  forum: 'general', 
  alignment: 'left',
  background_color:'#f00', 
  text_color: 'white',
  hover_color: '#06C',
  lang: 'en'
})
</script>
