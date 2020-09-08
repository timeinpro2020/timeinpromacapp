require 'win32screenshot'
#require 'RMagick'
 
t = Time.now
str = t.strftime("%Y%m%d_%H%M%S")
 
# Take Foreground Screenshot
# width, height, bmp = Win32::Screenshot.foreground
# Take Desktop Screenshot

width, height, bmp = Win32::Screenshot.desktop

# Take Application Window Screenshot
# width, height, bmp = Win32::Screenshot.window(/Firefox/)
 
img_path = ARGV[0] || "file_#{str}.bmp"

File.open(img_path, "wb") {  |io| 
  io.write(bmp)
}
 
img = Magick::Image.from_blob(bmp)[0]
dir and spec number are defined outside
img_path = img_path + ".png" 
img.write(img_path)
