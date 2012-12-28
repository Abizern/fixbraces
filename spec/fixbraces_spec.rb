require 'fixbraces'

describe Fixbraces do
  let(:split_braces) { "- (void)someMethod\n{  \n    return;\n}" }
  let(:corrected_split_braces) { "- (void)someMethod {\n    return;\n}" }
  let(:paired_braces) { "@interface SomeClass ()\n{}  \n@end" }
  let(:corrected_paired_braces) { "@interface SomeClass () {}\n@end" }

  it "correctly puts the opening brace on the same line" do
    expect(Fixbraces.fixbraces split_braces).to eq corrected_split_braces
  end

  it "correctly puts paired empty braces on the opening line" do
    expect(Fixbraces.fixbraces paired_braces).to eq corrected_paired_braces
  end

end
