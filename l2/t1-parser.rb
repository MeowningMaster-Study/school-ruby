input = "(50,162) (62,123) (71,92) (82,73) (112,58)
(159,40) (217,34) (264,31) (299,29) (354,29)
(402,27) (435,32) (476,77) (489,97) (503,140)
(506,181) (508,219) (497,243) (483,248) (419,256)
(382,228) (370,199) (362,151) (342,125) (288,121)
(257,160) (248,211) (239,247) (207,267) (181,273)
(119,271) (101,250) (87,217) (105,188) (81,179)
(62,176)"

def parse(s)
  pairs = s.split(/\s/)
  regex = /\((\d+),(\d+)\)/
  pairs.map do |x|
    m = x.match(regex)
    { x: m[1].to_i, y: m[2].to_i }
  end
end

def print_geogebra(points)
  points.each { |p| puts "#{p[:x]},#{p[:y]}" }
end

POINTS = parse(input)

if $PROGRAM_NAME == __FILE__
  print_geogebra(POINTS)
end


