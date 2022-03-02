/**
 * 
 */
let btn = document.getElementById('back-to-top');
		let docElm = document.documentElement;
		let docHeight = docElm.scrollHeight;
		let scrollPos = docElm.scrollTop;
		let offset;

		if (docHeight != 0) {
			offset = docHeight / 4;
		}

		window.addEventListener('scroll', function() {
			scrollPos = docElm.scrollTop;

			if (scrollPos > offset) {
				btn.className = 'visible';
			} else {
				btn.className = '';
			}
		});

		btn.addEventListener('click', function(e) {
			e.preventDefault();
			scrollToTop();
		});

		function scrollToTop() {
			let scrollInterval = setInterval(function() {
				if (scrollPos != 0) {
					window.scrollBy(0, -300);
				} else {
					clearInterval(scrollInterval);
				}
			}, 15);
		}