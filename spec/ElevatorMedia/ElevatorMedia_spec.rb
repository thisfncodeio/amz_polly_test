require 'ElevatorMedia'

describe ElevatorMedia::Streamer do
    it 'Check if the getContent method returns a string which include div element' do 
        streamer = ElevatorMedia::Streamer.new
        output = streamer.getContent
        expect(output).to include("<div>", "</div>")
    end
end