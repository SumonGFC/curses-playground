require 'curses'

=begin
Curses.init_screen
Curses.curs_set(0)  # Hide the cursor
Curses.stdscr.clear
Curses.stdscr.refresh

countdown_seconds = 5

begin
  countdown_seconds.downto(0) do |i|
    Curses.stdscr.clear
    Curses.stdscr.addstr("Countdown: #{i} seconds remaining")
    Curses.stdscr.refresh
    sleep 1
  end
ensure
  Curses.close_screen
end
=end


Curses.init_screen
begin
        if Curses.cols != 100
                Curses.addstr "Resizing window. Press any key to resize"
                Curses.getch
                Curses.resize(100, 100)
        end

        Curses.addstr "KB enconding: #{Curses.keyboard_encoding}\n"
        5.times { Curses.addstr "\nThis line is from .addstr. NUM COLS: #{Curses.cols}\n" }
        x = Curses.getch
        Curses.clear    # clears every position so subsequent calls to .refresh will repaint every position
        Curses.flash if x == 'x'
        # Curses.bkgd('_')      # fills background with underscores
        Curses.nocbreak         # waits for newline or carriage return to be entered -- stores input chars in buffer
        Curses.addstr 'COLOR' if Curses.can_change_color?
        Curses.getch
ensure
        Curses.close_screen
end
