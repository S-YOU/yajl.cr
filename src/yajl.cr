require "./lib_yajl"

@[Link(ldflags: "-lyajl")]
lib LibYajl
  $stderr : Void*
  $stdout : Void*
  $stdin : Void*

  fun fread(ptr : Void*, size : Int32, nmemb : Int32, stream : Void*) : Int32
  fun fprintf(stream : Void*, format : UInt8*, ...) : Int32
end

class Yajl
  NULL = nil
  alias YajlType = LibYajl::YajlType

  def yajl_is_string(v)
    v ? v.value.type == YajlType::YajlTString : false
  end

  def yajl_get_string(v)
    yajl_is_string(v) ? v.value.u.string : ""
  end

  forward_missing_to LibYajl
end
