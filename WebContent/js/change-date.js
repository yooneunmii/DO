var $year = $("#year"), //id가 year인 select요소
				$month = $("#month"), //id가 month인 select 요소
				$date = $("#date");  //id가 date인 select 요소
				
			$year.change(changeDate);  //year가 변경될때
			$month.change(changeDate); //month도 변경될때
			
			function changeDate(birthDate) {
				//alert("test");
				
				var year = $year.val();
				//alert(year);
				var month = $month.val();
				//alert(month);
				
				//moment는 날짜등의 계산을 편리하게 
				var selected = moment(year+"-"+month,"YYYY-M"); 
				//var selected = moment([year,month-1]); 
				//alert(selected);
				
				//그 달의 마지막 날을 계산
				var lastDate = selected.endOf("month").date();
				
				//alert(lastDate);
				//for문을 이용해서 그 날짜까지 option 객체 생성
				
				//기존의 opation요소들을 전부 지우기
				$date.empty();
				
				//for문을 이용해서 그 날짜까지 option 객체 생성
				for(var i = 1 ; i <= lastDate ; i++) {
					
					var $option = $("<option>").text(i);
					
					//만약 생일날과 i가 같다면
					if(birthDate==i) {
						$option.attr("selected","selected");
					}
					
					//option 객체 생성후 글자를 i 변수값으로 입력후 $date 요소의 마지막 자식요소로 붙임
					$option.appendTo($date);
				}
			}