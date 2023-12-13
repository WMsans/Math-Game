/// @description 
greeting_sentencenum=1;
greeting_sentence[1]="How can I help you?";
first_greeting=1;
after_greeting=0;

if(!instance_exists(obj_title_chatbubbles)){//创建打字机
	bob_inst=instance_create_layer(96,128,"greeting_character",obj_title_chatbubbles);
}else bob_inst=obj_title_chatbubbles;

