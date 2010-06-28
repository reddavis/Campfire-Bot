require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "CampfireBot" do
  before do
    @room = mock("room")
    campfire = mock("campfire")
    campfire.stub!(:find_room_by_name).and_return(@room)
    @campfire = Tinder::Campfire.stub!(:new).and_return(campfire)
    @bot = Campfire::Bot.new
    @bot.login {}
  end

  describe "Sending a message" do
    it "should send a message" do
      @room.should_receive(:speak)
      @bot.msg("hello")
    end
  end

  describe "Starting without configuring" do
    it "should raise an exception" do
      lambda do
        Campfire::Bot.new.start
      end.should raise_error(RuntimeError)
    end
  end
end
