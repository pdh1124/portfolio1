var replyService = (function() {
	function add(reply, callback, error) {
		$.ajax({
			type:'post',
			url: '/replies/new',
			data:JSON.stringify(reply),
			contentType: "application/json"
			
		});
	}
})