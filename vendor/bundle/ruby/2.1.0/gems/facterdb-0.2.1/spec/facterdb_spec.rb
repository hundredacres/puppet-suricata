require 'spec_helper'

describe 'FacterDB' do

  describe '#get_os_facts' do
    context 'without parameters' do
      subject { FacterDB.get_os_facts() }
      it "Should return an array of hashes with at least 1 element" do
        expect(subject.class).to eq Array
        expect(subject.size).not_to eq(0)
        expect(subject.select { |facts| facts.class != Hash }.size).to eq(0)
      end
    end
  end
end
