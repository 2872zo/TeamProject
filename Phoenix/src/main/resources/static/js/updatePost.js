						$(function(){
							state.mainContent = "<script> fncGetReplyList(1); </script>" + $("#mainContent").html().trim();
							history.replaceState(state, state.cafeURL, "/cafe/" + state.cafeURL + "/getPost/" + state.postNo);
							
							$("[type='text'][name='postTitle']").val($("[type='hidden'][name='postTitle']").val());
							$("textarea[name=postContent]").val($("[type='hidden'][name='postContent']").val());
							
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

							$(".boardOption").each(function(){
							    if($(this).val() == state.boardNo){
							      $(this).attr("selected","selected");
							    }
							});
				
							$("#submitButton").on("click",function(e){
								$("[name=boardName]").val( $("[name=boardNo] option:selected").text());
								
								var formData = $("form").serializeArray();
								console.log($("[type=text][name=postTitle]").val());
								console.log($("textarea[name=postContent]").val());
								console.log(CKEDITOR.instances.editor.getData());
		
								console.log(formData);
								formData.splice(6,1);
								console.log(formData);
								formData.push({name : "postContent" , value : CKEDITOR.instances.editor.getData()});
								console.log(formData);
								
								$("#mainContent").remove();
								$("div.col-10").load("/cafe/" + state.cafeURL + "/updatePost/" + state.postNo + " #mainContent", formData, function(response, status, xhr){
									state.mainContent = response;
									
									history.pushState(state, state.cafeURL,"/cafe/" + state.cafeURL + "/updatePost/" + state.postNo);
								});
							});
						});
						
