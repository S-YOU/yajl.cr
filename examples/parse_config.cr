require "yajl"

class YajlTest < Yajl
  def run : Int32
    fileData = uninitialized UInt8[65536]
    errbuf = uninitialized UInt8[1024]

    rd = fread(fileData.to_unsafe, 1, fileData.size - 1, stdin)

    node = yajl_tree_parse(fileData.to_unsafe, errbuf.to_unsafe, errbuf.size)

    unless node
      fprintf(stderr, "parse_error: ")
      return 1
    end

    path = ["Logging".to_unsafe, "timeFormat".to_unsafe]
    v = yajl_tree_get(node, path.to_unsafe, YajlType::YajlTString)
    if v
      printf("%s/%s: %s\n", path[0], path[1], yajl_get_string(v))
    else
      printf("no such node: %s/%s\n", path[0], path[1])
    end

    yajl_tree_free(node)

    0
  end
end

fun main(argc : Int32, argv : UInt8**) : Int32
  YajlTest.new.run
end

