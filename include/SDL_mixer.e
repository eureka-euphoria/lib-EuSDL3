--EuSDLMixer3
--Written by Andy P.
--Copyright(c) 2026

include std/ffi.e
include std/machine.e
include std/os.e

include SDL.e

public atom mix = 0

ifdef WINDOWS then
	mix = open_dll("SDL3_mixer.dll")
	elsifdef LINUX or FREEBSD then
	mix = open_dll("libSDL3_mixer.so")
	elsifdef OSX then
	mix = open_dll("libSDL3_mixer.dylib")
end ifdef

if mix = -1 then
	puts(1,"Failed to losd SDL3_mixer!\n")
	abort(0)
end if

--printf(1,"%d",{mix})

public constant SDL_MIXER_MAJOR_VERSION = 3,
				SDL_MIXER_MINOR_VERSION = 1,
				SDL_MIXER_PATCHLEVEL = 2
				
public constant xMIX_Version = define_c_func(mix,"+MIX_Version",{},C_INT)

public function MIX_Version()
	return c_func(xMIX_Version,{})
end function

public constant xMIX_Init = define_c_func(mix,"+MIX_Init",{},C_BOOL)

public function MIX_Init()
	return c_func(xMIX_Init,{})
end function

public constant xMIX_Quit = define_c_proc(mix,"+MIX_Quit",{})

public procedure MIX_Quit()
	c_proc(xMIX_Quit,{})
end procedure

public constant xMIX_GetNumAudioDecoders = define_c_func(mix,"+MIX_GetNumAudioDecoders",{},C_INT)

public function MIX_GetNumAudioDecoders()
	return c_func(xMIX_GetNumAudioDecoders,{})
end function

public constant xMIX_GetAudioDecoder = define_c_func(mix,"+MIX_GetAudioDecoder",{C_INT},C_STRING)

public function MIX_GetAudioDecoder(atom index)
	return c_func(xMIX_GetAudioDecoder,{index})
end function

public constant xMIX_CreateMixerDevice = define_c_func(mix,"+MIX_CreateMixerDevice",{C_UINT32,C_POINTER},C_POINTER)

public function MIX_CreateMixerDevice(atom devid,atom spec)
	return c_func(xMIX_CreateMixerDevice,{devid,spec})
end function

public constant xMIX_CreateMixer = define_c_func(mix,"+MIX_CreateMixer",{C_POINTER},C_POINTER)

public function MIX_CreateMixer(atom spec)
	return c_func(xMIX_CreateMixer,{spec})
end function

public constant xMIX_DestroyMixer = define_c_proc(mix,"+MIX_DestroyMixer",{C_POINTER})

public procedure MIX_DestroyMixer(atom mixer)
	c_proc(xMIX_DestroyMixer,{mixer})
end procedure

public constant xMIX_GetMixerProperties = define_c_func(mix,"+MIX_GetMixerProperties",{C_POINTER},C_UINT32)

public function SDL_PropertiesID(atom mixer)
	return c_func(xMIX_GetMixerProperties,{mixer})
end function

public constant xMIX_GetMixerFormat = define_c_func(mix,"+MIX_GetMixerFormat",{C_POINTER,C_POINTER},C_BOOL)

public function MIX_GetMixerFormat(atom mixer,atom spec)
	return c_func(xMIX_GetMixerFormat,{mixer,spec})
end function

public constant xMIX_LoadAudio_IO = define_c_func(mix,"+MIX_LoadAudio_IO",{C_POINTER,C_POINTER,C_BOOL,C_BOOL},C_POINTER)

public function MIX_LoadAudio_IO(atom mixer,atom io,atom predecode,atom closeio)
	return c_func(xMIX_LoadAudio_IO,{mixer,io,predecode,closeio})
end function

public constant xMIX_LoadAudio = define_c_func(mix,"+MIX_LoadAudio",{C_POINTER,C_STRING,C_BOOL},C_POINTER)

public function MIX_LoadAudio(atom mixer,sequence path,atom predecode)
	return MIX_LoadAudio_IO(mixer,SDL_IOFromFile(path,"rb"),predecode,1)
end function

public constant xMIX_LoadAudioWithProperties = define_c_func(mix,"+MIX_LoadAudioWithProperties",{C_UINT32},C_POINTER)

public function MIX_LoadAudioWithProperties(atom props)
	return c_func(xMIX_LoadAudioWithProperties,{props})
end function

public constant MIX_PROP_AUDIO_LOAD_IOSTREAM_POINTER = "SDL_mixer.audio.load.iostream"
public constant MIX_PROP_AUDIO_LOAD_CLOSEIO_BOOLEAN = "SDL_mixer.audio.load.closeio"
public constant MIX_PROP_AUDIO_LOAD_PREDECODE_BOOLEAN = "SDL_mixer.audio.load.predecode"
public constant MIX_PROP_AUDIO_LOAD_PREFERRED_MIXER_POINTER = "SDL_mixer.audio.load.preferred_mixer"
public constant MIX_PROP_AUDIO_LOAD_SKIP_METADATA_TAGS_BOOLEAN = "SDL_mixer.audio.load.skip_metadata_tags"
public constant MIX_PROP_AUDIO_DECODER_STRING = "SDL_mixer.audio.decoder"

public constant xMIX_LoadRawAudio_IO = define_c_func(mix,"+MIX_LoadRawAudio_IO",{C_POINTER,C_POINTER,C_POINTER,C_BOOL},C_POINTER)

public function MIX_LoadRawAudio_IO(atom mixer,atom io,atom spec,atom closeio)
	return c_func(xMIX_LoadRawAudio_IO,{mixer,io,spec,closeio})
end function

public constant xMIX_LoadRawAudio = define_c_func(mix,"+MIX_LoadRawAudio",{C_POINTER,C_POINTER,C_SIZE_T,C_POINTER},C_POINTER)

public function MIX_LoadRawAudio(atom mixer,atom data,atom datalen,atom spec)
	return c_func(xMIX_LoadRawAudio,{mixer,data,datalen,spec})
end function

public constant xMIX_LoadRawAudioNoCopy = define_c_func(mix,"+MIX_LoadRawAudioNoCopy",{C_POINTER,C_POINTER,C_SIZE_T,C_POINTER,C_BOOL},C_POINTER)

public function MIX_LoadRawAudioNoCopy(atom mixer,atom data,atom datalen,atom spec,atom free_when_done)
	return c_func(xMIX_LoadRawAudioNoCopy,{mixer,data,datalen,spec,free_when_done})
end function

public constant xMIX_CreateSineWaveAudio = define_c_func(mix,"+MIX_CreateSineWaveAudio",{C_POINTER,C_INT,C_FLOAT,C_INT64},C_POINTER)

public function MIX_CreateSineWaveAudio(atom mixer,atom hz,atom amplitude,atom ms)
	return c_func(xMIX_CreateSineWaveAudio,{mixer,hz,amplitude,ms})
end function

public constant xMIX_GetAudioProperties = define_c_func(mix,"+MIX_GetAudioProperties",{C_POINTER},C_UINT32)

public function MIX_GetAudioProperties(atom audio)
	return c_func(xMIX_GetAudioProperties,{audio})
end function

public constant MIX_PROP_METADATA_TITLE_STRING = "SDL_mixer.metadata.title"
public constant MIX_PROP_METADATA_ARTIST_STRING =  "SDL_mixer.metadata.artist"
public constant MIX_PROP_METADATA_ALBUM_STRING = "SDL_mixer.metadata.album"
public constant MIX_PROP_METADATA_COPYRIGHT_STRING = "SDL_mixer.metadata.copyright"
public constant MIX_PROP_METADATA_TRACK_NUMBER = "SDL_mixer.metadata.track" 
public constant MIX_PROP_METADATA_TOTAL_TRACKS_NUMBER = "SDL_mixer.metadata.total_tracks"
public constant MIX_PROP_METADATA_YEAR_NUMBER = "SDL_mixer.metadata.year"
public constant MIX_PROP_METADATA_DURATION_FRAMES_NUMBER = "SDL_mixer.metadata.duration_frames"
public constant MIX_PROP_METADATA_DURATION_INFINITE_BOOLEAN = "SDL_mixer.metadata.duration_infinite"

public constant xMIX_GetAudioDuration = define_c_func(mix,"+MIX_GetAudioDuration",{C_POINTER},C_INT64)

public function MIX_GetAudioDuration(atom audio)
	return c_func(xMIX_GetAudioDuration,{audio})
end function

public constant MIX_DURATION_UNKNOWN = -1
public constant MIX_DURATION_INIFINTE = -2

public constant xMIX_GetAudioFormat = define_c_func(mix,"+MIX_GetAudioFormat",{C_POINTER,C_POINTER},C_BOOL)

public function MIX_GetAudioFormat(atom audio,atom spec)
	return c_func(xMIX_GetAudioFormat,{audio,spec})
end function

public constant xMIX_DestroyAudio = define_c_proc(mix,"+MIX_DestroyAudio",{C_POINTER})

public procedure MIX_DestroyAudio(atom audio)
	c_proc(xMIX_DestroyAudio,{audio})
end procedure

public constant xMIX_CreateTrack = define_c_func(mix,"+MIX_CreateTrack",{C_POINTER},C_POINTER)

public function MIX_CreateTrack(atom mixer)
	return c_func(xMIX_CreateTrack,{mixer})
end function

public constant xMIX_DestroyTrack = define_c_proc(mix,"+MIX_DestroyTrack",{C_POINTER})

public procedure MIX_DestroyTrack(atom track)
	c_proc(xMIX_DestroyTrack,{track})
end procedure

public constant xMIX_GetTrackProperties = define_c_func(mix,"+MIX_GetTrackProperties",{C_POINTER},C_UINT32)

public function MIX_GetTrackProperties(atom track)
	return c_func(xMIX_GetTrackProperties,{track})
end function

public constant xMIX_GetTrackMixer = define_c_func(mix,"+MIX_GetTrackMixer",{C_POINTER},C_POINTER)

public function MIX_GetTrackMixer(atom track)
	return c_func(xMIX_GetTrackMixer,{track})
end function

public constant xMIX_SetTrackAudio = define_c_func(mix,"+MIX_SetTrackAudio",{C_POINTER,C_POINTER},C_BOOL)

public function MIX_SetTrackAudio(atom track,atom audio)
	return c_func(xMIX_SetTrackAudio,{track,audio})
end function

public constant xMIX_SetTrackAudioStream = define_c_func(mix,"+MIX_SetTrackAudioStream",{C_POINTER,C_POINTER},C_BOOL)

public function MIX_SetTrackAudioStream(atom track,atom stream)
	return c_func(xMIX_SetTrackAudioStream,{track,stream})
end function

public constant xMIX_SetTrackIOStream = define_c_func(mix,"+MIX_SetTrackIOStream",{C_POINTER,C_POINTER,C_BOOL},C_BOOL)

public function MIX_SetTrackIOStream(atom track,atom io,atom closeio)
	return c_func(xMIX_SetTrackIOStream,{track,io,closeio})
end function

public constant xMIX_SetTrackRawIOStream = define_c_func(mix,"+MIX_SetTrackRawIOStream",{C_POINTER,C_POINTER,C_POINTER,C_BOOL},C_BOOL)

public function MIX_SetTrackRawIOStream(atom track,atom io,atom spec,atom closeio)
	return c_func(xMIX_SetTrackRawIOStream,{track,io,spec,closeio})
end function

public constant xMIX_TagTrack = define_c_func(mix,"+MIX_TagTrack",{C_POINTER,C_STRING},C_BOOL)

public function MIX_TagTrack(atom track,sequence tag)
	return c_func(xMIX_TagTrack,{track,tag})
end function

public constant xMIX_UntagTrack = define_c_proc(mix,"+MIX_UntagTrack",{C_POINTER,C_STRING})

public procedure MIX_UntagTrack(atom track,sequence tag)
	c_proc(xMIX_UntagTrack,{track,tag})
end procedure

public constant xMIX_GetTrackTags = define_c_func(mix,"+MIX_GetTrackTags",{C_POINTER,C_POINTER},C_STRING)

public function MIX_GetTrackTags(atom track,atom count)
	return c_func(xMIX_GetTrackTags,{track,count})
end function

public constant xMIX_GetTaggedTracks = define_c_func(mix,"+MIX_GetTaggedTracks",{C_POINTER,C_STRING,C_POINTER},C_POINTER)

public function MIX_GetTaggedTracks(atom mixer,sequence tag,atom count)
	return c_func(xMIX_GetTaggedTracks,{mixer,tag,count})
end function

public constant xMIX_SetTrackPlaybackPosition = define_c_func(mix,"+MIX_SetTrackPlaybackPosition",{C_POINTER,C_INT64},C_BOOL)

public function MIX_SetTrackPlaybackPosition(atom track,atom frames)
	return c_func(xMIX_SetTrackPlaybackPosition,{track,frames})
end function

public constant xMIX_GetTrackPlaybackPosition = define_c_func(mix,"+MIX_GetTrackPlaybackPosition",{C_POINTER},C_INT64)

public function MIX_GetTrackPlaybackPosition(atom track)
	return c_func(xMIX_GetTrackPlaybackPosition,{track})
end function

public constant xMIX_GetTrackFadeFrames = define_c_func(mix,"+MIX_GetTrackFadeFrames",{C_POINTER},C_INT64)

public function MIX_GetTrackFadeFrames(atom track)
	return c_func(xMIX_GetTrackFadeFrames,{track})
end function

public constant xMIX_GetTrackLoops = define_c_func(mix,"+MIX_GetTrackLoops",{C_POINTER},C_INT)

public function MIX_GetTrackLoops(atom track)
	return c_func(xMIX_GetTrackLoops,{track})
end function

public constant xMIX_SetTrackLoops = define_c_func(mix,"+MIX_SetTrackLoops",{C_POINTER,C_INT},C_BOOL)

public function MIX_SetTrackLoops(atom track,atom num_loops)
	return c_func(xMIX_SetTrackLoops,{track,num_loops})
end function

public constant xMIX_GetTrackAudio = define_c_func(mix,"+MIX_GetTrackAudio",{C_POINTER},C_POINTER)

public function MIX_GetTrackAudio(atom track)
	return c_func(xMIX_GetTrackAudio,{track})
end function

public constant xMIX_GetTrackAudioStream = define_c_func(mix,"+MIX_GetTrackAudioStream",{C_POINTER},C_POINTER)

public function MIX_GetTrackAudioStream(atom track)
	return c_func(xMIX_GetTrackAudioStream,{track})
end function

public constant xMIX_GetTrackRemaining = define_c_func(mix,"+MIX_GetTrackRemaining",{C_POINTER},C_INT64)

public function MIX_GetTrackRemaining(atom track)
	return c_func(xMIX_GetTrackRemaining,{track})
end function

public constant xMIX_TrackMSToFrames = define_c_func(mix,"+MIX_TrackMSToFrames",{C_POINTER,C_INT64},C_INT64)

public function MIX_TrackMSToFrames(atom track,atom ms)
	return c_func(xMIX_TrackMSToFrames,{track,ms})
end function

public constant xMIX_TrackFramesToMS = define_c_func(mix,"+MIX_TrackFramesToMS",{C_POINTER,C_INT64},C_INT64)

public function MIX_TrackFramesToMS(atom track,atom frames)
	return c_func(xMIX_TrackFramesToMS,{track,frames})
end function

public constant xMIX_AudioMSToFrames = define_c_func(mix,"+MIX_AudioMSToFrames",{C_POINTER,C_INT64},C_INT64)

public function MIX_AudioMSToFrames(atom audio,atom ms)
	return c_func(xMIX_AudioMSToFrames,{audio,ms})
end function

public constant xMIX_AudioFramesToMS = define_c_func(mix,"+MIX_AudioFramesToMS",{C_POINTER,C_INT64},C_INT64)

public function MIX_AudioFramesToMS(atom audio,atom frames)
	return c_func(xMIX_AudioFramesToMS,{audio,frames})
end function

public constant xMIX_MSToFrames = define_c_func(mix,"+MIX_MSToFrames",{C_INT,C_INT64},C_INT64)

public function MIX_MSToFrames(atom sample_rate,atom ms)
	return c_func(xMIX_MSToFrames,{sample_rate,ms})
end function

public constant xMIX_FramesToMS = define_c_func(mix,"+MIX_FramesToMS",{C_INT,C_INT64},C_INT64)

public function MIX_FramesToMS(atom sample_rate,atom frames)
	return c_func(xMIX_FramesToMS,{sample_rate,frames})
end function

public constant xMIX_PlayTrack = define_c_func(mix,"+MIX_PlayTrack",{C_POINTER,C_UINT32},C_BOOL)

public function MIX_PlayTrack(atom track,atom options)
	return c_func(xMIX_PlayTrack,{track,options})
end function

public constant MIX_PROP_PLAY_LOOPS_NUMBER = "SDL_mixer.play.loops"
public constant MIX_PROP_PLAY_MAX_FRAME_NUMBER ="SDL_mixer.play.max_frame"
public constant MIX_PROP_PLAY_MAX_MILLISECONDS_NUMBER ="SDL_mixer.play.max_milliseconds"
public constant MIX_PROP_PLAY_START_FRAME_NUMBER ="SDL_mixer.play.start_frame"
public constant MIX_PROP_PLAY_START_MILLISECOND_NUMBER ="SDL_mixer.play.start_millisecond"
public constant MIX_PROP_PLAY_LOOP_START_FRAME_NUMBER ="SDL_mixer.play.loop_start_frame"
public constant MIX_PROP_PLAY_LOOP_START_MILLISECOND_NUMBER ="SDL_mixer.play.loop_start_millisecond"
public constant MIX_PROP_PLAY_FADE_IN_FRAMES_NUMBER ="SDL_mixer.play.fade_in_frames"
public constant MIX_PROP_PLAY_FADE_IN_MILLISECONDS_NUMBER ="SDL_mixer.play.fade_in_milliseconds"
public constant MIX_PROP_PLAY_FADE_IN_START_GAIN_FLOAT ="SDL_mixer.play.fade_in_start_gain"
public constant MIX_PROP_PLAY_APPEND_SILENCE_FRAMES_NUMBER ="SDL_mixer.play.append_silence_frames"
public constant MIX_PROP_PLAY_APPEND_SILENCE_MILLISECONDS_NUMBER ="SDL_mixer.play.append_silence_milliseconds"

public constant xMIX_PlayTag = define_c_func(mix,"+MIX_PlayTag",{C_POINTER,C_STRING,C_UINT32},C_BOOL)

public function MIX_PlayTag(atom mixer,sequence tag,atom options)
	return c_func(xMIX_PlayTag,{mixer,tag,options})
end function

public constant xMIX_PlayAudio = define_c_func(mix,"+MIX_PlayAudio",{C_POINTER,C_POINTER},C_BOOL)

public function MIX_PlayAudio(atom mixer,atom audio)
	return c_func(xMIX_PlayAudio,{mixer,audio})
end function

public constant xMIX_StopTrack = define_c_func(mix,"+MIX_StopTrack",{C_POINTER,C_INT64},C_BOOL)

public function MIX_StopTrack(atom track,atom fade_out_frames)
	return c_func(xMIX_StopTrack,{track,fade_out_frames})
end function

public constant xMIX_StopAllTracks = define_c_func(mix,"+MIX_StopAllTracks",{C_POINTER,C_INT64},C_BOOL)

public function MIX_StopAllTracks(atom mixer,atom fade_out_ms)
	return c_func(xMIX_StopAllTracks,{mixer,fade_out_ms})
end function

public constant xMIX_StopTag = define_c_func(mix,"+MIX_StopTag",{C_POINTER,C_STRING,C_INT64},C_BOOL)

public function MIX_StopTag(atom mixer,sequence tag,atom fade_out_ms)
	return c_func(xMIX_StopTag,{mixer,tag,fade_out_ms})
end function

public constant xMIX_PauseTrack = define_c_func(mix,"+MIX_PauseTrack",{C_POINTER},C_BOOL)

public function MIX_PauseTrack(atom track)
	return c_func(xMIX_PauseTrack,{track})
end function

public constant xMIX_PauseAllTracks = define_c_func(mix,"+MIX_PauseAllTracks",{C_POINTER},C_BOOL)

public function MIX_PauseAllTracks(atom mixer)
	return c_func(xMIX_PauseAllTracks,{mixer})
end function

public constant xMIX_PauseTag = define_c_func(mix,"+MIX_PauseTag",{C_POINTER,C_STRING},C_BOOL)

public function MIX_PauseTag(atom mixer,sequence tag)
	return c_func(xMIX_PauseTag,{mixer,tag})
end function

public constant xMIX_ResumeTrack = define_c_func(mix,"+MIX_ResumeTrack",{C_POINTER},C_BOOL)

public function MIX_ResumeTrack(atom track)
	return c_func(xMIX_ResumeTrack,{track})
end function

public constant xMIX_ResumeAllTracks = define_c_func(mix,"+MIX_ResumeAllTracks",{C_POINTER},C_BOOL)

public function MIX_ResumeAllTracks(atom mixer)
	return c_func(xMIX_ResumeAllTracks,{mixer})
end function

public constant xMIX_ResumeTag = define_c_func(mix,"+MIX_ResumeTag",{C_POINTER,C_STRING},C_BOOL)

public function MIX_ResumeTag(atom mixer,sequence tag)
	return c_func(xMIX_ResumeTag,{mixer,tag})
end function

public constant xMIX_TrackPlaying = define_c_func(mix,"+MIX_TrackPlaying",{C_POINTER},C_BOOL)

public function MIX_TrackPlaying(atom track)
	return c_func(xMIX_TrackPlaying,{track})
end function

public constant xMIX_TrackPaused = define_c_func(mix,"+MIX_TrackPaused",{C_POINTER},C_BOOL)

public function MIX_TrackPaused(atom track)
	return c_func(xMIX_TrackPaused,{track})
end function

public constant xMIX_SetMixerGain = define_c_func(mix,"+MIX_SetMixerGain",{C_POINTER,C_FLOAT},C_BOOL)

public function MIX_SetMixerGain(atom mixer,atom gain)
	return c_func(xMIX_SetMixerGain,{mixer,gain})
end function

public constant xMIX_GetMixerGain = define_c_func(mix,"+MIX_GetMixerGain",{C_POINTER},C_FLOAT)

public function MIX_GetMixerGain(atom mixer)
	return c_func(xMIX_GetMixerGain,{mixer})
end function

public constant xMIX_SetTrackGain = define_c_func(mix,"+MIX_SetTrackGain",{C_POINTER,C_FLOAT},C_BOOL)

public function MIX_SetTrackGain(atom track,atom gain)
	return c_func(xMIX_SetTrackGain,{track,gain})
end function

public constant xMIX_GetTrackGain = define_c_func(mix,"+MIX_GetTrackGain",{C_POINTER},C_FLOAT)

public function MIX_GetTrackGain(atom track)
	return c_func(xMIX_GetTrackGain,{track})
end function

public constant xMIX_SetTagGain = define_c_func(mix,"+MIX_SetTagGain",{C_POINTER,C_STRING,C_FLOAT},C_BOOL)

public function MIX_SetTagGain(atom mixer,sequence tag,atom gain)
	return c_func(xMIX_SetTagGain,{mixer,tag,gain})
end function

public constant xMIX_SetMixerFrequencyRatio = define_c_func(mix,"+MIX_SetMixerFrequencyRatio",{C_POINTER,C_FLOAT},C_BOOL)

public function MIX_SetMixerFrequencyRatio(atom mixer,atom ratio)
	return c_func(xMIX_SetMixerFrequencyRatio,{mixer,ratio})
end function

public constant xMIX_GetMixerFrequencyRatio = define_c_func(mix,"+MIX_GetMixerFrequencyRatio",{C_POINTER},C_FLOAT)

public function MIX_GetMixerFrequencyRatio(atom mixer)
	return c_func(xMIX_GetMixerFrequencyRatio,{mixer})
end function

public constant xMIX_SetTrackFrequencyRatio = define_c_func(mix,"+MIX_SetTrackFrequencyRatio",{C_POINTER,C_FLOAT},C_BOOL)

public function MIX_SetTrackFrequencyRatio(atom track,atom ratio)
	return c_func(xMIX_SetTrackFrequencyRatio,{track,ratio})
end function

public constant xMIX_GetTrackFrequencyRatio = define_c_func(mix,"+MIX_GetTrackFrequencyRatio",{C_POINTER},C_FLOAT)

public function MIX_GetTrackFrequencyRatio(atom track)
	return c_func(xMIX_GetTrackFrequencyRatio,{track})
end function

public constant xMIX_SetTrackOutputChannelMap = define_c_func(mix,"+MIX_SetTrackOutputChannelMap",{C_POINTER,C_POINTER,C_INT},C_BOOL)

public function MIX_SetTrackOutputChannelMap(atom track,atom chmap,atom count)
	return c_func(xMIX_SetTrackOutputChannelMap,{track,chmap,count})
end function

public constant MIX_StereoGains = define_c_struct({
	C_FLOAT, --left
	C_FLOAT  --right
})

public constant xMIX_SetTrackStereo = define_c_func(mix,"+MIX_SetTrackStereo",{C_POINTER,C_POINTER},C_BOOL)

public function MIX_SetTrackStereo(atom track,atom gains)
	return c_func(xMIX_SetTrackStereo,{track,gains})
end function

public constant MIX_Point3D = define_c_struct({
	C_FLOAT, --x
	C_FLOAT, --y
	C_FLOAT  --z
})

public constant xMIX_SetTrack3DPosition = define_c_func(mix,"+MIX_SetTrack3DPosition",{C_POINTER,C_POINTER},C_BOOL)

public function MIX_SetTrack3DPosition(atom track,atom pos)
	return c_func(xMIX_SetTrack3DPosition,{track,pos})
end function

public constant xMIX_GetTrack3DPosition = define_c_func(mix,"+MIX_GetTrack3DPosition",{C_POINTER,C_POINTER},C_BOOL)

public function MIX_GetTrack3DPosition(atom track,atom pos)
	return c_func(xMIX_GetTrack3DPosition,{track,pos})
end function

public constant xMIX_CreateGroup = define_c_func(mix,"+MIX_CreateGroup",{C_POINTER},C_POINTER)

public function MIX_CreateGroup(atom mixer)
	return c_func(xMIX_CreateGroup,{mixer})
end function

public constant xMIX_DestroyGroup = define_c_proc(mix,"+MIX_DestroyGroup",{C_POINTER})

public procedure MIX_DestroyGroup(atom group)
	c_proc(xMIX_DestroyGroup,{group})
end procedure

public constant xMIX_GetGroupProperties = define_c_func(mix,"+MIX_GetGroupProperties",{C_POINTER},C_UINT32)

public function MIX_GetGroupProperties(atom group)
	return c_func(xMIX_GetGroupProperties,{group})
end function

public constant xMIX_GetGroupMixer = define_c_func(mix,"+MIX_GetGroupMixer",{C_POINTER},C_POINTER)

public function MIX_GetGroupMixer(atom group)
	return c_func(xMIX_GetGroupMixer,{group})
end function

public constant xMIX_SetTrackGroup = define_c_func(mix,"+MIX_SetTrackGroup",{C_POINTER,C_POINTER},C_BOOL)

public function MIX_SetTrackGroup(atom track,atom group)
	return c_func(xMIX_SetTrackGroup,{track,group})
end function

--TODO: typedef void (SDLCALL *MIX_TrackStoppedCallback)(void *userdata, MIX_Track *track); CALLBACK

public constant xMIX_SetTrackStoppedCallback = define_c_func(mix,"+MIX_SetTrackStoppedCallback",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function MIX_SetTrackStoppedCallback(atom track,object cb,atom userdata)
	return c_func(xMIX_SetTrackStoppedCallback,{track,cb,userdata})
end function

--TODO: typedef void (SDLCALL *MIX_TrackMixCallback)(void *userdata, MIX_Track *track, const SDL_AudioSpec *spec, float *pcm, int samples); CALLBACK

public constant xMIX_SetTrackRawCallback = define_c_func(mix,"+MIX_SetTrackRawCallback",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function MIX_SetTrackRawCallback(atom track,object cb,atom userdata)
	return c_func(xMIX_SetTrackRawCallback,{track,cb,userdata})
end function

public constant xMIX_SetTrackCookedCallback = define_c_func(mix,"+MIX_SetTrackCookedCallback",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function MIX_SetTrackCookedCallback(atom track,object cb,atom userdata)
	return c_func(xMIX_SetTrackCookedCallback,{track,cb,userdata})
end function

--TODO: typedef void (SDLCALL *MIX_GroupMixCallback)(void *userdata, MIX_Group *group, const SDL_AudioSpec *spec, float *pcm, int samples); CALLBACK

public constant xMIX_SetGroupPostMixCallback = define_c_func(mix,"+MIX_SetGroupPostMixCallback",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function MIX_SetGroupPostMixCallback(atom group,object cb,atom userdata)
	return c_func(xMIX_SetGroupPostMixCallback,{group,cb,userdata})
end function

--TODO: typedef void (SDLCALL *MIX_PostMixCallback)(void *userdata, MIX_Mixer *mixer, const SDL_AudioSpec *spec, float *pcm, int samples); CALLBACK

public constant xMIX_SetPostMixCallback = define_c_func(mix,"+MIX_SetPostMixCallback",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function MIX_SetPostMixCallback(atom mixer,object cb,atom userdata)
	return c_func(xMIX_SetPostMixCallback,{mixer,cb,userdata})
end function

public constant xMIX_Generate = define_c_func(mix,"+MIX_Generate",{C_POINTER,C_POINTER,C_INT},C_BOOL)

public function MIX_Generate(atom mixer,object buffer,atom buflen)
	return c_func(xMIX_Generate,{mixer,buffer,buflen})
end function

public constant xMIX_CreateAudioDecoder = define_c_func(mix,"+MIX_CreateAudioDecoder",{C_STRING,C_UINT32},C_POINTER)

public function MIX_CreateAudioDecoder(sequence path,atom props)
	return c_func(xMIX_CreateAudioDecoder,{path,props})
end function

public constant xMIX_CreateAudioDecoder_IO = define_c_func(mix,"+MIX_CreateAudioDecoder_IO",{C_POINTER,C_BOOL,C_UINT32},C_POINTER)

public function MIX_CreateAudioDecoder_IO(atom io,atom closeio,atom props)
	return c_func(xMIX_CreateAudioDecoder_IO,{io,closeio,props})
end function

public constant xMIX_DestroyAudioDecoder = define_c_proc(mix,"+MIX_DestroyAudioDecoder",{C_POINTER})

public procedure MIX_DestroyAudioDecoder(atom audiodecoder)
	c_proc(xMIX_DestroyAudioDecoder,{audiodecoder})
end procedure

public constant xMIX_GetAudioDecoderProperties = define_c_func(mix,"+MIX_GetAudioDecoderProperties",{C_POINTER},C_UINT32)

public function MIX_GetAudioDecoderProperties(atom audiodecoder)
	return c_func(xMIX_GetAudioDecoderProperties,{audiodecoder})
end function

public constant xMIX_GetAudioDecoderFormat = define_c_func(mix,"+MIX_GetAudioDecoderFormat",{C_POINTER,C_POINTER},C_BOOL)

public function MIX_GetAudioDecoderFormat(atom audiodecoder,atom spec)
	return c_func(xMIX_GetAudioDecoderFormat,{audiodecoder,spec})
end function

public constant xMIX_DecodeAudio = define_c_func(mix,"+MIX_DecodeAudio",{C_POINTER,C_POINTER,C_INT,C_POINTER},C_INT)

public function MIX_DecodeAudio(atom audiodecoder,object buffer,atom buflen,atom spec)
	return c_func(xMIX_DecodeAudio,{audiodecoder,buffer,buflen,spec})
end function
­26.2