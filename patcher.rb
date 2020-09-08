require 'fileutils'

class Patcher
    def initialize()
		sleep(4)
    	if File.directory? ARGV[0]
			file_data = File.read(ARGV[0]+"/PATCH.txt").split
			file_data.each { |item|
			    puts item
			    words_arr = item.strip.split('<')
			    if words_arr.length >= 2
	   	    	  FileUtils.mkdir_p ARGV[1]+"/"+words_arr[1]
			      FileUtils.mv(ARGV[0]+"/"+getURLFileName(words_arr[0]), ARGV[1]+"/"+words_arr[1]+"/"+getURLFileName(words_arr[0]))
			    else
			      FileUtils.mv(ARGV[0]+"/"+getURLFileName(words_arr[0]), ARGV[1]+"/"+getURLFileName(words_arr[0]))
			    end
			}
		end
		FileUtils.rm_rf(ARGV[0])
    end
  def getURLFileName(url)
      words_arr = url.split('/')
      return words_arr[words_arr.length-1]
  end
end
patcher = Patcher.new

# "/Users/mac/Library/tip/temp"
 # "/Users/mac/Documents/Patcher"