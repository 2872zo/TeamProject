/**
 * @license Copyright (c) 2003-2019, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	config.toolbarGroups = [
		{ name: 'document', groups: [ 'document', 'mode', 'doctools' ] },
		{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
		{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
		{ name: 'forms', groups: [ 'forms' ] },
		{ name: 'insert', groups: [ 'insert' ] },
		'/',
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
		{ name: 'links', groups: [ 'links' ] },
		'/',
		{ name: 'styles', groups: [ 'styles' ] },
		{ name: 'colors', groups: [ 'colors' ] },
		{ name: 'tools', groups: [ 'tools' ] },
		{ name: 'others', groups: [ 'others' ] },
		{ name: 'about', groups: [ 'about' ] }
	];

	config.removeButtons = 'NewPage,Save,Templates,Preview,Print,PasteText,PasteFromWord,Scayt,Form,Checkbox,Radio,TextField,Source,Textarea,Select,ImageButton,HiddenField,Button,Anchor,Unlink,Flash,Iframe,CreateDiv,BidiRtl,BidiLtr,Language,About';
	
	config.enterMode = CKEDITOR.ENTER_BR;		//엔터키 입력시 br 태그 변경
	config.shiftEnterMode = CKEDITOR.ENTER_P;	//엔터키 입력시 p 태그로 변경
	config.startupFocus = true;					// 시작시 포커스 설정
	config.allowedContent = true;				// 기본적인 html이 필터링으로 지워지는데 필터링을 하지 않는다.
	
	config.filebrowserImageUploadUrl = '/fileUpload';
	
	config.width = '100%';
	config.height = '500px';
	
	
	//이미지 플러그인 https://ckeditor.com/cke4/addon/image2
	config.extraPlugins = 'image2,youtube';
	
	//유튜브 플러그인 https://ckeditor.com/cke4/addon/youtube
	config.youtube_responsive = true;
	config.youtube_disabled_fields = ['chkControls'];
};
