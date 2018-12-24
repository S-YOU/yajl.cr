lib LibYajl
  YajlAllowComments         =  1
  YajlAllowMultipleValues   =  8
  YajlAllowPartialValues    = 16
  YajlAllowTrailingGarbage  =  4
  YajlDontValidateStrings   =  2
  YajlGenBeautify           =  1
  YajlGenEscapeSolidus      = 16
  YajlGenGenerationComplete =  4
  YajlGenInErrorState       =  3
  YajlGenIndentString       =  2
  YajlGenInvalidNumber      =  5
  YajlGenInvalidString      =  7
  YajlGenKeysMustBeStrings  =  1
  YajlGenNoBuf              =  6
  YajlGenPrintCallback      =  4
  YajlGenStatusOk           =  0
  YajlGenValidateUtf8       =  8
  YajlMaxDepthExceeded      =  2
  YajlStatusClientCanceled  =  1
  YajlStatusError           =  2
  YajlStatusOk              =  0
  YajlTAny                  =  8
  YajlTArray                =  4
  YajlTFalse                =  6
  YajlTNull                 =  7
  YajlTNumber               =  2
  YajlTObject               =  3
  YajlTString               =  1
  YajlTTrue                 =  5
  alias YajlFreeFunc = (Void*, Void* -> Void)
  alias YajlGenT = Void
  alias YajlHandleT = Void
  alias YajlMallocFunc = (Void*, LibC::Int -> Void*)
  alias YajlReallocFunc = (Void*, Void*, LibC::Int -> Void*)
  alias YajlVal = YajlValS*
  enum YajlGenOption
    YajlGenBeautify      =  1
    YajlGenIndentString  =  2
    YajlGenPrintCallback =  4
    YajlGenValidateUtf8  =  8
    YajlGenEscapeSolidus = 16
  end
  enum YajlGenStatus
    YajlGenStatusOk           = 0
    YajlGenKeysMustBeStrings  = 1
    YajlMaxDepthExceeded      = 2
    YajlGenInErrorState       = 3
    YajlGenGenerationComplete = 4
    YajlGenInvalidNumber      = 5
    YajlGenNoBuf              = 6
    YajlGenInvalidString      = 7
  end
  enum YajlOption
    YajlAllowComments        =  1
    YajlDontValidateStrings  =  2
    YajlAllowTrailingGarbage =  4
    YajlAllowMultipleValues  =  8
    YajlAllowPartialValues   = 16
  end
  enum YajlStatus
    YajlStatusOk             = 0
    YajlStatusClientCanceled = 1
    YajlStatusError          = 2
  end
  enum YajlType
    YajlTString = 1
    YajlTNumber = 2
    YajlTObject = 3
    YajlTArray  = 4
    YajlTTrue   = 5
    YajlTFalse  = 6
    YajlTNull   = 7
    YajlTAny    = 8
  end
  fun yajl_alloc(callbacks : YajlCallbacks*, afs : YajlAllocFuncs*, ctx : Void*) : YajlHandle
  fun yajl_complete_parse(hand : YajlHandle) : YajlStatus
  fun yajl_config(h : YajlHandle, opt : YajlOption, ...) : LibC::Int
  fun yajl_free(handle : YajlHandle)
  fun yajl_free_error(hand : YajlHandle, str : UInt8*)
  fun yajl_gen_alloc(alloc_funcs : YajlAllocFuncs*) : YajlGen
  fun yajl_gen_array_close(hand : YajlGen) : YajlGenStatus
  fun yajl_gen_array_open(hand : YajlGen) : YajlGenStatus
  fun yajl_gen_bool(hand : YajlGen, boolean : LibC::Int) : YajlGenStatus
  fun yajl_gen_clear(hand : YajlGen)
  fun yajl_gen_config(g : YajlGen, opt : YajlGenOption, ...) : LibC::Int
  fun yajl_gen_double(hand : YajlGen, number : LibC::Double) : YajlGenStatus
  fun yajl_gen_free(handle : YajlGen)
  fun yajl_gen_get_buf(hand : YajlGen, buf : UInt8**, len : LibC::Int*) : YajlGenStatus
  fun yajl_gen_integer(hand : YajlGen, number : LibC::LongLong) : YajlGenStatus
  fun yajl_gen_map_close(hand : YajlGen) : YajlGenStatus
  fun yajl_gen_map_open(hand : YajlGen) : YajlGenStatus
  fun yajl_gen_null(hand : YajlGen) : YajlGenStatus
  fun yajl_gen_number(hand : YajlGen, num : LibC::Char*, len : LibC::Int) : YajlGenStatus
  fun yajl_gen_reset(hand : YajlGen, sep : LibC::Char*)
  fun yajl_gen_string(hand : YajlGen, str : UInt8*, len : LibC::Int) : YajlGenStatus
  fun yajl_get_bytes_consumed : LibC::Int
  fun yajl_get_error(hand : YajlHandle, verbose : LibC::Int, json_text : UInt8*, json_text_length : LibC::Int) : UInt8*
  fun yajl_parse(hand : YajlHandle, json_text : UInt8*, json_text_length : LibC::Int) : YajlStatus
  fun yajl_status_to_string(code : YajlStatus) : LibC::Char*
  fun yajl_tree_free(v : YajlVal)
  fun yajl_tree_get(parent : YajlVal, path : LibC::Char**, type : YajlType) : YajlVal
  fun yajl_tree_parse(input : LibC::Char*, error_buffer : LibC::Char*, error_buffer_size : LibC::Int) : YajlVal
  fun yajl_version : LibC::Int

  struct YajlAllocFuncs
    malloc : YajlMallocFunc
    realloc : YajlReallocFunc
    free : YajlFreeFunc
    ctx : Void*
  end

  struct YajlCallbacks
    yajl_null : (Void* -> LibC::Int)
    yajl_boolean : (Void*, LibC::Int -> LibC::Int)
    yajl_integer : (Void*, LibC::LongLong -> LibC::Int)
    yajl_double : (Void*, LibC::Double -> LibC::Int)
    yajl_number : (Void*, LibC::Char*, LibC::Int -> LibC::Int)
    yajl_string : (Void*, UInt8*, LibC::Int -> LibC::Int)
    yajl_start_map : (Void* -> LibC::Int)
    yajl_map_key : (Void*, UInt8*, LibC::Int -> LibC::Int)
    yajl_end_map : (Void* -> LibC::Int)
    yajl_start_array : (Void* -> LibC::Int)
    yajl_end_array : (Void* -> LibC::Int)
  end

  struct YajlValS
    type : YajlType
    u : YajlValSU
  end

  struct YajlValSUArray
    values : YajlVal*
    len : LibC::Int
  end

  struct YajlValSUNumber
    i : LibC::LongLong
    d : LibC::Double
    r : LibC::Char*
    flags : LibC::UInt
  end

  struct YajlValSUObject
    keys : LibC::Char**
    values : YajlVal*
    len : LibC::Int
  end

  type YajlGen = Void*
  type YajlHandle = Void*

  union YajlValSU
    string : LibC::Char*
    number : YajlValSUNumber
    object : YajlValSUObject
    array : YajlValSUArray
  end
end
