require 'journeylog'

describe JourneyLog do

subject(:journeylog) {described_class.new}

 describe "upon initialization" do
   it "creates an empty array variable to store journeys" do
    expect(journeylog.logbook).to eq []
   end
end

end