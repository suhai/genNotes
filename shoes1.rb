puts 'SHOES'
# Check out the Shoes online library for more details about shoes
# You should also checkout other GUI development options such as MacRuby/cocoa.

# # 1.
# Shoes.app { button 'Press Me' }


# # 2.
# Shoes.app do 
#   button("Press Me") do
#     alert Time.now
#   end
# end


# # 3
# Shoes.app do 
#   button("Get the time") do
#     alert Time.now
#   end

#   button 'Get a random number' do
#     alert rand 100
#   end
# end


# # 4
# Shoes.app(:width => 400, :height => 180) do 
#   button("Get the time", :top => 100, :left => 20) do
#     alert Time.now
#   end

#   button('Get a random number', :top => 100, :left => 150) do
#     alert rand 100
#   end
# end



# # 5
# Shoes.app(:width => 400, :height => 180) do 
#   button("Get the time", :top => 100, :left => 0.2) do
#     alert Time.now
#   end

#   button('Get a random number', :top => 0.5, :left => 0.5) do
#     alert rand 100
#   end
# end


# # 6
# Shoes.app(:width => 300, :height => 300) do 
#   flow :width => 280 do 
#     %w{ 7 8 9 / 4 5 6 * 1 2 3 + 0 C = -}.each do |key|
#       button key, :width => 70, :height => 70 do 
#         alert "You Pressed #{key}"
#       end
#     end
#   end
# end


# # 7
# Shoes.app(:width => 300, :height => 300) do 
#   flow :width => 0.9, :height => 0.8, :margin => 5 do 
#     %w{ 7 8 9 / 4 5 6 * 1 2 3 + 0 C = -}.each do |key|
#       button key, :width => 0.22, :height => 0.22 do 
#         alert "You Pressed #{key}"
#       end
#     end
#   end
# end


# # 8
# Shoes.app(:width => 300, :height => 300) do 
#   stack :width => 0.9, :height => 0.9 do 
#     %w{ 7 8 9 / 4 5 6 * 1 2 3 + 0 C = -}.each do |key|
#       button key, :width => 0.22, :height => 30 do 
#         alert "You Pressed #{key}"
#       end
#     end
#   end
# end


# # 9
# Shoes.app do 
#   oval :left => 10, :top => 10, :radius => 50
# end


# # 10
# Shoes.app do 
#   oval :left => 10, :top => 10, :radius => 50, :center => true
# end


# # 11
# Shoes.app do 
#   oval :left => 10, :top => 10, :radius => 50, :fill => red
# end


# # 12
# Shoes.app do 
#   oval :left => 10, :top => 10, :radius => 50, :fill => red, :stroke => blue
# end


# # 13
# Shoes.app do 
#   fill red
#   stroke blue
#   oval :left => 10, :top => 10, :radius => 50
#   oval :left => 110, :top => 70, :radius => 20
#   fill black 
#   stroke black 
#   oval :left => 160, :top => 80, :radius => 10
# end


# # 14
# Shoes.app do 
#   # Draw a line from 100, 150 to 250, 200
#   line 100, 150, 250, 200

#   # Draw a box at 50, 50 of width 150, height 75
#   rect 50, 50, 150, 75

#   # Draw a box at 210, 75 of width 250, height 100 and curved corners(radius 5)
#   rect 210, 75, 250, 100, 5

#   # Draw an arrow 20 pixels wide at 50, 50 with red fill
#   fill red 
#   arrow 50, 50, 20
# end


# # 15
# Shoes.app do 
#   fill "#f00"
#   stroke "#00f"
#   rect 50, 50, 50, 50
# end


# # 16
# Shoes.app do 
#   fill rgb(255, 0, 0) # or (1.0, 0, 0) using decimals
#   stroke rgb(0, 0, 255) # or (0, 0, 1.0) using decimals
#   rect 50, 50, 50, 50
# end


# # 17
# Shoes.app do 
#   stack :width => 150, :height => 1.0 do
#     para "This is some text."
#     para "This is another line of text."
#     para "Hello, world!"
#   end
# end


# # 18
# Shoes.app do 
#   stack do
#     title "My App!"
#     subtitle "It's a great app.."
#     para "Hello! This is a ", em("really"), " great app!."
#     para "How about some ", strong("bold"), " text?"
#   end
# end


# # 19
# Shoes.app do
#   para "Some ", em(strong("bold AND italic")), " text."
# end


# # 19
# Shoes.app do
#   stack do
#     para "Example 1", :font => "Helvetica bold 24px"
#     para "Example 2", :font => "Times"
#     para "Example 3", :weight => "bold", :size => "12pt"
#   end
# end


# # 20
# Shoes.app do 
#   background black
#   background rgb(0.7, 0.7, 0.7), :width => 150, :right => 150
#   background white, :height => 30
# end


# # 21
# Shoes.app do
#   background 'a.jpg'
# end


# # 22
# Shoes.app do
#   image 'a.jpg'
# end


# # 23
# Shoes.app do
#   @image1 = image "a.jpg"
#   button "Change image" do
#     @image1.path = "some_file_path"
#   end
# end


# # 24
# Shoes.app do
#   stack do
#     para "Please click ", link("http://www.tkldmonkey.com").click {alert "Yay!"}
#   end
# end


# # 25
# Shoes.app do
#   stack do
#     edit_line
#     edit_box :width => 100, height => 100
#   end
# end


# # 26
# Shoes.app do
#   @button = button("Press Me")
#   @button.click { alert Time.now }
# end


# # 27
# Shoes.app do
#   @button = button("Press Me")
#   @button.click { @button.move(rand, rand) }
# end


# # 28
# Shoes.app :height => 500, :width => 500 do
#   stack do
#     para "Type:"
#     @e = edit_box :width => 0.9, :height => 300
#     @chars = para "0 characters"\

#     @e.change do 
#       @chars.text = "#{@e.text.length} characters"
#     end 
#   end
# end


# # 28
# Shoes.app do 
#   @shape = rect 10, 10, 50, 50, :fill => red, :border => 0
#   motion do |x, y|
#     @shape.move x - 25, y - 25
#   end
# end



# # 29
# Shoes.app do 
#   @info = para "NO KEY is PRESSED."
#   keypress do |k|
#     @info.replace "#{k.inspect} was PRESSED."
#   end
# end


# # 30
# Shoes.app do 
#   @t = para "Hello, world!"

#   if confirm("Change text?")
#     @t.text = "Aw, shucks.."
#   end
# end



# # 31
# Shoes.app do 
#   @t = para "Hello, world!"
#   button "Change text" do
#     @t.text = ask("Change to what?")
#   end
# end



# # 32
# Shoes.app do 
#   fill red
#   @s = rect 100, 100, 50, 50
#   button "Change color of square" do
#     @s.fill = ask_color('Pick a color')
#   end
# end



# 33
Shoes.app(:width => 600, :height => 500) do
  stack do 
    flow do 
      @open_button = button "Open"
      @save_button = button "Save"
    end
    @t = edit_box :width => 0.9, :height => 400
  end

  @open_button.click do 
    @t.text = File.read(ask_open_file)
  end 
  @save_button.click do 
    File.new(ask_save_file, 'w') do |f|
      f.puts @t.text
    end
  end
end
