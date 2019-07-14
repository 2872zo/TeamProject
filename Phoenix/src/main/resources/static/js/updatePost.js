						function init(){
//							alert("스크립트 확인");
							CKEDITOR.replace('editor');
				
							CKEDITOR.on('dialogDefinition', function(ev) {
								var dialogName = ev.data.name;
								var dialogDefinition = ev.data.definition;
				
								switch (dialogName) {
								case 'image': //Image Properties dialog
									//dialogDefinition.removeContents('info');
									dialogDefinition.removeContents('Link');
									dialogDefinition.removeContents('advanced');
									break;
								}
							});

							var cafeURL = $("[name=cafeURL]").val();
							var postNo = $("[name=postNo]").val();
							var boardNo = $("[name=boardNo]").val();
							
							$("form").attr("method", "POST").attr("action",	"/cafe/" + cafeURL + "/updatePost/" + postNo );
				
							$(".boardOption").each(function(){
							    if($(this).val() == boardNo){
							      $(this).attr("selected","selected");
							    }
							});
				
							$("#submitButton").on("click",function(e){
								$("[name=boardName]").val( $("[name=boardNo] option:selected").text());
							});
						}
					
						init();
