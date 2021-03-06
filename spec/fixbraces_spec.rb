require 'fixbraces'
require_relative './fixtures/sample_text'

describe Fixbraces do
  let(:split_braces) { "- (void)someMethod\n{  \n    return;\n}" }
  let(:corrected_split_braces) { "- (void)someMethod {\n    return;\n}" }
  let(:paired_braces) { "@interface SomeClass ()\n{}  \n@end" }
  let(:corrected_paired_braces) { "@interface SomeClass () {}\n@end" }
  let(:input) { SampleText::INPUT }
  let(:expected) { SampleText::EXPECTED }

  describe "#fixbraces" do
    it "correctly puts the opening brace on the same line" do
      expect(Fixbraces.fixbraces split_braces).to eq corrected_split_braces
    end

    it "correctly puts paired empty braces on the opening line" do
      expect(Fixbraces.fixbraces paired_braces).to eq corrected_paired_braces
    end

    it "correctly puts paired empty braces on the opening line" do
      expect(Fixbraces.fixbraces paired_braces).to eq corrected_paired_braces
    end

    it "operates on strings with more than one correction to make" do
      expect(Fixbraces.fixbraces input).to eq expected
    end

    it "doesn't change text that is correctly formatted" do
      expect(Fixbraces.fixbraces corrected_split_braces).to be_nil
      expect(Fixbraces.fixbraces corrected_paired_braces).to be_nil
    end
  end

  context "Working with files" do

    before(:each) do
      tests_dir = Dir.pwd + "/tmp/spec/"

      if File.exists? tests_dir
        FileUtils.rm_rf tests_dir
      end

      FileUtils.mkdir_p tests_dir

      FileUtils.cp_r Dir.pwd + "/spec/fixtures/input/.", tests_dir
    end

    after(:each) do
      tests_dir = Dir.pwd + "/tmp/spec/"

      if File.exists? tests_dir
        FileUtils.rm_rf tests_dir
      end
    end

    describe "#process_file" do

      it "manages to update multiple files" do
        files = Dir.glob Dir.pwd + "/tmp/spec/*.{h,m}"
        files.each do |f|
          Fixbraces.process_file f
        end

        result = `diff -r --brief #{Dir.pwd + "/tmp/spec/"} #{Dir.pwd + "/spec/fixtures/expected/"}`
        expect(result).to eq ""
      end

      it 'should preserve the original file mode' do
        files = Dir.glob Dir.pwd + "/tmp/spec/*.{h,m}"
        files.each do |f|
          original_mode = File.new(f).stat.mode
          Fixbraces.process_file f
          new_mode = File.new(f).stat.mode

          expect(new_mode).to eq original_mode
        end
      end
    end

    describe "#dry_process_file" do
      it "returns the names of the files if changes could be applied" do
        files = Dir.glob Dir.pwd + "/tmp/spec/*.{h,m}"

        processed_files = Set.new
        files.each do |f|
          processed_file = Fixbraces.dry_process_file f
          unless processed_file
            next
          end
          processed_files.add (File.basename processed_file)
        end

        expected_processed_files = ["MasterViewController.h", "AppDelegate.m", "MasterViewController.m"].to_set

        expect(processed_files).to eq expected_processed_files
      end

      it 'should not change the contents of the files' do
        files = Dir.glob Dir.pwd + "/tmp/spec/*.{h,m}"
        files.each do |f|
          Fixbraces.dry_process_file f
        end

        result = `diff -r --brief #{Dir.pwd + "/tmp/spec/"} #{Dir.pwd + "/spec/fixtures/input/"}`
        expect(result).to eq ""
      end

    end

  end


end
