require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "CampfireBot" do
  let(:room) { mock("room") }

  let(:bot) do
    @bot = Campfire::Bot.new
    @bot.login { }
    @bot
  end

  before do
    campfire = mock("campfire")
    campfire.stub!(:find_room_by_name).and_return(room)
    @campfire = Tinder::Campfire.stub!(:new).and_return(campfire)
  end

  describe "Check that methods get called on the room object" do
    before do
      bot.on(/hey/) {|room, message| room.speak("test") }
      room.stub!(:speak)
    end

    after { bot.evaluate(message) }

    specify { room.should_receive(:speak) }
  end

  describe "Starting without configuring" do
    it "should raise an exception" do
      lambda do
        Campfire::Bot.new.start
      end.should raise_error(RuntimeError)
    end
  end

  private

  def message
    { :body => "hey" }
  end
end