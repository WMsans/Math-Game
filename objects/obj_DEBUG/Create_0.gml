if(!audio_group_is_loaded(audiogroup_mus)) audio_group_load(audiogroup_mus);
if(!audio_group_is_loaded(audiogroup_snd)) audio_group_load(audiogroup_snd);
global.mp_grid=0;

//setting pause
pause_surf=-1;
pause_surfbuffer=-1;
resw=1280;
resh=720;
