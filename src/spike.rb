require 'harvested'
require 'Qt4'
require 'Qt/qtruby4'

class HarvestConnection
  def get_todays_entries
    begin
      harvest = Harvest.client('agens', 'ajacobsen@agens.no', 'Kkc4i.PsNYpbfpJGWb2kwCLQW)VxwA')
      response = harvest.time.all
      print "\n\nAll: #{response.to_s}"
      response.each do |entry|
        print "\n\n#{entry.client} (#{entry.project}):#{entry.hours}\n \"#{entry.notes}\""
      end
      response
    rescue Exception => e
      print "Oh, snap! #{e.message}"
    end
  end
end

Qt::Application.new(ARGV) do
  Qt::Widget.new do

    self.window_title = 'Hello QtRuby v1.0'
    resize(200, 148)

    exit = Qt::PushButton.new('Exit', window) do
      setGeometry(10, 96, 180, 40)
      connect(SIGNAL :clicked) { Qt::Application.instance.quit }
    end

    spinner = Qt::SpinBox.new()

    label = Qt::Label.new('<big>Hello Qt in the Ruby way!</big>')

    self.layout = Qt::VBoxLayout.new do
      add_widget(label, 0, Qt::AlignCenter)
      addWidget(exit)
      addWidget(spinner)
    end

    show
  end

  exec
end


