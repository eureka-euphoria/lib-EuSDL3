--EuSDLImage3
--Written by Andy P.
--Copyright (c) 2026

include std/ffi.e
include std/machine.e
include std/os.e

public atom img

include SDL.e

ifdef WINDOWS then
	img = open_dll("SDL3_image.dll")
	elsifdef LINUX or FREEBSD then
	img = open_dll("libSDL3_image.so")
	elsifdef OSX then
	img = open_dll("libSDL3_image.dylib")
end ifdef

if img = 0 then
	puts(1,"Failed to load SDL_Image!\n")
	abort(0)
end if

public constant SDL_IMAGE_MAJOR_VERSION = 3,
				SDL_IMAGE_MINOR_VERSION = 4,
				SDL_IMAGE_PATCHLEVEL = 0
				
public constant xIMG_Version = define_c_func(img,"+IMG_Version",{},C_INT)

public function IMG_Version()
	return c_func(xIMG_Version,{})
end function

public constant xIMG_LoadTyped_IO = define_c_func(img,"+IMG_LoadTyped_IO",{C_POINTER,C_BOOL,C_STRING},C_POINTER)

public function IMG_LoadTyped_IO(atom src,atom closeio,sequence xtype)
	return c_func(xIMG_LoadTyped_IO,{src,closeio,xtype})
end function

public constant xIMG_Load_IO = define_c_func(img,"+IMG_Load_IO",{C_POINTER,C_BOOL},C_POINTER)

public function IMG_Load_IO(atom src,atom closeio)
	return c_func(xIMG_Load_IO,{src,closeio})
end function

public constant xIMG_Load = define_c_func(img,"+IMG_Load",{C_STRING},C_POINTER)

public function IMG_Load(sequence file)
	return c_func(xIMG_Load_IO,{file,0})
end function

public constant xIMG_LoadTexture_IO = define_c_func(img,"+IMG_LoadTexture_IO",{C_POINTER,C_POINTER,C_BOOL},C_POINTER)

public function IMG_LoadTexture_IO(atom rend,atom src,atom closeio)
	return c_func(xIMG_LoadTexture_IO,{rend,src,closeio})
end function

public constant xIMG_LoadTexture = define_c_func(img,"+IMG_LoadTexture",{C_POINTER,C_STRING},C_POINTER)

public function IMG_LoadTexture(atom rend,sequence file)
	return c_func(xIMG_LoadTexture_IO,{rend,file,0})
end function

public constant xIMG_LoadTextureTyped_IO = define_c_func(img,"+IMG_LoadTextureTyped_IO",{C_POINTER,C_POINTER,C_BOOL,C_STRING},C_POINTER)

public function IMG_LoadTextureTyped_IO(atom rend,atom src,atom closeio,sequence xtype)
	return c_func(xIMG_LoadTextureTyped_IO,{rend,closeio,xtype})
end function

public constant xIMG_isAVIF = define_c_func(img,"+IMG_isAVIF",{C_POINTER},C_BOOL)

public function IMG_isAVIF(atom src)
	return c_func(xIMG_isAVIF,{src})
end function

public constant xIMG_isICO = define_c_func(img,"+IMG_isICO",{C_POINTER},C_BOOL)

public function IMG_isICO(atom src)
	return c_func(xIMG_isICO,{src})
end function

public constant xIMG_isCUR = define_c_func(img,"+IMG_isCUR",{C_POINTER},C_BOOL)

public function IMG_isCUR(atom src)
	return c_func(xIMG_isCUR,{src})
end function

public constant xIMG_isBMP = define_c_func(img,"+IMG_isBMP",{C_POINTER},C_BOOL)

public function IMG_isBMP(atom src)
	return c_func(xIMG_isBMP,{src})
end function

public constant xIMG_isGIF = define_c_func(img,"+IMG_isGIF",{C_POINTER},C_BOOL)

public function IMG_isGIF(atom src)
	return c_func(xIMG_isGIF,{src})
end function

public constant xIMG_isJPG = define_c_func(img,"+IMG_isJPG",{C_POINTER},C_BOOL)

public function IMG_isJPG(atom src)
	return c_func(xIMG_isJPG,{src})
end function

public constant xIMG_isJXL = define_c_func(img,"+IMG_isJXL",{C_POINTER},C_BOOL)

public function IMG_isJXL(atom src)
	return c_func(xIMG_isJXL,{src})
end function

public constant xIMG_isLBM = define_c_func(img,"+IMG_isLBM",{C_POINTER},C_BOOL)

public function IMG_isLBM(atom src)
	return c_func(xIMG_isLBM,{src})
end function

public constant xIMG_isPCX = define_c_func(img,"+IMG_isPCX",{C_POINTER},C_BOOL)

public function IMG_isPCX(atom src)
	return c_func(xIMG_isPCX,{src})
end function

public constant xIMG_isPNG = define_c_func(img,"+IMG_isPNG",{C_POINTER},C_BOOL)

public function IMG_isPNG(atom src)
	return c_func(xIMG_isPNG,{src})
end function

public constant xIMG_isPNM = define_c_func(img,"+IMG_isPNM",{C_POINTER},C_BOOL)

public function IMG_isPNM(atom src)
	return c_func(xIMG_isPNM,{src})
end function

public constant xIMG_isSVG = define_c_func(img,"+IMG_isSVG",{C_POINTER},C_BOOL)

public function IMG_isSVG(atom src)
	return c_func(xIMG_isSVG,{src})
end function

public constant xIMG_isQOI = define_c_func(img,"+IMG_isQOI",{C_POINTER},C_BOOL)

public function IMG_isQOI(atom src)
	return c_func(xIMG_isQOI,{src})
end function

public constant xIMG_isTIF = define_c_func(img,"+IMG_isTIF",{C_POINTER},C_BOOL)

public function IMG_isTIF(atom src)
	return c_func(xIMG_isTIF,{src})
end function

public constant xIMG_isXCF = define_c_func(img,"+IMG_isXCF",{C_POINTER},C_BOOL)

public function IMG_isXCF(atom src)
	return c_func(xIMG_isXCF,{src})
end function

public constant xIMG_isXPM = define_c_func(img,"+IMG_isXPM",{C_POINTER},C_BOOL)

public function IMG_isXPM(atom src)
	return c_func(xIMG_isXPM,{src})
end function

public constant xIMG_isXV = define_c_func(img,"+IMG_isXV",{C_POINTER},C_BOOL)

public function IMG_isXV(atom src)
	return c_func(xIMG_isXV,{src})
end function

public constant xIMG_isWEBP = define_c_func(img,"+IMG_isWEBP",{C_POINTER},C_BOOL)

public function IMG_isWEBP(atom src)
	return c_func(xIMG_isWEBP,{src})
end function

public constant xIMG_LoadAVIF_IO = define_c_func(img,"+IMG_LoadAVIF_IO",{C_POINTER},C_POINTER)

public function IMG_LoadAVIF_IO(atom src)
	return c_func(xIMG_LoadAVIF_IO,{src})
end function

public constant xIMG_LoadICO_IO = define_c_func(img,"+IMG_LoadICO_IO",{C_POINTER},C_POINTER)

public function IMG_LoadICO_IO(atom src)
	return c_func(xIMG_LoadICO_IO,{src})
end function

public constant xIMG_LoadCUR_IO = define_c_func(img,"+IMG_LoadCUR_IO",{C_POINTER},C_POINTER)

public function IMG_LoadCUR_IO(atom src)
	return c_func(xIMG_LoadCUR_IO,{src})
end function

public constant xIMG_LoadBMP_IO = define_c_func(img,"+IMG_LoadBMP_IO",{C_POINTER},C_POINTER)

public function IMG_LoadBMP_IO(atom src)
	return c_func(xIMG_LoadBMP_IO,{src})
end function

public constant xIMG_LoadGIF_IO = define_c_func(img,"+IMG_LoadGIF_IO",{C_POINTER},C_POINTER)

public function IMG_LoadGIF_IO(atom src)
	return c_func(xIMG_LoadGIF_IO,{src})
end function

public constant xIMG_LoadJPG_IO = define_c_func(img,"+IMG_LoadJPG_IO",{C_POINTER},C_POINTER)

public function IMG_LoadJPG_IO(atom src)
	return c_func(xIMG_LoadJPG_IO,{src})
end function

public constant xIMG_LoadJXL_IO = define_c_func(img,"+IMG_LoadJXL_IO",{C_POINTER},C_POINTER)

public function IMG_LoadJXL_IO(atom src)
	return c_func(xIMG_LoadJXL_IO,{src})
end function

public constant xIMG_LoadLBM_IO = define_c_func(img,"+IMG_LoadLBM_IO",{C_POINTER},C_POINTER)

public function IMG_LoadLBM_IO(atom src)
	return c_func(xIMG_LoadLBM_IO,{src})
end function

public constant xIMG_LoadPCX_IO = define_c_func(img,"+IMG_LoadPCX_IO",{C_POINTER},C_POINTER)

public function IMG_LoadPCX_IO(atom src)
	return c_func(xIMG_LoadPCX_IO,{src})
end function

public constant xIMG_LoadPNG_IO = define_c_func(img,"+IMG_LoadPNG_IO",{C_POINTER},C_POINTER)

public function IMG_LoadPNG_IO(atom src)
	return c_func(xIMG_LoadPNG_IO,{src})
end function

public constant xIMG_LoadPNM_IO = define_c_func(img,"+IMG_LoadPNM_IO",{C_POINTER},C_POINTER)

public function IMG_LoadPNM_IO(atom src)
	return c_func(xIMG_LoadPNM_IO,{src})
end function

public constant xIMG_LoadSVG_IO = define_c_func(img,"+IMG_LoadSVG_IO",{C_POINTER},C_POINTER)

public function IMG_LoadSVG_IO(atom src)
	return c_func(xIMG_LoadSVG_IO,{src})
end function

public constant xIMG_LoadQOI_IO = define_c_func(img,"+IMG_LoadQOI_IO",{C_POINTER},C_POINTER)

public function IMG_LoadQOI_IO(atom src)
	return c_func(xIMG_LoadQOI_IO,{src})
end function

public constant xIMG_LoadTGA_IO = define_c_func(img,"+IMG_LoadTGA_IO",{C_POINTER},C_POINTER)

public function IMG_LoadTGA_IO(atom src)
	return c_func(xIMG_LoadTGA_IO,{src})
end function

public constant xIMG_LoadTIF_IO = define_c_func(img,"+IMG_LoadTIF_IO",{C_POINTER},C_POINTER)

public function IMG_LoadTIF_IO(atom src)
	return c_func(xIMG_LoadTIF_IO,{src})
end function

public constant xIMG_LoadXCF_IO = define_c_func(img,"+IMG_LoadXCF_IO",{C_POINTER},C_POINTER)

public function IMG_LoadXCF_IO(atom src)
	return c_func(xIMG_LoadXCF_IO,{src})
end function

public constant xIMG_LoadXPM_IO = define_c_func(img,"+IMG_LoadXPM_IO",{C_POINTER},C_POINTER)

public function IMG_LoadXPM_IO(atom src)
	return c_func(xIMG_LoadXPM_IO,{src})
end function

public constant xIMG_LoadXV_IO = define_c_func(img,"+IMG_LoadXV_IO",{C_POINTER},C_POINTER)

public function IMG_LoadXV_IO(atom src)
	return c_func(xIMG_LoadXV_IO,{src})
end function

public constant xIMG_LoadWEBP_IO = define_c_func(img,"+IMG_LoadWEBP_IO",{C_POINTER},C_POINTER)

public function IMG_LoadWEBP_IO(atom src)
	return c_func(xIMG_LoadWEBP_IO,{src})
end function

public constant xIMG_LoadSizedSVG_IO = define_c_func(img,"+IMG_LoadSizedSVG_IO",{C_POINTER,C_INT,C_INT},C_POINTER)

public function IMG_LoadSizedSVG_IO(atom src,atom width,atom height)
	return c_func(xIMG_LoadSizedSVG_IO,{src,width,height})
end function

public constant xIMG_ReadXPMFromArray = define_c_func(img,"+IMG_ReadXPMFromArray",{C_POINTER},C_POINTER)

public function IMG_ReadXPMFromArray(atom xpm)
	return c_func(xIMG_ReadXPMFromArray,{xpm})
end function

public constant xIMG_ReadXPMFromArrayToRGB888 = define_c_func(img,"+IMG_ReadXPMFromArrayToRGB888",{C_POINTER},C_POINTER)

public function IMG_ReadXPMFromArrayToRGB888(atom xpm)
	return c_func(xIMG_ReadXPMFromArrayToRGB888,{xpm})
end function

public constant xIMG_SaveAVIF = define_c_func(img,"+IMG_SaveAVIF",{C_POINTER,C_STRING,C_INT},C_BOOL)

public function IMG_SaveAVIF(atom surface,sequence file,atom quality)
	return c_func(xIMG_SaveAVIF,{surface,file,quality})
end function

public constant xIMG_SaveAVIF_IO = define_c_func(img,"+IMG_SaveAVIF_IO",{C_POINTER,C_POINTER,C_BOOL,C_INT},C_BOOL)

public function IMG_SaveAVIF_IO(atom surface,atom dst,atom closeio,atom quality)
	return c_func(xIMG_SaveAVIF_IO,{surface,dst,closeio,quality})
end function

public constant xIMG_SavePNG_IO = define_c_func(img,"+IMG_SavePNG_IO",{C_POINTER,C_POINTER,C_BOOL},C_BOOL)

public function IMG_SavePNG_IO(atom surface,atom dst,atom closeio)
	return c_func(xIMG_SavePNG_IO,{surface,dst,closeio})
end function

public constant xIMG_SavePNG = define_c_func(img,"+IMG_SavePNG",{C_POINTER,C_STRING},C_BOOL)

public function IMG_SavePNG(atom surface,sequence file)
	return c_func(xIMG_SavePNG_IO,{surface,file,0})
end function

public constant xIMG_SaveJPG_IO = define_c_func(img,"+IMG_SaveJPG_IO",{C_POINTER,C_POINTER,C_BOOL,C_INT},C_BOOL)

public function IMG_SaveJPG_IO(atom surface,atom dst,atom closeio,atom quality)
	return c_func(xIMG_SaveJPG_IO,{surface,dst,closeio,quality})
end function

public constant xIMG_SaveJPG = define_c_func(img,"+IMG_SaveJPG",{C_POINTER,C_STRING,C_INT},C_BOOL)

public function IMG_SaveJPG(atom surface,sequence file,atom quality)
	return c_func(xIMG_SaveJPG_IO,{surface,file,0,quality})
end function

public constant IMG_Animation = define_c_struct({
	C_INT,C_INT, --w,h
	C_INT, --count
	C_POINTER, --frames
	C_POINTER --delays
})

public constant xIMG_LoadAnimation_IO = define_c_func(img,"+IMG_LoadAnimation_IO",{C_POINTER,C_BOOL},C_POINTER)

public function IMG_LoadAnimation_IO(atom src,atom closeio)
	return c_func(xIMG_LoadAnimation_IO,{src,closeio})
end function

public constant xIMG_LoadAnimation = define_c_func(img,"+IMG_LoadAnimation",{C_STRING},C_POINTER)

public function IMG_LoadAnimation(sequence file)
	return c_func(xIMG_LoadAnimation_IO,{file,0})
end function

public constant xIMG_LoadAnimationTyped_IO = define_c_func(img,"+IMG_LoadAnimationTyped_IO",{C_POINTER,C_BOOL,C_STRING},C_POINTER)

public function IMG_LoadAnimationTyped_IO(atom src,atom closeio,sequence xtype)
	return c_func(xIMG_LoadAnimationTyped_IO,{src,closeio,xtype})
end function

public constant xIMG_FreeAnimation = define_c_proc(img,"+IMG_FreeAnimation",{C_POINTER})

public procedure IMG_FreeAnimation(atom anim)
	c_proc(xIMG_FreeAnimation,{anim})
end procedure

public constant xIMG_LoadGIFAnimation_IO = define_c_func(img,"+IMG_LoadGIFAnimation_IO",{C_POINTER},C_POINTER)

public function IMG_LoadGIFAnimation_IO(atom src)
	return c_func(xIMG_LoadGIFAnimation_IO,{src})
end function

public constant xIMG_LoadWEBPAnimation_IO = define_c_func(img,"+IMG_LoadWEBPAnimation_IO",{C_POINTER},C_POINTER)

public function IMG_LoadWEBPAnimation_IO(atom src)
	return c_func(xIMG_LoadWEBPAnimation_IO,{src})
end function

public constant xIMG_GetClipboardImage = define_c_func(img,"+IMG_GetClipboardImage",{},C_POINTER)

public function IMG_GetClipboardImage()
	return c_func(xIMG_GetClipboardImage,{})
end function

public constant xIMG_isANI = define_c_func(img,"+IMG_isANI",{C_POINTER},C_BOOL)

public function IMG_isANI(atom src)
	return c_func(xIMG_isANI,{src})
end function

public constant xIMG_CreateAnimatedCursor = define_c_func(img,"+IMG_CreateAnimatedCursor",{C_POINTER,C_INT,C_INT},C_POINTER)

public function IMG_CreateAnimatedCursor(atom anim,atom hot_x,atom hot_y)
	return c_func(xIMG_CreateAnimatedCursor,{anim,hot_x,hot_y})
end function

public constant xIMG_Save = define_c_func(img,"+IMG_Save",{C_POINTER,C_STRING},C_BOOL)

public function IMG_Save(atom surface,sequence file)
	return c_func(xIMG_Save,{surface,file})
end function

public constant xIMG_SaveTyped_IO = define_c_func(img,"+IMG_SaveTyped_IO",{C_POINTER,C_POINTER,C_BOOL,C_STRING},C_BOOL)

public function IMG_SaveTyped_IO(atom surface,atom dst,atom closeio,sequence stype)
	return c_func(xIMG_SaveTyped_IO,{surface,dst,closeio,stype})
end function

public constant xIMG_SaveBMP = define_c_func(img,"+IMG_SaveBMP",{C_POINTER,C_STRING},C_BOOL)

public function IMG_SaveBMP(atom surface,sequence stype)
	return c_func(xIMG_SaveBMP,{surface,stype})
end function

public constant xIMG_SaveBMP_IO = define_c_func(img,"+IMG_SaveBMP_IO",{C_POINTER,C_POINTER,C_BOOL},C_BOOL)

public function IMG_SaveBMP_IO(atom surface,atom dst,atom closeio)
	return c_func(xIMG_SaveBMP_IO,{surface,dst,closeio})
end function

public constant xIMG_SaveCUR = define_c_func(img,"+IMG_SaveCUR",{C_POINTER,C_STRING},C_BOOL)

public function IMG_SaveCUR(atom surface,sequence stype)
	return c_func(xIMG_SaveCUR,{surface,stype})
end function

public constant xIMG_SaveCUR_IO = define_c_func(img,"+IMG_SaveCUR_IO",{C_POINTER,C_POINTER,C_BOOL},C_BOOL)

public function IMG_SaveCUR_IO(atom surface,atom dst,atom closeio)
	return c_func(xIMG_SaveCUR_IO,{surface,dst,closeio})
end function

public constant xIMG_SaveGIF = define_c_func(img,"+IMG_SaveGIF",{C_POINTER,C_STRING},C_BOOL)

public function IMG_SaveGIF(atom surface,sequence file)
	return c_func(xIMG_SaveGIF,{surface,file})
end function

public constant xIMG_SaveGIF_IO = define_c_func(img,"+IMG_SaveGIF_IO",{C_POINTER,C_POINTER,C_BOOL},C_BOOL)

public function IMG_SaveGIF_IO(atom surface,atom dst,atom closeio)
	return c_func(xIMG_SaveGIF_IO,{surface,dst,closeio})
end function

public constant xIMG_SaveICO = define_c_func(img,"+IMG_SaveICO",{C_POINTER,C_STRING},C_BOOL)

public function IMG_SaveICO(atom surface,sequence file)
	return c_func(xIMG_SaveICO,{surface,file})
end function

public constant xIMG_SaveICO_IO = define_c_func(img,"+IMG_SaveICO_IO",{C_POINTER,C_POINTER,C_BOOL},C_BOOL)

public function IMG_SaveICO_IO(atom surface,atom dst,atom closeio)
	return c_func(xIMG_SaveICO_IO,{surface,dst,closeio})
end function

--public constant xIMG_SaveJPG = define_c_func(img,"+IMG_SaveJPG",{C_POINTER,C_STRING,C_INT},C_BOOL)

--public function IMG_SaveJPG(atom surface,sequence file,atom quality)
--	return c_func(xIMG_SaveJPG,{surface,file,quality})
--end function

--public constant xIMG_SaveJPG_IO = define_c_func(img,"+IMG_SaveJPG_IO",{C_POINTER,C_POINTER,C_BOOL,C_INT},C_BOOL)

--public function IMG_SaveJPG_IO(atom surface,atom dst,atom closeio,atom quality)
--	return c_func(xIMG_SaveJPG_IO,{surface,dst,closeio,quality})
--end function

--public constant xIMG_SavePNG = define_c_func(img,"+IMG_SavePNG",{C_POINTER,C_STRING},C_BOOL)

--public function IMG_SavePNG(atom surface,sequence file)
--	return c_func(xIMG_SavePNG,{surface,file})
--end function

public constant xIMG_SaveTGA = define_c_func(img,"+IMG_SaveTGA",{C_POINTER,C_STRING},C_BOOL)

public function IMG_SaveTGA(atom surface,sequence file)
	return c_func(xIMG_SaveTGA,{surface,file})
end function

public constant xIMG_SaveTGA_IO = define_c_func(img,"+IMG_SaveTGA_IO",{C_POINTER,C_POINTER,C_BOOL},C_BOOL)

public function IMG_SaveTGA_IO(atom surface,atom dst,atom closeio)
	return c_func(xIMG_SaveTGA_IO,{surface,dst,closeio})
end function

public constant xIMG_SaveWEBP = define_c_func(img,"+IMG_SaveWEBP",{C_POINTER,C_STRING,C_FLOAT},C_BOOL)

public function IMG_SaveWEBP(atom surface,sequence file,atom quality)
	return c_func(xIMG_SaveWEBP,{surface,file,quality})
end function

public constant xIMG_SaveWEBP_IO = define_c_func(img,"+IMG_SaveWEBP_IO",{C_POINTER,C_POINTER,C_BOOL,C_FLOAT},C_BOOL)

public function IMG_SaveWEBP_IO(atom surface,atom dst,atom closeio,atom quality)
	return c_func(xIMG_SaveWEBP_IO,{surface,dst,closeio,quality})
end function

public constant xIMG_LoadGPUTexture = define_c_func(img,"+IMG_LoadGPUTexture",{C_POINTER,C_POINTER,C_STRING,C_POINTER,C_POINTER},C_POINTER)

public function IMG_LoadGPUTexture(atom device,atom copy_pass,sequence file,atom width,atom height)
	return c_func(xIMG_LoadGPUTexture,{device,copy_pass,file,width,height})
end function

public constant xIMG_LoadGPUTexture_IO = define_c_func(img,"+IMG_LoadGPUTexture_IO",{C_POINTER,C_POINTER,C_POINTER,C_BOOL,C_POINTER,C_POINTER},C_POINTER)

public function IMG_LoadGPUTexture_IO(atom device,atom copy_pass,atom src,atom closeio,atom width,atom height)
	return c_func(xIMG_LoadGPUTexture_IO,{device,copy_pass,src,closeio,width,height})
end function

public constant xIMG_LoadGPUTextureTyped_IO = define_c_func(img,"+IMG_LoadGPUTextureTyped_IO",{C_POINTER,C_POINTER,C_POINTER,C_BOOL,C_STRING,C_POINTER,C_POINTER},C_POINTER)

public function IMG_LoadGPUTextureTyped_IO(atom device,atom copy_pass,atom src,atom closeio,sequence stype,atom width,atom height)
	return c_func(xIMG_LoadGPUTextureTyped_IO,{device,copy_pass,src,closeio,stype,width,height})
end function

--public constant xIMG_LoadAnimation_IO = define_c_func(img,"+IMG_LoadAnimation_IO",{C_POINTER,C_BOOL},C_POINTER)

--public function IMG_LoadAnimation_IO(atom src,atom closeio)
--	return c_func(xIMG_LoadAnimation_IO,{src,closeio})
--end function

public constant xIMG_LoadAPNGAnimation_IO = define_c_func(img,"+IMG_LoadAPNGAnimation_IO",{C_POINTER},C_POINTER)

public function IMG_LoadAPNGAnimation_IO(atom src)
	return c_func(xIMG_LoadAPNGAnimation_IO,{src})
end function

public constant xIMG_LoadAVIFAnimation_IO = define_c_func(img,"+IMG_LoadAVIFAnimation_IO",{C_POINTER},C_POINTER)

public function IMG_LoadAVIFAnimation_IO(atom src)
	return c_func(xIMG_LoadAVIFAnimation_IO,{src})
end function

public constant xIMG_CreateAnimationDecoder = define_c_func(img,"+IMG_CreateAnimationDecoder",{C_STRING},C_POINTER)

public function IMG_CreateAnimationDecoder(sequence file)
	return c_func(xIMG_CreateAnimationDecoder,{file})
end function

public constant xIMG_CreateAnimationDecoder_IO = define_c_func(img,"+IMG_CreateAnimationDecoder_IO",{C_POINTER,C_BOOL,C_STRING},C_POINTER)

public function IMG_CreateAnimationDecoder_IO(atom src,atom closeio,sequence stype)
	return c_func(xIMG_CreateAnimationDecoder_IO,{src,closeio,stype})
end function

public constant xIMG_CreateAnimationDecoderWithProperties = define_c_func(img,"+IMG_CreateAnimationDecoderWithProperties",{C_UINT32},C_POINTER)

public function IMG_CreateAnimationDecoderWithProperties(atom props)
	return c_func(xIMG_CreateAnimationDecoderWithProperties,{props})
end function

public constant IMG_PROP_ANIMATION_DECODER_CREATE_FILENAME_STRING               = "SDL_image.animation_decoder.create.filename"
public constant IMG_PROP_ANIMATION_DECODER_CREATE_IOSTREAM_POINTER              = "SDL_image.animation_decoder.create.iostream"
public constant IMG_PROP_ANIMATION_DECODER_CREATE_IOSTREAM_AUTOCLOSE_BOOLEAN    = "SDL_image.animation_decoder.create.iostream.autoclose"
public constant IMG_PROP_ANIMATION_DECODER_CREATE_TYPE_STRING                   = "SDL_image.animation_decoder.create.type"
public constant IMG_PROP_ANIMATION_DECODER_CREATE_TIMEBASE_NUMERATOR_NUMBER     = "SDL_image.animation_decoder.create.timebase.numerator"
public constant IMG_PROP_ANIMATION_DECODER_CREATE_TIMEBASE_DENOMINATOR_NUMBER   = "SDL_image.animation_decoder.create.timebase.denominator"

public constant IMG_PROP_ANIMATION_DECODER_CREATE_AVIF_MAX_THREADS_NUMBER        ="SDL_image.animation_decoder.create.avif.max_threads"
public constant IMG_PROP_ANIMATION_DECODER_CREATE_AVIF_ALLOW_INCREMENTAL_BOOLEAN ="SDL_image.animation_decoder.create.avif.allow_incremental"
public constant IMG_PROP_ANIMATION_DECODER_CREATE_AVIF_ALLOW_PROGRESSIVE_BOOLEAN ="SDL_image.animation_decoder.create.avif.allow_progressive"
public constant IMG_PROP_ANIMATION_DECODER_CREATE_GIF_TRANSPARENT_COLOR_INDEX_NUMBER ="SDL_image.animation_encoder.create.gif.transparent_color_index"
public constant IMG_PROP_ANIMATION_DECODER_CREATE_GIF_NUM_COLORS_NUMBER          ="SDL_image.animation_encoder.create.gif.num_colors"

public constant xIMG_GetAnimationDecoderProperties = define_c_func(img,"+IMG_GetAnimationDecoderProperties",{C_POINTER},C_UINT32)

public function IMG_GetAnimationDecoderProperties(atom decoder)
	return c_func(xIMG_GetAnimationDecoderProperties,{decoder})
end function

public constant IMG_PROP_METADATA_IGNORE_PROPS_BOOLEAN              =   "SDL_image.metadata.ignore_props"
public constant IMG_PROP_METADATA_DESCRIPTION_STRING                =   "SDL_image.metadata.description"
public constant IMG_PROP_METADATA_COPYRIGHT_STRING                  =   "SDL_image.metadata.copyright"
public constant IMG_PROP_METADATA_TITLE_STRING                      =   "SDL_image.metadata.title"
public constant IMG_PROP_METADATA_AUTHOR_STRING                     =   "SDL_image.metadata.author"
public constant IMG_PROP_METADATA_CREATION_TIME_STRING              =   "SDL_image.metadata.creation_time"
public constant IMG_PROP_METADATA_FRAME_COUNT_NUMBER                =   "SDL_image.metadata.frame_count"
public constant IMG_PROP_METADATA_LOOP_COUNT_NUMBER                 =   "SDL_image.metadata.loop_count"

public constant xIMG_GetAnimationDecoderFrame = define_c_func(img,"+IMG_GetAnimationDecoderFrame",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function IMG_GetAnimationDecoderFrame(atom decoder,atom frame,atom duration)
	return c_func(xIMG_GetAnimationDecoderFrame,{decoder,frame,duration})
end function

public constant xIMG_GetAnimationDecoderStatus = define_c_func(img,"+IMG_GetAnimationDecoderStatus",{C_POINTER},C_INT)

public function IMG_GetAnimationDecoderStatus(atom decoder)
	return c_func(xIMG_GetAnimationDecoderStatus,{decoder})
end function

public constant xIMG_ResetAnimationDecoder = define_c_func(img,"+IMG_ResetAnimationDecoder",{C_POINTER},C_BOOL)

public function IMG_ResetAnimationDecoder(atom decoder)
	return c_func(xIMG_ResetAnimationDecoder,{decoder})
end function

public constant xIMG_CloseAnimationDecoder = define_c_func(img,"+IMG_CloseAnimationDecoder",{C_POINTER},C_BOOL)

public function IMG_CloseAnimationDecoder(atom decoder)
	return c_func(xIMG_CloseAnimationDecoder,{decoder})
end function

public constant xIMG_CreateAnimationEncoder = define_c_func(img,"+IMG_CreateAnimationEncoder",{C_STRING},C_POINTER)

public function IMG_CreateAnimationEncoder(sequence file)
	return c_func(xIMG_CreateAnimationEncoder,{file})
end function

public constant xIMG_CreateAnimationEncoder_IO = define_c_func(img,"+IMG_CreateAnimationEncoder_IO",{C_POINTER,C_BOOL,C_STRING},C_POINTER)

public function IMG_CreateAnimationEncoder_IO(atom dst,atom closeio,sequence stype)
	return c_func(xIMG_CreateAnimationEncoder_IO,{dst,closeio,stype})
end function

public constant xIMG_CreateAnimationEncoderWithProperties = define_c_func(img,"+IMG_CreateAnimationEncoderWithProperties",{C_UINT32},C_POINTER)

public function IMG_CreateAnimationEncoderWithProperties(atom props)
	return c_func(xIMG_CreateAnimationEncoderWithProperties,{props})
end function

public constant IMG_PROP_ANIMATION_ENCODER_CREATE_FILENAME_STRING               = "SDL_image.animation_encoder.create.filename"
public constant IMG_PROP_ANIMATION_ENCODER_CREATE_IOSTREAM_POINTER              = "SDL_image.animation_encoder.create.iostream"
public constant IMG_PROP_ANIMATION_ENCODER_CREATE_IOSTREAM_AUTOCLOSE_BOOLEAN    = "SDL_image.animation_encoder.create.iostream.autoclose"
public constant IMG_PROP_ANIMATION_ENCODER_CREATE_TYPE_STRING                   = "SDL_image.animation_encoder.create.type"
public constant IMG_PROP_ANIMATION_ENCODER_CREATE_QUALITY_NUMBER                = "SDL_image.animation_encoder.create.quality"
public constant IMG_PROP_ANIMATION_ENCODER_CREATE_TIMEBASE_NUMERATOR_NUMBER     = "SDL_image.animation_encoder.create.timebase.numerator"
public constant IMG_PROP_ANIMATION_ENCODER_CREATE_TIMEBASE_DENOMINATOR_NUMBER   = "SDL_image.animation_encoder.create.timebase.denominator"

public constant IMG_PROP_ANIMATION_ENCODER_CREATE_AVIF_MAX_THREADS_NUMBER        ="SDL_image.animation_encoder.create.avif.max_threads"
public constant IMG_PROP_ANIMATION_ENCODER_CREATE_AVIF_KEYFRAME_INTERVAL_NUMBER  ="SDL_image.animation_encoder.create.avif.keyframe_interval"
public constant IMG_PROP_ANIMATION_ENCODER_CREATE_GIF_USE_LUT_BOOLEAN            ="SDL_image.animation_encoder.create.gif.use_lut"

public constant xIMG_AddAnimationEncoderFrame = define_c_func(img,"+IMG_AddAnimationEncoderFrame",{C_POINTER,C_POINTER,C_UINT64},C_BOOL)

public function IMG_AddAnimationEncoderFrame(atom encoder,atom surface,atom duration)
	return c_func(xIMG_AddAnimationEncoderFrame,{encoder,surface,duration})
end function

public constant xIMG_CloseAnimationEncoder = define_c_func(img,"+IMG_CloseAnimationEncoder",{C_POINTER},C_BOOL)

public function IMG_CloseAnimationEncoder(atom encoder)
	return c_func(xIMG_CloseAnimationEncoder,{encoder})
end function

public enum type IMG_AnimationDecoderStatus
	IMG_DECODER_STATUS_INVALID = -1,
	IMG_DECODER_STATUS_OK = 0,
	IMG_DECODER_STATUS_FAILED,
	IMG_DECODER_STATUS_COMPLETE
end type
­663.28