require 'fixbraces'

describe Fixbraces do
  let(:split_braces) { "- (void)someMethod\n{  \n    return;\n}" }
  let(:corrected_split_braces) { "- (void)someMethod {\n    return;\n}" }

  it "correctly puts the opening brace on the same line" do
    expect(Fixbraces.fixbraces split_braces).to eq corrected_split_braces
  end
end
