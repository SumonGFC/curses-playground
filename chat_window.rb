# frozen_string_literal: true

require 'curses'

HORIZONTAL = '─'.freeze
VERTICAL = '│'.freeze
TOP_LEFT = '┌'.freeze
TOP_RIGHT = '┐'.freeze
BOTTOM_LEFT = '└'.freeze
BOTTOM_RIGHT = '┘'.freeze
INTERSECTION = '┼'.freeze

Curses.init_screen
height = Curses.lines / 3
width = Curses.cols / 3 

win1 = Curses::Window.new(height, width - 1, height, 0)
win1.box('|', '~')

win2 = Curses::Window.new(height, width - 1, height, width + 2)
win2.box('|', '~')

win3 = Curses::Window.new(height, width - 1, height, 2*width + 2)
win3.box('|', '~')

win1.refresh
win2.refresh
win3.refresh
=begin
win.addstr(TOP_LEFT + HORIZONTAL*(width - 2) + TOP_RIGHT)
1.upto(height - 2) do |i|
        win.setpos(i, 0)
        win.addstr(VERTICAL + ' '*(width - 2) + VERTICAL)
end
win.setpos(height - 1, 0)
win.addstr(BOTTOM_LEFT + HORIZONTAL*(width - 2) + BOTTOM_RIGHT)
=end
win1.getstr
Curses.close_screen

=begin
def setup_windows
  Curses.init_screen
  Curses.curs_set(1) # Show cursor
  #Curses.noecho # Don't display input characters
  Curses.raw # Disable line buffering
  Curses.stdscr.keypad(true) # Enable special keys (like arrow keys)

  # Window dimensions and position
  max_y = Curses.lines
  max_x = Curses.cols
  @win_width = max_x / 2
  @win_height = max_y - 1

  # Create two windows
  @win1 = Curses::Window.new(@win_height, @win_width, 0, 0)
  @win2 = Curses::Window.new(@win_height, @win_width, 0, @win_width)

  # Set focus on the first window initially
  @focused_window = @win1
  @input_buffer = ''
end

def draw_windows
  @win1.clear
  @win2.clear

  # Draw input lines
  draw_input_line(@win1)
  draw_input_line(@win2)

  # Refresh windows
  @win1.refresh
  @win2.refresh
end

def draw_input_line(window)
  # Display input buffer in the bottom line
  window.setpos(@win_height - 1, 0)
  window.addstr(@input_buffer)
end

def handle_input
  loop do
    case @focused_window.getch
    when Curses::KEY_LEFT
      @focused_window = @win1
    when Curses::KEY_RIGHT
      @focused_window = @win2
    when 10 # Enter key
      @focused_window.setpos(@win_height - 1, 0)
      @focused_window.addstr(@input_buffer)
      @input_buffer = ""
    when 27 # ESC key to exit
      break
    else
      # Add the character to the input buffer
      @input_buffer += @focused_window.getch.chr
    end
    
    # Update the focused window
    draw_windows
  end
end

def main
  setup_windows
  draw_windows
  handle_input
ensure
  Curses.close_screen
end

main
=end
